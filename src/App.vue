<template>
  <div id="app">
    <router-view></router-view>
    <Tabbar class="d1" v-if="tabbarShow"></Tabbar>
  </div>
</template>

<script>
import Tabbar from "@/components/product/tabbar.vue";
export default {
  name: "App",
  data() {
    return {};
  },

  components: {
    Tabbar
  },
  sockets: {
    connect() {
      //监听connect事件
      //先和服务端建立连接
      let conobj = {
        username: sessionStorage.getItem("myuid")
        // toWho: this.uid
      };
      this.$socket.emit("con", JSON.stringify(conobj));
    },
    receiveMessage(data) {
      //监听cba事件，方法是后台定义和提供的
      var obj = JSON.parse(data);
      console.log(obj);
      this.$store.commit("updateMessage", obj);
    }
  },
  // 监听,当路由发生变化的时候执行
  watch: {
    $route(to, from) {
      //判断是否显示tabbar
      if (
        to.path == "/product0" ||
        to.path == "/product1" ||
        to.path == "/product2" ||
        to.path == "/product3"
      ) {
        this.$store.commit("updateTabbarShow", true);
      } else {
        this.$store.commit("updateTabbarShow", false);
      }
    }
  },
  computed: {
    tabbarShow() {
      return this.$store.getters.getTabbarShow;
    }
  },
  created() {
    if (
      this.$route.path == "/product0" ||
      this.$route.path == "/product1" ||
      this.$route.path == "/product2" ||
      this.$route.path == "/product3"
    ) {
      this.$store.commit("updateTabbarShow", true);
    } else {
      this.$store.commit("updateTabbarShow", false);
    }
  }
};
</script>

<style>
#app {
  padding-top: 0px;
  padding-bottom: 0px;
  overflow-x: hidden;
}
/* .d1{
  padding-top: 50px;
} */
</style>
