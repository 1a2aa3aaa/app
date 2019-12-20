<template>
<div>
  <div class="uhead">
      <!-- 头像 -->
      <img :src="`${$store.state.pathurl}${newhead}`" alt="">
      <!-- 点击更换头像 -->
      <p>
           <a href="javascript:;" class="a-upload">
      <input id="d1" type="file" value="点击更换" accept="image/*" @change="addImg">
      点击这里上传头像
      </a>
      </p>
      
  </div>
  <div class="content">
      <mt-field
             @blur.native.capture="err"
              label="用户名" v-model="newname" 
            placeholder="请输入修改后的用户名" type="text"></mt-field>
  <mt-field
  @keyup.13.native="set"
  @blur.native.capture="err2"  label="邮箱" v-model="newemail" 
            placeholder="请输入新的邮箱" type="text"></mt-field> 
  </div>
    <mt-button size="large" @click="set">修改资料</mt-button>
</div>
</template>
<script>
  //   注册子组件
 export default{  
     data(){
        return{
             files: [],
            uhead:"",
             newhead:"",
            uname:"",
             newname:"",
            uemail:"",
            newemail:"",
            uid:"",
            new1:"",
           is:1,
           uis:1,
        }
     },
    methods: {
       err(){
           var reg=/^\w{3,12}$/;
           //验证用户名格式是否正确
           if(this.uname==this.newname){
               return;
           }
           if(reg.test(this.newname)){
           //如果正确发送axios请求
           var url="user/sel";
           var obj={uname:this.newname};
            this.axios.get(url,{params:obj}).then(res=>{
             //console.log(res.data.code);
             if(res.data.code==1){
                this.uis=1;
             }else{
                 this.$toast("用户名被占用");
                  this.uis=0;
                  return;
             }
           }).catch(err=>{
               console.log(err);
           })
           }else{
                this.$toast("用户名格式不正确");
                this.uis=0;
                return;
           }
       },
        err2(){
            if(this.uemail==this.newemail){
               return;
           }
           var reg=/^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
           //验证格式是否正确
           if(reg.test(this.newemail)){
               this.is=1;
           }else{
            this.$toast("邮箱格式不正确");
             this.is=0;
            return;
           }
       },
        set(){
            if(this.uhead==this.newhead && this.uname==this.newname && this.uemail==this.newemail){
                this.$toast("您没有进行修改");
                 return;
            }
           // console.log(this.err2());
             this.err();
             this.err2();
             //console.log(this.is,this.uis);
             if(this.is==0||this.uis==0){
                 //console.log(1)
                return;
             }
          //var url="user/reg";
          var obj={
              uhead:this.newhead,
              uname:this.newname,
              uemail:this.newemail
           }
           var url="user/upLogin";
          // console.log(obj);
          this.axios.get(url,{params:obj}).then(res=>{
             if(res.data.code==1){
                 this.$toast("修改成功");
                 this.$router.push("/product3");
             }
          }).catch(err=>{
              console.log(err);
          })
        },
            addImg(){
            if (d1.files[0].size > 3 * 1024 * 1024) {
                 that.$toast({
                     message: "请输入3M以内的文件"
                     });
                return;
            }
             this.uploadFile(d1.files[0]); 
            },
            uploadFile: function (file) {
                var that=this;
                var item = {
                    name: file.name,
                    uploadPercentage: 0
                };
                this.files.push(item);
                //console.log(this.files);
                var fd = new FormData();
                fd.append('logo', file);
                var xhr = new XMLHttpRequest();
                // http://xingh1.applinzi.com/
		//http://127.0.0.1:5050/
                xhr.open('POST','http://xingh1.applinzi.com/upload', true);
                xhr.onreadystatechange=function(){
                if(xhr.readyState==4&&xhr.status){
                    var result=xhr.responseText;
                    //console.log(result);
                   that.newhead=JSON.parse(result).file.filename; //this在这有冲突艹
                   //console.log(that.newhead);
                   //console.log(that.uhead);
                   //that.newhead=that.uhead;
                  // console.log(that.newhead);
                }
		}
                xhr.upload.addEventListener('progress', function (e) {
                    item.uploadPercentage = Math.round((e.loaded * 100) / e.total);
                }, false);
                xhr.send(fd);
            }
  },
   created(){
        var url="detail/islogin";
        this.axios.get(url).then(res=>{
          this.uhead=res.data.data[0].uhead;
           this.uname=res.data.data[0].uname;
             this.uemail=res.data.data[0].uemail;
             this.uid=res.data.data[0].uid;
             this.newname=this.uname;
             this.newemail=this.uemail;
             this.newhead=this.uhead;
        }).catch(err=>{
          console.log(err);
        }) 
   }
  }
</script>
<style scoped>
/* .red{
    background:red;
}
.green{
    background:greenyellow;
}
div>span{ 
  display:block;
  background: gainsboro;
  width:50%;
  height: 20px;
  font-size:0.5rem;
  line-height:20px;
  margin: 10px 0 10px 10%;
  padding-left:10px;
} */
.uhead{
  width: 100%;
  height:200px;
text-align: center;
}
.uhead>img{
  width: 80px;
  height:80px;
  border-radius: 50%;
  background: #fff;
  margin-top:80px;
}
.content{
  margin-top:60px; 
}
.mint-field{
    border-top:1px solid rgb(194, 194, 194);
    margin-bottom: 4px;
    width: 80%;
    margin: auto;
}
.mint-field{
    border-bottom:1px solid rgb(194, 194, 194);
    margin-bottom:10px;
}
.mint-button--large{
    background:rgb(136, 212, 226);
    width: 80%;
    margin: 10px auto;
    color:#fff;
}
a >>>.mint-cell-title{
    width: 80px;
}
p{
    text-align: center;
    font-size:0.5rem;
    color:grey
}
p>a{
    text-decoration: none;
    color:rgb(136, 212, 226);
}
.a-upload {
    padding: 4px 10px;
    height: 20px;
    line-height: 20px;
    position: relative;
    cursor: pointer;
    overflow: hidden;
    display: inline-block;
    *display: inline;
    *zoom: 1;
    text-decoration: none;
    font-size:0.75rem;
}

.a-upload  input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    cursor: pointer
}

.a-upload:hover {
    text-decoration: none;
}
</style>