<template>
<div>
  <div class="bg">
  </div>
  <!-- 黑色遮罩层 -->
  <div class=bg-mask>
  </div>
  <div class="bg1">
    <router-link class="bg2" to='/my'> 
    <img :src="`${$store.state.pathurl}${istou}`" alt="">
    </router-link>
    <br/>
    <a @click="login">{{islogin}}</a>
    
  </div>
  <ul>
    <li>
     <router-link to='/my'> 
      <p>个人信息</p>
      <img class="image" :src="`${$store.state.pathurl}qian.png`" alt="">
      </router-link>
     
    </li>
    <li>
      <router-link to='/collect'> 
        <div>
          <img width="32px" :src="`${$store.state.pathurl}wodeshoucang.png`" alt="">
           <p>我的收藏</p>
        </div>
      
      <img class="image" :src="`${$store.state.pathurl}qian.png`" alt="">
       </router-link>
    </li>
    <li>
       <router-link to='/mypost'> 
          <div>
      <img :src="`${$store.state.pathurl}tz.png`" alt="">
      <p>我的帖子</p>
       </div>
      <img class="image" :src="`${$store.state.pathurl}qian.png`" alt="">
       </router-link>
    </li>
    <li>
       <router-link to='/mymess'> 
          <div>
       <img :src="`${$store.state.pathurl}xixi.png`" alt="">
      <p>我的消息</p>
       </div>
      <img class="image" :src="`${$store.state.pathurl}qian.png`" alt="">
       </router-link>
    </li>
    <li @click="tu">
       <router-link to="" > 
      <p>退出</p>
      <img src="" alt="">
      </router-link>
    </li>
  </ul>
</div>
  
</template>
<script>
  export default{
      data(){
        return{
            islogin:"未登录,点此登录...",
            istou:"wei.png",
            data:[],
        }
      },
      methods:{
        login(){
          if(this.$store.getters.getisLogin!==1){
           this.$router.push("/ceshi1");
          }    
        },
        tu(){
          console.log(this.$messagebox.confirm("确定退出吗"));
        this.$messagebox.confirm("确定退出吗").then(res => {
          if(res=="confirm"){
            sessionStorage.clear();
            localStorage.clear();
            this.axios.get("detail/tu").then(res=>{
              console.log(res);
            })
             this.$store.commit("updateisLogin",0);
            this.$router.push("/ceshi1");
          }else{

          }
         }).catch(err=>{
           console.log(err);
         })
       
          }
          },
     created(){
       //console.log(document.Cookie);
        //console.log(sessionStorage);
         // console.log(JSON.parse(localStorage.vuex).isLogin);
         //console.log(this.$store.getters.getisLogin);
    if(this.$store.getters.getisLogin!==1){
      //console.log(this.$store.isLogin);
      this.islogin="未登录,点此登录...";
      }else{
        //console.log(88);
        var url="detail/islogin";
        this.axios.get(url).then(res=>{
         // console.log(res);
          this.data=res.data.data;
           this.islogin="欢迎,"+res.data.data[0].uname;
           this.istou=res.data.data[0].uhead;
          // console.log(this.istou);
        }).catch(err=>{
          console.log(err);
        })    
    };
     },
    mounted() {
      if(this.$store.getters.getisLogin!==1){
      this.islogin="未登录,点此登录...";
      }
     }
   }
</script>
<style scoped>
.bg{
  width: 100%;
  height:200px;
  background: url(../../assets/bg.jpg) no-repeat;
  opacity:0.9;
 filter:blur(0.5rem);  /* 滤镜 */
text-align: center;
}
.bg-mask{
  width:100%;
  position: absolute;
  height:200rpx;
  background:#333;
  left:0;
  top:0;
  z-index:-1;
}
.bg1{
  width: 100%;
  height:200px;
  position: absolute;
   left:0;
  top:0;
  opacity:0.9;
  text-align: center;
}
.bg2>img{
  width: 50px;
  height:50px;
  border-radius: 50%;
  background: #fff;
  margin-top:75px; 
}
.bg1>a{
  margin-top:5px; 
  color:rgb(241, 241, 241);
   font-size:0.75rem;
}
ul{
  margin: 0;
  padding: 0;
  height: 100%;
  margin-bottom: 80px;
}
ul>li>a{
  list-style: none; 
  padding: 10px; 
  box-shadow: 0px 0px 0px 1px rgb(238, 237, 237);
}
ul>li>a:hover{
  background:#ddd;
}
ul>li>a{
 display: flex;
  justify-content: space-between;
   align-items: center;
   text-decoration: none;
}
ul>li>a>div{
  display: flex;
  justify-content: left;
   align-items: center;
}
.image{
  width: 30px;
  height:30px;
  margin-right: 10px;
}
ul>li{
  margin-bottom:10px; 
}
ul>li:nth-child(1){
  margin-bottom: 20px;
}
</style>