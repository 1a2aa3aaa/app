<template>
<div id="content">
<input type="text" id="t1" :class="acti[1]" v-model="ptitle" placeholder="精美的标题更能吸引别人的注意哦~"> 
<select id="t2"  :class="acti[0]" v-model="cid" >
    <option></option>
<option value="1">前端大全</option>
 <option value="2">后端大全</option>
  <option value="3">框架大全</option>
   <option value="4">组件大全</option>
</select>

<br>
<textarea @keyup.13="fb" id="t3" :class="acti[2]" type="text" v-model="pcontent" placeholder="新鲜的内容更容易上热门哦~">
</textarea> 
  <button @click="fb">发表</button> 
</div>
</template>
<script>
   export default{
       data(){
           return{
               ptitle:"",
               pcontent:"",
               cid:1,
               acti:["no","no","no"],
           }
       },
       methods:{
           fb(){
              // console.log(this.cid);
              // console.log(this.ptitle);
              // console.log(this.pcontent);
               if(this.cid==""){
                    this.$toast("请选择发布的版块");
                   this.acti.splice(0,1,"active");
               }else if(this.ptitle==""){
                    this.$toast("标题不能为空");
                    this.acti.splice(1,1,"active");
               }else if(this.pcontent==""){
                   this.$toast("内容不能为空");
                   this.acti.splice(2,1,"active");
               }else{
                   var url="/product/postings";
                //    var obj={
                //        sid:this.cid,
                //        ptitle:this.ptitle,
                //        pcontent:this.pcontent
                //    };
                var obj=`sid=${this.cid}&ptitle=${this.ptitle}&pcontent=${this.pcontent}`;
                   this.axios.post(url,obj).then(res=>{
                       //console.log(res.data.code);
                       if(res.data.code==0){
                          this.$toast("请先登录");
                          this.$router.push("/ceshi1");
                       }
                       if(res.data.code==1){
                          this.$toast("发布成功");
                           this.$router.push("/product1");
                       }
                   }).catch(err=>{
                        console.log(err);
                   })
               }
           }
       },
      mounted () { 
            document.getElementById('t1').focus()
            }
   }
</script>
<style scoped>
#content{
    margin-top:50px;
}
input{
    width: 70%;
    height:30px;
    margin-top: 10px;
    margin-bottom: 10px;
    /* outline: 0;
    border:0; */
     box-sizing: border-box;
}
textarea{
    width: 100%;
    height:500px;
     /* outline: 0;
    border:0; */
    box-sizing: border-box;
    font-size:1rem;
}
select{
    outline: 0;
    border:0;
}
#t2{
    margin-left:5%; 
    width: 20%;
}
button{
    background:rgb(136, 212, 226); 
      outline: 0;
    border:0;
    color:#fff;
    font-size:1rem;
    width:70px;
    height:30px;
}
.active{
     border:1px solid red;
}
</style>