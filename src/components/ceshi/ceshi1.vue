<template>
  <div class="login" :style="`height:${height}`">
    <div>
      <img src="../../assets/logoo.png" alt />
      <input class="suo" type="text" placeholder="请输入用户名" v-model="uname" />
      <input
        class="ren"
        type="password"
        placeholder="请输入密码"
        v-model="upwd"
        @keyup.13.native="login"
      />
      <!-- <yzm @hqyzm="hqyzm" @yzm="yzm"></yzm> -->
      <button :class="bg" @mouseover="ent" @mouseout="lev" class="dl" @click="login">登录</button>
      <router-link to="/reg" class="zuc">注册</router-link>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      uname: "",
      upwd: "",
      bg: "bg1",
      height: `${window.innerHeight}px`,
      syi: ""
    };
  },

  mounted() {
    console.log(this.height);
  },
  methods: {
    ent() {
      console.log(1);
      this.bg = "bg2";
    },
    lev() {
      console.log(2);
      this.bg = "bg1";
    },

    login() {
      var reg = /^\w{3,12}$/; //验证的正则表达式
      if (reg.test(this.uname)) {
        if (reg.test(this.upwd)) {
          //5.发送ajax请求
          var url = "user/login";
          var obj = { uname: this.uname, upwd: this.upwd };
          this.axios
            .get(url, { params: obj })
            .then(res => {
              var re = res.data.code;
              console.log(res.data);
              if (re === 1) {
                //6.登录成功跳转页面
                this.$store.commit("updateisLogin", 1);
                sessionStorage.setItem("myuid", res.data.data);
                this.$router.push("/product0");
              } else {
                //7.登录失败,提示框
                this.$toast("用户名密码错误");
              }
              //console.log(res);
            })
            .catch(err => {
              console.log(err);
            });
        } else {
          this.$toast("密码格式错误");
        }
      } else {
        this.$toast("用户名格式错误");
      }
    }
  }
};
</script>
<style scoped>
.sx {
  transition: transform 1s linear;
}
.login {
  width: 100%;
  background: #000;
}
.login::before {
  content: "";
  display: table;
}
.login > div {
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-top: 70px;
}
.login > div > img {
  margin-bottom: 70px;
  box-sizing: border-box;
}
.login > div > input {
  border: 0;
  outline: 0;
  width: 70%;
  height: 30px;
  margin-bottom: 10px;
  background: 0;
  padding-left: 50px;
  box-sizing: border-box;
  font-size: 1rem;
}
.login > div > .suo {
  background: url("../../assets/ren.png") no-repeat;
  background-size: contain;
  background-position: left center;
  color: #fff;
}
.login > div > .ren {
  background: url("../../assets/suo.png") no-repeat;
  background-position: left center;
  background-size: contain;
  color: #fff;
  margin-bottom: 40px;
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
.dl,
.zuc {
  width: 70%;
  height: 40px;
  border-radius: 20px;
  border: 0;
  outline: 0;
  color: white;
  background: 0;
}
.zuc {
  text-align: center;
  line-height: 40px;
  color: rgb(142, 164, 224);
}
a:hover {
  color: #fff;
}
.dl {
  font-size: 1rem;
}
.bg1 {
  background: rgb(167, 167, 82);
}
.bg2 {
  background: rgb(128, 128, 74);
}
</style>