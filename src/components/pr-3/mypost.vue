<template>
<div>
    <subTop :xi="xi"></subTop>
  <sec :url="url"></sec>
  <div class="colle">
    
  </div>
</div>
</template>
<script>
// 引入制定的子组件
 import subTop from "@/components/pr-1/publish/pub-top.vue"
 import sec from "@/components/pr-1/pr1-section.vue"
  //   注册子组件
 export default{     
    data(){
        return{
           xi:"我的帖子",
           url:"detail/post1",
        }
    },
    components:{
       "subTop":subTop,
         "sec":sec,
    },
    created(){
       if(this.$store.getters.getisLogin!==1){
           this.$router.push("/ceshi1");
          }  
    }
  }
</script>
<style scoped>

</style>