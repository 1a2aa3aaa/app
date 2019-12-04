<template>
  <div id="d1">
      <!-- <h1>{{sid}}</h1> -->
      <div class="top1">
   <ul class="no"
  v-infinite-scroll="loadMore"
  infinite-scroll-disabled="loading"
   infinite-scroll-distance="100000000"><!--//离页尾还有多少像素时触发 -->
  <li v-for="(v,i) of mess" :key="i">
      <!-- 上部分是头像 名字时间，点赞 -->
      <div class="top">
          <img :src="`${$store.state.pathurl}${v.uhead}`" alt="">
          <div class="top-2">
              <p>{{v.uname}}</p>
              <p>{{v.mtime}}</p>
          </div>
          <div class="top-3">
              <img @click="dzan(i,v.mid)" :src="`${$store.state.pathurl}${iszan[i]}`" alt="">
              <span :class="isactive[i]">{{mzan[i]}}</span>
          </div>
      </div>
      <!-- 下部分是帖子内容 -->
      <div class="bottom">
          {{v.mcontent}}
      </div>
  </li>
</ul>
</div>
<div class="loading-box" v-if="isLoading">
    <mt-spinner type="snake" class="loading-more"></mt-spinner>
 </div>
 <div class="no-more" style="height:80px;" v-if="noMore">没有更多了~</div>

  </div>
</template>
<script>
export default {
    props:["pid","url"],
    data() {
      return {
       loading:false,//false无限下拉，true不下拉
       page: 1,//页数
       bRequest: true,//控制是否请求
       isLoading:true,//加载动画：加载中改为true，
       //数来了据请求回，改为false
       noMore:false,//数据没有之后的动作
       zan:[],//赞表的内容
       mess:[],//帖子的内容
       mzan:[],//赞的下标
        iszan:[],//是否点赞默认否
        isactive:[],//是否点赞默认否
      }
    },
    computed: {
      
    },
    methods: {
        loadMore() {
        if (this.bRequest) {//开关
        console.log(1);
            this.loadList();
         }
        },
        loadList () {//下拉执行的函数，参数为页码
            //发送ajax请求
            var url=this.url;
            var obj={pno:this.page,pid:this.pid};
            //console.log(obj);
            this.axios.get(url,{params:obj}).then(res => {
                if(res.data.code==0){
                     this.$toast("请先登录");
                     this.$router.push("/ceshi1");
                }
                // console.log(res.data);
                //得到点赞表帖子的id
                this.zan=res.data.zan
               // console.log(this.zan);
                  for(var key of res.data.data){
                      this.mzan=this.mzan.concat(key.mzan);
                  }
                  // console.log(this.mzan);
                 this.isagein(res.data.data);
               
            }).catch(err=>{
                console.log(err);
             });    
         },
         isagein(mess){//判断是否还有数据
              if(mess.length==0){//当没有数据了，开关false
                this.bRequest = false;//关闭开关不再请求数据
                this.noMore=true; //没有更多字样出现
                this.isLoading=false;//加载动画隐藏，
                this.loading=true;//关掉下拉刷新
              }else{//如果还有数据
              //得到帖子所有信息,帖子分多次查询，所以拼接
                 this.mess=this.mess.concat(mess);
                 //console.log(this.mess);
                 this.isLoading=false;//关上加载动画
                 this.loading=false;
                 this.list();
                 this.page+=1;//页码加一
              }
         },
         list(){//判断点赞与否
         //查vuex判断是否登陆
                 if(this.$store.getters.getisLogin==1){//如果登陆了
                 //第一遍从0开始,往后加5
                     for(var i=(this.page-1)*5;i<this.mess.length;i++){//遍历判断两个数组里是否有g等的
                     this.iszan[i]="dianzan1.png";//是否点赞默认否
                     this.isactive[i]="n";
                     //获取zpid里我点赞了几个
                     for(var j=0;j<this.zan.length;j++){
                         //遍历找到点赞的每个帖子下标
                         if(this.mess[i].mid==this.zan[j].mid){//有就提出来
                                this.iszan[i]="dianzan.png";
                                this.isactive[i]="active";
                         }
                     }
                    }
                 }else{
                      for(var i=(this.page-1)*5;i<this.ppid.length;i++){
                           this.iszan[i]="dianzan1.png";
                           this.isactive[i]="n";
                      }
                 }
               //console.log(this.iszan);
              // console.log(this.isactive);
         }
         ,
    //   点赞功能
   dzan(i,mid){
      // console.log(1);
     //获得该贴的下标,和帖子id
     if(this.iszan[i]=="dianzan.png"){//点过赞
         var is=1;
     }else{//没点过
         var is=0;
     }
    // console.log(is);
     var url="detail/dzan";
     var obj={mid:mid,is:is};
     this.axios.get(url,{params:obj}).then(res=>{
         //console.log(res);   
             if(is==1){
                 this.iszan.splice(i,1,"dianzan1.png");
                 this.isactive.splice(i,1,"n");
             }else{
                 this.iszan.splice(i,1,"dianzan.png");
                 this.isactive.splice(i,1,"active");
             }
             //console.log(res.data.gzan[0].mzan);
            // console.log(this.mess[i]);
             this.mzan.splice(i,1,res.data.gzan[0].mzan);
         
     })
   }
   },
}
</script>
<style scoped>
*{
    margin:0;
    padding:0;
    font-family: "微软雅黑";
}
#d1{
 height: 800px;
}
ul{
     height:100%; 
    /* padding-bottom:50px;  */
}
li{
    margin: 20px 0;
}
.top{
    width: 100%;
    padding: 5px 10px;
    box-sizing: border-box;
    display: flex;
    justify-content: left;
}
.top>img{
    width: 40px;
    height: 40px;
    border-radius: 50%;
    margin-right: 10px;
}
.top>.top-2{
    width: 70%;
}
.top>.top-2>p:nth-child(2){
    color:#ccc;
}
.top>.top-3{
text-align: right;
}
.bottom{
    margin: 0 12px 0 60px;
      font-size:0.85rem;
}
.active{
    color:rgb(136, 212, 226);
}
div.no-more{
    text-align: center;
    margin-top:5px; 
    margin-bottom:10px;
}
.n{
    color:#ccc;
}
</style>
