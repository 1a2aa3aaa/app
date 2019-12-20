<template>
  <div>
    <top></top>
    <banner :t1="t1" :t2="t2" :t3="t3"></banner>
    <sec :url="url"></sec>
  </div>
</template>
<script>
// 引入制定的子组件
import top from "../pr-0/pr-t.vue";
import banner from "../pr-0/pr-banner.vue";
import sec from "../pr-1/pr1-section.vue";
export default {
  //   注册子组件
  data() {
    return {
      t1: require("../../assets/04.jpg"),
      t2: require("../../assets/05.jpg"),
      t3: require("../../assets/06.jpg"),
      url: "product/list1"
    };
  },
  components: {
    top: top,
    banner: banner,
    sec: sec
  }
};
</script>
<style scoped>
</style>