<template>
  <div>
    <div class="phead" v-for="(v,i) of poss" :key="i">
      <!-- 头像,用户名,时间-->
      <div class="top">
        <router-link :to="`/rwxx/${v.uid}`">
          <img :src="`${$store.state.pathurl}${v.uhead}`" alt />
        </router-link>
        <div>
          <!-- <p>{{uhead}}</p> -->
          <p>{{v.uname}}</p>
          <p>{{v.ptime}}</p>
        </div>
      </div>
      <!--,标题  -->
      <div class="title">
        <p>{{v.ptitle}}</p>
      </div>
      <!-- 内容 -->
      <div class="content">
        <p>{{v.pcontent}}</p>
      </div>
      <!--  -->
    </div>
  </div>
</template>
<script>
export default {
  props: ["poss"],
  data() {
    return {};
  }
};
</script>
<style scoped>
* {
  margin: 0;
  padding: 0;
}
.phead {
  margin-top: 60px;
}
.phead > .top {
  display: flex;
  justify-content: left;
}
.phead > .top > a > img {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  margin-left: 10px;
}
.phead > .top > div {
  margin-left: 10px;
}
.phead > .top > div > p:nth-child(2) {
  color: #ccc;
}
.title {
  font-size: 1.15rem;
  color: rgb(136, 212, 226);
  margin-left: 10px;
  margin-top: 10px;
}
.content {
  font-size: 0.9rem;
  margin: 10px 10px 0 10px;
  padding-bottom: 10px;
  border-bottom: 4px solid rgb(241, 241, 241);
}
</style>