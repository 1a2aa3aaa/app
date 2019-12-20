<template>
  <div>
    <subTop :xi="xi"></subTop>
    <ul class="ren">
      <li v-for="(item,index) of ren" :key="index">
        <router-link :to="`/liaot/${item.uname}/${item.uid}`">
          <img :src="`${$store.state.pathurl}${item.uhead}`" />
          <p>
            {{item.uname}}
            <br />
            <span class="grey" v-if="shei==item.tauid">{{con}}</span>
          </p>
          <span class="red-radius" v-if="shei==item.tauid">!</span>
        </router-link>
      </li>
    </ul>
  </div>
</template>
<script>
// 引入制定的子组件
import subTop from "@/components/pr-1/publish/pub-top.vue";
export default {
  sockets: {
    receiveMessage(data) {
      //监听cba事件，方法是后台定义和提供的
      var obj = JSON.parse(data);
      console.log(obj);
      this.shei = obj.username;
      this.con = obj.mes;
    }
  },
  data() {
    return {
      xi: "聊天",
      ren: [],
      shei: "",
      con: ""
    };
  },

  components: {
    subTop: subTop
  },
  created() {
    this.shei = this.$store.state.tuisongMessage.username;
    this.con = this.$store.state.tuisongMessage.mes;
    var myuid = sessionStorage.getItem("myuid");
    this.axios.get("detail/liao").then(res => {
      var arr = res.data.data;
      console.log(arr);
      var obj = {};
      for (var item of arr) {
        if (!obj[item.uid]) {
          console.log(item);
          this.ren.push(item);
          obj[item.uid] = 1;
        }
      }
      //this.ren = res.data.data;
      console.log(this.ren);
    });
  }
};
</script>
<style scoped>
.grey {
  font-size: 0.7rem;
  color: rgb(209, 209, 209);
}
.red-radius {
  margin-top: -15px;
  margin-left: 5px;
  display: inline-block;
  width: 15px;
  height: 15px;
  border-radius: 50%;
  background: red;
  text-align: center;
  color: #fff;
}
.ren {
  margin-top: 50px;
  width: 100%;
  list-style: none;
  padding: 10px;
}
.ren > li > a {
  width: 100%;
  height: 50px;
  border-bottom: 1px solid rgba(200, 200, 200, 0.5);
  display: flex;
  color: #000;
  text-decoration: none;
  justify-content: flex-start;
  align-items: center;
}
.ren > li > a > img {
  width: 40px;
  height: 40px;
  margin-right: 10px;
}
</style>