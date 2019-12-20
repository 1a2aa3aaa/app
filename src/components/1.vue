<template>
  <div class="cen">
    <input class="yzen" placeholder="请输入验证码" type="text" v-model="yzm" />
    <div>
      <canvas id="identify" @click="freshCode" width="80" height="30"></canvas>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      yzm: "",
      width: 80,
      height: 30,
      code: "", //验证码
      codeRange: [], //验证码的范围
      canvas: 0,
      ctx: 0
    };
  },
  methods: {
    main() {
      this.canvas = document.querySelector("#identify");
      this.ctx = this.canvas.getContext("2d");
      this.randomColor();
      this.generateCodeRange();
      this.randomCode();
      this.drawBackground();
      this.drawDisturbLines();
      this.drawDisturbDots();
      this.drawLetters();
    },
    // 生成随机色
    randomColor() {
      var colorStr = "#";
      for (let i = 0; i < 6; i++) {
        //颜色6次
        colorStr += Math.floor(Math.random() * 16).toString(16); //16进制
      }
      return colorStr;
    },

    // 生成二维码字母范围
    generateCodeRange() {
      var codeRange = [];
      for (let i = "A".charCodeAt(0); i <= "Z".charCodeAt(0); i++) {
        codeRange.push(String.fromCharCode(i));
      }
      for (let i = "a".charCodeAt(0); i <= "z".charCodeAt(0); i++) {
        codeRange.push(String.fromCharCode(i));
      }
      for (let i = "0".charCodeAt(0); i <= "9".charCodeAt(0); i++) {
        codeRange.push(String.fromCharCode(i));
      }
      this.codeRange = codeRange;
      //console.log(codeRange);//	A-Z,a-z,0-9
      // return codeRange;
    },

    // 生成四位随机数
    randomCode() {
      this.code = "";
      var len = this.codeRange.length;
      for (let i = 0; i < 4; i++) {
        this.code += this.codeRange[Math.floor(Math.random() * len)];
        //console.log(this.code);
      }
    },

    // 画背景色
    drawBackground() {
      var bgColor = "#ccc";
      //        console.log(bgColor)
      this.ctx.rect(0, 0, this.width, this.height);
      this.ctx.fillStyle = bgColor;
      this.ctx.fill();
    },

    // 画干扰线
    drawDisturbLines() {
      for (let i = 0; i < 4; i++) {
        this.drawOneLine();
      }
    },
    drawOneLine() {
      var startX = Math.floor(Math.random() * this.width);
      var startY = Math.floor(Math.random() * this.height);
      var endX = Math.floor(Math.random() * this.width);
      var endY = Math.floor(Math.random() * this.height);
      this.ctx.strokeStyle = this.randomColor();
      this.ctx.lineWidth = Math.ceil(Math.random() * 2);
      this.ctx.beginPath();
      this.ctx.moveTo(startX, startY);
      this.ctx.lineTo(endX, endY);
      this.ctx.closePath();
      this.ctx.stroke();
    },

    // 画干扰点
    drawDisturbDots() {
      for (
        let i = 0, count = (this.width * this.height) / 100;
        i < count;
        i++
      ) {
        this.drawOneDot();
      }
    },
    drawOneDot() {
      var ox = Math.floor(Math.random() * this.width);
      var oy = Math.floor(Math.random() * this.height);
      this.ctx.fillStyle = this.randomColor();
      this.ctx.beginPath();
      this.ctx.arc(ox, oy, 1, 0, 2 * Math.PI);
      this.ctx.closePath();
      this.ctx.fill();
    },

    // 画文字(数字或字母)
    drawLetters() {
      for (let i = 0, len = this.code.length; i < len; i++) {
        let offsetX = this.width * 0.15; // 中间的70%画字母，两边各15%
        let offsetY = this.height * 0.15;
        let lineHeight = this.height * 0.7;
        let x = (i * this.width * 0.7) / this.code.length + offsetX;
        let y = this.height / 2;
        let letter = this.code[i];
        let fontSize = Math.min(
          parseInt(this.height),
          parseInt(this.width * 0.7)
        );
        //console.log(fontSize)
        this.drawOneLetter(letter, x, y, fontSize);
      }
    },
    drawOneLetter(letter, x, y, fontSize) {
      this.ctx.font = fontSize + "px Times new roman";
      this.ctx.textBaseline = "middle";
      this.ctx.fillStyle = this.randomColor();
      this.ctx.fillText(letter, x, y);
    },
    // 更换一个验证码
    freshCode() {
      this.clear();
      this.main();
    },
    // 清除画布
    clear() {
      this.ctx.clearRect(0, 0, this.width, this.height);
    }
  },
  mounted() {
    this.main();
  },
  watch: {
    yzm() {
      this.$emit("hqyzm", this.code);
      this.$emit("yzm", this.yzm);
    }
  }
};
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
}
.cen {
  width: 70%;
  margin: 5px auto;
  display: flex;
  justify-content: left;
  margin-bottom: 50px;
}
.yzen {
  height: 30px;
  width: 100%;
  border: 0;
  font-size: 1rem;
  outline: 0;
  background: 0;
  padding-left: 50px;
  background: url("../assets/yanzhengma.png") no-repeat;
  background-position: left center;
  background-size: contain;
  color: #fff;
}
canvas {
  vertical-align: middle;
}
button {
  background: transparent;
  border: 0;
  outline: 0;
  color: rgb(136, 212, 226);
  font-size: 0.75rem;
  vertical-align: bottom;
}
input::-webkit-input-placeholder {
  /* WebKit browsers */
  color: #fff;
}
input:-moz-placeholder {
  /* Mozilla Firefox 4 to 18 */
  color: #fff;
}
input::-moz-placeholder {
  /* Mozilla Firefox 19+ */
  color: #fff;
}
input:-ms-input-placeholder {
  /* Internet Explorer 10+ */
  color: #fff;
}
</style>
