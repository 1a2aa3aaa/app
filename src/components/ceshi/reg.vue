<template>
  <div class="login1" :style="`height:${height}`">
    <div>
      <img src="../../assets/logoo.png" alt />
      <input class="ren" type="text" v-model="uname" placeholder="请输入用户名" />
      <input class="suo" type="password" v-model="upwd" placeholder="请输入密码" />
      <input class="email" @keyup.13.native="login" v-model="email" placeholder="请输入邮箱" type="text" />
      <!-- <yzm @hqyzm="hqyzm" @yzm="yzm"></yzm> -->
      <button
        :class="bg"
        @mouseover="ent"
        @mouseout="lev"
        class="zuc"
        size="large"
        @click="login"
      >注册</button>
      <router-link to="/ceshi1" class="dl">登陆</router-link>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      uname: "",
      upwd: "",
      email: "",
      bg: "bg1",
      height: `${window.innerHeight}px`
    };
  },

  watch: {
    uname() {
      if (this.uname != "") {
        this.err();
      }
    }
  },
  methods: {
    ent() {
      this.bg = "bg2";
    },
    lev() {
      this.bg = "bg1";
    },
    err() {
      //console.log(this.uname)
      var reg = /^\w{3,12}$/;
      //验证用户名格式是否正确
      if (reg.test(this.uname)) {
        //如果正确发送axios请求
        var url = "user/sel";
        var obj = { uname: this.uname };
        this.axios
          .get(url, { params: obj })
          .then(res => {
            //console.log(res.data.code);
            if (res.data.code == 1) {
            } else {
              this.$toast("用户名被占用");
            }
          })
          .catch(err => {
            colsole.log(err);
          });
      }

      //创建url
      //创建用户名
      //发送请求
      //
    },

    login() {
      var reg = /^\w{3,12}$/;
      var reg1 = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
      if (reg.test(this.uname)) {
        if (reg.test(this.upwd)) {
          if (reg1.test(this.email)) {
          } else {
            this.$toast("邮箱格式不正确");
            return;
          }
        } else {
          this.$toast("密码格式不正确");
          return;
        }
      } else {
        this.$toast("用户名格式不正确");
        return;
      }

      var url = "user/reg";
      var obj = `uname=${this.uname}&upwd=${this.upwd}&uemail=${this.email}`;

      this.axios
        .post(url, obj)
        .then(res => {
          if (res.data.code == 1) {
            this.$toast("注册成功");
            this.$store.commit("updateisLogin", 1);
            sessionStorage.setItem("myuid", res.data.data);
            this.$router.push("/product1");
          } else {
            this.$toast("注册失败");
          }
        })
        .catch(err => {
          console.log(err);
        });
    }
  }
};
</script>
<style scoped>
.login1 {
  width: 100%;
  height: 1000px;
  background: #000;
}
.login1::before {
  content: "";
  display: table;
}
.login1 > div {
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-top: 70px;
}
.login1 > div > img {
  margin-bottom: 70px;
  box-sizing: border-box;
}
.login1 > div > input {
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
.login1 > div > .suo {
  background: url("../../assets/suo.png") no-repeat;
  background-size: contain;
  background-position: left center;
  color: #fff;
}
.login1 > div > .ren {
  background: url("../../assets/ren.png") no-repeat;
  background-position: left center;
  background-size: contain;
  color: #fff;
}
.login1 > div > .email {
  background: url("../../assets/email.png") no-repeat;
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
  font-size: 1rem;
}
.dl {
  text-align: center;
  line-height: 40px;
  color: rgb(142, 164, 224);
}
a:hover {
  color: #fff;
}
.bg1 {
  background: rgb(167, 167, 82);
}
.bg2 {
  background: rgb(128, 128, 74);
}
</style>