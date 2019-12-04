<template>
<div>
  <top></top>
  <ul>
    <li v-for="(v,i) of data" :key="i">
      <router-link :to="`detil?pid=${v.pid}`">
        <!-- 头像 -->
            <img class="imgs" :src="`${$store.state.pathurl}${v.uhead}`" alt=""/>
          <!-- 名字,内容 -->
          <div class="cons">
              <p>{{v.uname}}</p>
              <p>{{v.mcontent}}
              </p>
          </div>
          <!--  -->
          <div class="titles">
            <!-- 我的帖子 -->
            {{v.ptitle}}
          </div>
      </router-link>
    </li>
  </ul>
</div>
  
</template>
<script>
// 引入制定的子组件
  import top from "../pr-0/pr-t.vue"
   export default{
    //   注册子组件
    data(){
        return{
            url:"product/list1",
            data:[],
        }
    },
    components:{
      "top":top,
    },
    created(){ 
      var url='detail/hcont';
      this.axios.get(url).then(res=>{
           //console.log(res);
           if(res.data.code==1){
              this.data=res.data.data;
             // console.log(this.data);
           }
         })
    }
    }
</script>
<style scoped>
 ul{
   /* border:1px solid red; */
   padding: 40px 10px 0 10px;
 }
 ul>li{
   list-style: none;
   /* border:1px solid rgb(38, 207, 66); */
 }
 ul>li>a{
   text-decoration: none;
   display: flex;
   justify-content: left;
   height:60px;
 }
  ul>li>a>.imgs{
    width: 50px;
    height: 50px;
    border-radius: 50%;
  }
  ul>li>a>.cons{
    /* border:1px solid rgb(83, 38, 207); */
    width: 70%;
    padding: 7px 10px;
    box-sizing: border-box;
  }
  ul>li>a>.cons>p{
    margin: 0;
    font-size: 0.9rem;
  }
  ul>li>a>.cons>p:nth-child(1){
    color:rgb(136, 212, 226);
    font-size: 1rem;
    margin-bottom:5px; 
  }
  ul>li>a>.cons>p:nth-child(2){
    overflow: hidden;
    text-overflow: ellipsis;
  }
  ul>li>a>.titles{
      width: 48px;
      margin: 4px;
      padding: 0 4px;
      font-size: 0.85rem;
    background: #aaa;
    color:#fff;
    word-wrap:break-word ;
    overflow: hidden;
     text-overflow: ellipsis;
  }
</style>