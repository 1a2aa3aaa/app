<template>
  <div>
    <subTop :xi="uname"></subTop>
    <ul class="list" :style="`height:${height-100}px`">
      <li :class="(myuid==item.uid)?'a':'b'" v-for="(item , index) of list" :key="index">
        <div>
          <img v-if="myuid==item.uid" :src="`${$store.state.pathurl}${item.uhead}`" alt />
          <span></span>
          <span>{{item.content}}</span>
          <span></span>
          <img v-if="myuid!=item.uid" :src="`${$store.state.pathurl}${item.uhead}`" alt />
        </div>
      </li>
    </ul>
    <div class="cont">
      <input v-model="content" type="text" />
      <button :class="isfasong" @click="setcentent" @touchstart="dian" @touchend="tai">发送</button>
    </div>
  </div>
</template>
<script>
// 引入制定的子组件
import socketio from "socket.io-client";
import subTop from "@/components/pr-1/publish/pub-top.vue";
export default {
  props: ["uname", "uid"],
  sockets: {
    receiveMessage(data) {
      //监听cba事件，方法是后台定义和提供的
      console.log(45656);
      this.getliaot();
    }
  },
  data() {
    return {
      ren: [],
      content: "",
      xiaoxi: ["a", "b", "c", "d"],
      list: [],
      myuid: sessionStorage.getItem("myuid"),
      iss: "",
      isfasong: "nodian",
      height: 0
    };
  },
  methods: {
    gundong() {
      //console.log(this.height + "1");
      var ul = document.getElementsByClassName("list")[0];
      setTimeout(() => {
        ul.scrollTop = ul.scrollHeight;
      }, 100);
    },
    dian() {
      this.isfasong = "dian";
    },
    tai() {
      this.isfasong = "nodian";
    },

    setcentent() {
      if (this.content != "") {
        var obj = { tauid: this.uid, content: this.content };
        this.axios.get("detail/setliaoCen", { params: obj }).then(res => {
          console.log(res);
          this.getliaot();
          var ul = document.getElementsByClassName("list")[0];
          setTimeout(() => {
            ul.scrollTop = ul.scrollHeight;
          }, 100);
          var obj1 = {
            username: this.myuid,
            toWho: this.uid,
            mes: this.content //表单提交事件
          };
          this.$socket.emit("chat message", JSON.stringify(obj1));
        });
      }
    },
    getliaot() {
      var obj = { tauid: this.uid };
      this.axios.get("detail/liaoCen", { params: obj }).then(res => {
        console.log(11111);
        this.list = [].concat(res.data.data);
        this.content = "";
      });
    }
  },
  components: {
    subTop: subTop
  },
  created() {
    this.$store.commit("updateMessage", 0);
    this.getliaot();
  },
  mounted() {
    this.height = window.innerHeight;
    this.gundong();
  },
  updated() {
    this.$store.commit("updateMessage", 0);
    var ul = document.getElementsByClassName("list")[0];
    setTimeout(() => {
      ul.scrollTop = ul.scrollHeight;
    }, 100);
  }
};
</script>
<style scoped>
* {
  margin: 0;
  padding: 0;
}
.list {
  overflow-x: hidden;
  overflow-y: scroll;
  margin-top: 50px;
  margin-bottom: 50px;
  list-style: none;
  width: 100%;
  padding: 10px;
  box-sizing: border-box;
}
.list > li {
  box-sizing: border-box;
  margin: 5px 0;
}
.list > li > div > img {
  display: block;
  width: 40px;
  height: 40px;
  border-radius: 50%;
}
.list > .a {
  padding-right: 30%;
}
.list > .a > div {
  width: 100%;
  display: flex;
  justify-content: flex-start;
}
.list > .a > div > span:nth-child(3) {
  display: inline-block;
  padding: 5px 4px;
  white-space: normal;
  word-wrap: break-word;
  word-break: break-all;
  box-sizing: border-box;
  border-radius: 3px;
  background: rgb(206, 206, 206);
}
.list > .a > div > span:nth-child(2) {
  content: "";
  display: block;
  width: 0;
  height: 0;
  margin-top: 10px;
  border-width: 5px;
  border-style: solid;
  border-color: transparent rgb(206, 206, 206) transparent transparent;
}
.list > .b {
  width: 100%;
  padding-left: 30%;
}
.list > .b > div {
  width: 100%;
  display: flex;
  justify-content: flex-end;
}
.list > .b > div > span {
  box-sizing: border-box;
}
.list > .b > div > span:nth-child(2) {
  white-space: normal;
  display: inline-block;
  word-wrap: break-word;
  word-break: break-all;
  box-sizing: border-box;
  display: inline-block;
  padding: 5px 4px;
  border-radius: 3px;
  background: rgb(67, 223, 139);
}
.list > .b > div > span:nth-child(3) {
  content: "";
  display: block;
  width: 0;
  height: 0;
  margin-top: 10px;
  border-width: 5px;
  border-style: solid;
  border-color: transparent transparent transparent rgb(67, 223, 139);
}
.cont {
  width: 100%;
  height: 50px;
  position: fixed;
  bottom: 0;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  padding: 10px;
  background: rgb(238, 238, 238);
  box-sizing: border-box;
}
.cont > input {
  width: 85%;
  height: 30px;
  border: 0;
  outline: 0;
}
.cont > button {
  border: 0;
  outline: 0;
  width: 15%;
  height: 30px;
  color: #fff;
}
.dian {
  background: rgb(35, 194, 223);
}
.nodian {
  background: rgb(136, 212, 226);
}
</style>