<!--src/componets/Exam01.vue-->
<template>
<div>
<div @click="to" class="r">
  {{sum}}跳过
</div>
 <div class="b">
   <img :src="`${$store.state.pathurl}logo1.jpg`" alt="">
 </div>

</div>


</template>
<script>
  export default {//组件默认导出对象
  data(){
    return{
      sum:3,
      t:"",
    }
  },
   methods:{
     to(){
        clearTimeout(this.t);
       this.$router.push("/ceshi1");
     }
   },
  mounted(){
     this.t=setInterval(()=>{
          this.sum-=1;
          if(this.sum==-1){
            clearTimeout(this.t);
           this.$router.push("/ceshi1");
          }
      },2000);
   }
  }
</script>
<style scoped>
.r{
  width: 50px;
  height:50px;
  position: absolute;
    top:3%;
    right:5%;
    background: #ccc;
    border-radius: 50%;
    color:#fff;
    text-align: center;
    line-height: 50px;
    font-size:0.75rem;
}
  .b{
    position: absolute;
    bottom:10%;
    right:50%;
    margin-right:-99px; 
  }
</style>