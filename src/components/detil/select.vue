<template>
<div>
 <div id="top">  
      <img @click="go" :src="`${$store.state.pathurl}houtui.png`" 
      width="32px" alt="">
      <div class="sear">
         <input id="d1" type="text" v-model="val" 
         placeholder="请输入关键字" />
         <button>搜索</button>
      </div>  
  </div>
  <div class="m-t"></div>
  <key :val="val"></key>
</div>
 
</template>

<script>
// 引入制定的子组件
 import key from "@/components/detil/keylist.vue"
   export default{
        //   注册子组件
       components:{
      "key":key
    },
       data(){
           return{
               val:"",
           }
       },
    mounted(){
      d1.focus();
    },
    methods:{
        go(){
      if (window.history.length <= 1) {
            this.$router.push({path:'/'})
                return false
            } else {
                this.$router.go(-1)
            }
    },
    }
   }
</script>
<style scoped>
.m-t{
    margin-top:50px;
}
#top{
  z-index:1000;
  position: fixed;
top:0;
left:0;
  width: 100%;
  height:50px;
  background:rgb(136, 212, 226);
  display: flex;
  justify-content: left;
  box-sizing: border-box;
  padding-left:10px;
  align-items: center;
}
.sear{
    margin-left: 40px;
display: flex;
  justify-content: left;
  align-items: center;
}
input{
  border:0;
  outline:0;
  width: 220px;
  height:25px;
  padding-left:5px;
}
button{
  background: #aaa;
  display:block;
  outline: 0;
  border:0;
  width: 50px;
  height:27px;
  color:#fff;
  font-size:0.75rem;
  line-height: 27px;
  text-align: center;
  /* transition: all 1s; */
}
button:hover{
  background:blue;
  /* transform: scale(1.1); */
}
</style>