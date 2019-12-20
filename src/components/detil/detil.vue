<template>
  <div>
    <subTop :xi="xi"></subTop>
    <tizi :poss="poss"></tizi>
    <mess :pid="pid" :url="url"></mess>
    <div class="m-b"></div>
    <div class="fix">
      <div>
        <input @keyup.13="fs" placeholder="写评论...." type="text" v-model="fmessage" />
        <button @click="fs">提交</button>
      </div>
    </div>
  </div>
</template>
<script>
// 引入制定的子组件
import subTop from "@/components/pr-1/publish/pub-top.vue";
import tizi from "@/components/detil/tizi.vue";
import mess from "@/components/detil/mess.vue";
export default {
  components: {
    subTop: subTop,
    tizi: tizi,
    mess: mess
  },
  data() {
    return {
      xi: "帖子详情",
      pid: this.$route.query.pid,
      pno: 1,
      poss: "",
      fmessage: "",
      url: "detail/mess"
    };
  },

  methods: {
    fs() {
      if (this.fmessage == "") {
        this.$toast("你还没有输入内容");
        return;
      }
      var url = "/detail/message";
      // var obj={
      // mcontent:this.fmessage,
      // pid:this.pid
      // };
      var obj = `mcontent=${this.fmessage}&pid=${this.pid}`;
      // var headers="'Content-type': 'application/x-www-form-urlencoded'";
      // console.log(obj);
      this.axios.post(url, obj).then(res => {
        if (res.data.code == 1) {
          this.$toast("发布成功");
          this.$router.go(0);
        }
      });
    }
  },
  created() {
    // console.log(this.$store.getters.getisLogin);
    if (this.$store.getters.getisLogin !== 1) {
      this.$toast("请登录");
      this.$router.push("/ceshi1");
    }
  },
  mounted() {
    var url = "detail/list";
    var obj = {
      pid: this.pid
    };
    this.axios
      .get(url, { params: obj })
      .then(res => {
        //console.log(4444);
        if (res.data.code == 0) {
          this.$store.commit("updateisLogin", 0);
          this.$toast("请登录");
          this.$router.push("/ceshi1");
        }
        this.poss = res.data.data;
        // console.log(this.poss);
      })
      .catch(err => {
        console.log(err);
      });
  }
};
</script>
<style scoped>
* {
  margin: 0;
  padding: 0;
}
.m-b {
  margin-bottom: 80px;
}
.fix {
  position: fixed;
  bottom: 0;
  width: 100%;
  /* box-shadow: 2px 2px 5px 2px #ccc; */
  height: 50px;
  line-height: 50px;
  background: #eee;
  z-index: 1000;
}
.fix > div {
  margin: 0 10px 0px 10px;
  width: 100%;
}
input {
  padding-left: 10px;
  width: 80%;
  border: 0;
  height: 30px;
  border-radius: 10%;
  box-sizing: border-box;
}
button {
  border: 0;
  outline: 0;
  background: rgb(136, 212, 226);
  width: 50px;
  height: 30px;
  color: #fff;
}
</style>