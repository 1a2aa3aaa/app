<template>
  <div id="top"> 
      <div class="img">
    <img @click="go" :src="`${$store.state.pathurl}/houtui.png`" width="32px" alt="">
    </div> 
      <div class="wz">
        {{xi}}
      </div>
  </div>
</template>
<script>
export default{
  props:['xi'],
  methods:{
    go(){
      if (window.history.length <= 1) {
            this.$router.push({path:'/'})
                return false
            } else {
                this.$router.go(-1)
            }
    }
  }
}
</script>
<style scoped>
/* *{
  margin: 0;
  padding:0;
} */
#top{
  z-index:1000;
  position: fixed;
top:0;
left:0;
  width: 100%;
  height:50px;
  background:rgb(136, 212, 226);
}
#top>.wz{
  width: 100%;
  font-size:1.1rem;
  text-align: center;
  color:#fff;
  line-height: 50px;
}
#top>.img{
   position: absolute;
    width: 20%;
    left:5px;
    top:9px;
    box-sizing: border-box;
}
</style>