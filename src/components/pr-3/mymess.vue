<template>
<div>
    <subTop :xi="xi"></subTop>
    <div class="margin-t"></div>
   <mess :pid="pid" :url="url"></mess>
</div>
</template>
<script>
// 引入制定的子组件
 import subTop from "@/components/pr-1/publish/pub-top.vue"
  import mess from "@/components/detil/mess.vue"
  //   注册子组件
 export default{     
    data(){
        return{
           xi:"我的消息",
           url:"detail/mess1",
           pid:1,
        }
    },
    components:{
       "subTop":subTop,
         "mess":mess,
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
  margin-top:50px;
}
</style>