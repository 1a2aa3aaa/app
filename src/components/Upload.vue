<!--src/componets/Exam01.vue-->
<template>
  <!-- 先创建一个根元素 div-->
  <div >
       huanying:{{uname}}
       <input type="text" v-model="name">
       <input type="text" v-model="pwd">
       <button @click="mylogin">登陆</button> 
        <button @click="loginout">注销</button>     
  </div>
</template>
<script>
import {mapActions,mapState,mapMutations} from "vuex"
  export default {//组件默认导出对象 
     data(){
       return {
           name:"",
           pwd:""
       }  //组件操作数据 
     },
     methods:{
       loginout(){
         this.setuname("")
       },
       ...mapMutations(["setuname"]),
       mylogin(){
         this.login({
           uname:this.name,
           upwd:this.pwd
         })
         },
         ...mapActions(["login"])
     },
     computed:{
       ...mapState(["uname"])
     }
     
  }
</script>
<style>
 
</style>