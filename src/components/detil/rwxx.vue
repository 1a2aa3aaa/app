<template>
  <div>
    <ul class="info">
      <li>
        <span @click="go">&lt;</span>
      </li>
      <li>
        <img :src="`${$store.state.pathurl}${info.uhead}`" />
      </li>
      <li>{{info.uname}}</li>
      <li>{{info.uemail}}</li>
    </ul>
    <h4>发表过的帖子</h4>
    <ul class="title">
      <li v-for="(v,i) in title" :key="i">
        <router-link :to="{path:'/detil',query:{pid:v.pid}}">{{v.ptitle}}</router-link>
      </li>
    </ul>
    <p v-if="title.length==0">该用户很懒,还没有发表过...</p>
    <router-link v-if="shei!=info.uid" class="button" :to="`/liaot/${info.uname}/${uid}`">发消息</router-link>
  </div>
</template>
<script>
export default {
  props: ["uid"],
  data() {
    return {
      info: [],
      title: [],
      shei: sessionStorage.getItem("myuid")
    };
  },
  methods: {
    go() {
      window.history.go(-1);
    }
  },
  created() {
    var obj = { uid: this.uid };
    this.axios.get("product/rwxx", { params: obj }).then(res => {
      this.info = res.data.result[0];
      console.log(this.info);
      this.title = res.data.result;
      console.log(this.title);
    });
  }
};
</script>
<style scoped>
ul,
li {
  margin: 0;
  padding: 0;
}
.info,
.title {
  list-style: none;
}
.info > li:nth-child(1) {
  width: 100%;
  height: 200px;
  font-size: 3rem;
  color: #fff;
  background: url("../../assets/bg.jpg");
}
.info > li:nth-child(1) > span {
  margin-left: 10px;
}
.info > li:nth-child(2) {
  width: 100%;
  height: 70px;
  display: flex;
  justify-content: center;
  margin-top: -45px;
}
.info > li:nth-child(2) > img {
  width: 70px;
  height: 70px;
  border: 2px solid #fff;
}
.info > li:nth-child(3) {
  margin-top: 10px;
  font-size: 1.1rem;
  text-align: center;
}
.info > li:nth-child(4) {
  font-size: 0.9rem;
  color: #bbb;
  text-align: center;
}
h4 {
  margin: 10px;
  padding-bottom: 10px;
  border-bottom: 1px solid #ddd;
}
.title {
  padding: 0 10px;
}
.title > li {
  margin-bottom: 8px;
}
.title > li > a {
  text-decoration: none;
}
.button {
  display: inline-block;
  background: rgb(136, 212, 226);
  width: 50%;
  height: 40px;
  color: #fff;
  font-size: 1rem;
  line-height: 40px;
  text-align: center;
  margin: 20px 10px;
  text-decoration: none;
}
p {
  margin-left: 10px;
  color: #ccc;
  font-size: 0.95rem;
}
</style>