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
// import io from "socket.io-client"
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
      sockets: {

            connect() {

                this.id = this.$socket.id;

                this.$socket.emit('abc', "loginId");      //监听connect事件
               this.$socket.on("cba",(data)=>{
        console.log("服务器发送数据："+data)
      })
            },

            cba(data) {                                 //监听message事件，方法是后台定义和提供的
                console.log(data);
          }

        },
     created(){
    //  var cio = io("ws://127.0.0.1:4000");
       this.$socket.emit("abc","中午吃北平食府炸酱面");
       this.$socket.on("cba",(data)=>{
        console.log("服务器发送数据："+data)
      })
     },
     computed:{
       ...mapState(["uname"])
     }
     
  }
</script>
<style>
 
</style>