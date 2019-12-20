<template>
  <div>
    <mt-tabbar fixed v-model="active">
      <mt-tab-item id="tab1" @click.native="getActive(0)">
        <tabicon
          :focused="current[0].select"
          slot="icon"
          :nmormalImage="require('../../assets/tabbar1.png')"
          :selectedImage="require('../../assets/tabbar11.png')"
        ></tabicon>精品
      </mt-tab-item>
      <mt-tab-item id="tab2" @click.native="getActive(1)">
        <tabicon
          slot="icon"
          :focused="current[1].select"
          :nmormalImage="require('../../assets/tabbar2.png')"
          :selectedImage="require('../../assets/tabbar22.png')"
        ></tabicon>论坛
      </mt-tab-item>
      <mt-tab-item>
        <img @click="pub" width="40px;" :src="require(`../../assets/fabu.png`)" />
      </mt-tab-item>
      <mt-tab-item id="tab3" @click.native="getActive(2)">
        <tabicon
          :focused="current[2].select"
          slot="icon"
          :nmormalImage="require('../../assets/gouwucheman1.png')"
          :selectedImage="require('../../assets/gouwucheman.png')"
        ></tabicon>消息
        <span class="red-radius" v-if="xxi!=''">!</span>
      </mt-tab-item>
      <mt-tab-item id="tab4" @click.native="getActive(3)">
        <tabicon
          :focused="current[3].select"
          slot="icon"
          :nmormalImage="require('../../assets/tabbar4.png')"
          :selectedImage="require('../../assets/tabbar44.png')"
        ></tabicon>我的
        <span class="red-radius" v-if="con>0">{{con}}</span>
      </mt-tab-item>
    </mt-tabbar>
  </div>
</template>
<script>
import tabicon from "@/components/product/tabicon.vue";
export default {
  sockets: {
    receiveMessage(data) {
      //监听cba事件，方法是后台定义和提供的
      var obj = JSON.parse(data);
      console.log(obj);
      this.xxi = obj;
    }
  },
  components: {
    tabicon: tabicon
  },
  data() {
    return {
      xxi: this.$store.state.tuisongMessage,
      n: 10,
      active: "tab1", //选中面板id
      current: [
        {
          select: true //1
        },
        {
          select: false //2
        },
        {
          select: false //3
        },
        {
          select: false //4
        }
      ],
      con: 0,
      t: 0
    };
  },
  methods: {
    pub() {
      if (this.$store.getters.getisLogin == 1) {
        this.$router.push("/publish");
      } else {
        this.$toast("请登录");
        this.$router.push("/ceshi1");
      }
    },
    getActive(index) {
      //this.active=event.target.id;
      // console.log(index);
      for (var key of this.current) {
        key.select = false;
      }
      this.current[index].select = true;
      this.$router.push("/product" + index);
      // if (index == 3) {
      //   this.xxi = "";
      // }
    }
  },
  created() {
    //访问刷新页面重置问题
    //console.log(this.$store.state.pathurl);
    for (var key of this.current) {
      key.select = false;
    }
    //console.log(this.$route.path);
    if (this.$route.path == "/" || this.$route.path == "/product0") {
      this.current[0].select = true;
      this.$router.push("/product0");
      this.active = "tab1";
    } else if (this.$route.path == "/product1") {
      this.current[1].select = true;
      this.$router.push("/product1");
      this.active = "tab2";
    } else if (this.$route.path == "/product2") {
      this.current[2].select = true;
      this.$router.push("/product2");
      this.active = "tab3";
    } else if (this.$route.path == "/product3") {
      this.current[3].select = true;
      this.$router.push("/product3");
      this.active = "tab4";
    }
  }
};
</script>
<style scoped>
#list {
  margin-top: 48px;
}
.mint-tabbar > .mint-tab-item {
  color: #999;
}
.mint-tabbar > .mint-tab-item.is-selected {
  color: rgb(136, 212, 226);
}
.red-radius {
  display: inline-block;
  width: 15px;
  height: 15px;
  border-radius: 50%;
  background: red;
  text-align: center;
  line-height: 15px;
  color: #fff;
}
</style>