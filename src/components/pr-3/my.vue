<template>
<div>
    <subTop :xi="xi"></subTop>
    <div class="margin-t"></div>
    <xinxi></xinxi>
</div>
</template>
<script>
// 引入制定的子组件
 import subTop from "@/components/pr-1/publish/pub-top.vue"
 import xinxi from "@/components/pr-3/xinxi.vue"
  //   注册子组件
 export default{     
    data(){
        return{
           xi:"个人信息",
        }
    },
    components:{
       "subTop":subTop,
       "xinxi":xinxi,
    },
    created(){
       if(this.$store.getters.getisLogin!==1){
           this.$router.push("/ceshi1");
          }  
    }
  }
</script>
<style scoped>
.margin-t{
  margin-top: 50px;
}
</style>