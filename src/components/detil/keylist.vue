<template>
  <div id="d2">
    <ul class="no">
      <li v-for="(item,i) in rows" :key="i">
        <div id="list">
          <div @click="tiaozhuan(ppid[i])" class="top">
            <div>
              <!-- 头像 -->
              <img :src="`${$store.state.pathurl}${uhead[i]}`" alt />
              <!-- 发帖人名字 -->
            </div>
            <div>
              <p>{{uname[i]}}</p>
              <!-- 时间 -->
              <p class="time">{{ptime[i]}}</p>
            </div>
          </div>
          <div @click="tiaozhuan(ppid[i])" class="center">
            <!-- 标题 -->
            <p class="title" v-html="ptitle[i]"></p>
          </div>
          <div class="bottom">
            <a href="javascript:;">
              <img :src="require(`../../assets/zhuanfa1.png`)" alt />
            </a>
            <a href="javascript:;" @click="scan(ppid[i],i)">
              <img :src="require(`../../assets/${isc[i]}`)" alt />
            </a>
            <a href="javascript:;">
              <img :src="require(`../../assets/xinxi1.png`)" alt />
            </a>
            <!-- 判断是否点过赞 -->
            <a href="javascript:;" @click="dzan(ppid[i],i)">
              <!-- 函数传参,传该贴id,下标, -->
              <img :src="require(`../../assets/${iszan[i]}`)" alt />
              <span :class="isactive[i]">{{pzan[i]}}</span>
            </a>
          </div>
        </div>
      </li>
    </ul>
    <span v-if="isnull">没有找到更多的~~</span>
  </div>
</template>
<script>
export default {
  props: ["val"],
  data() {
    return {
      iszan: [], //点赞否
      isactive: [], //是否选中
      rows: [], //显示的数据
      zpid: [], //点赞表帖子的id
      ptime: [], //帖子的时间
      ppid: [], //帖子的id
      ptitle: [], //帖子的标题
      pzan: [], //帖子的赞的数量
      uhead: [], //发帖人的头像
      uname: [], //发帖人的名字
      uid: [], //发帖人的id
      cpid: [], //我收藏表的帖子id
      isc: [], //判断是否收藏
      isnull: false
    };
  },
  computed: {},
  watch: {
    val() {
      if (this.val != "") {
        this.loadList();
      } else {
        this.rows = [];
        this.iszan = [];
        this.isactive = [];
        this.rows = [];
        this.zpid = [];
        this.ptime = [];
        this.ppid = [];
        this.ptitle = [];
        this.pzan = [];
        this.uhead = [];
        this.uname = [];
        this.uid = [];
        this.cpid = [];
        this.isc = [];
        this.isnull = false;
      }
    }
  },
  methods: {
    //页面跳转的方法
    tiaozhuan(pid) {
      // console.log(pid);
      this.$router.push({
        name: "detil",
        query: { pid: pid }
      });
    },
    loadList() {
      //发送ajax请求
      var url = "detail/search";
      var obj = { val: this.val };
      this.axios
        .get(url, { params: obj })
        .then(res => {
          //console.log(res);
          //得到点赞表帖子的id
          this.rows = res.data.rows;
          if (this.rows.length == 0) {
            this.isnull = true;
          } else {
            this.isnull = false;
          }
          this.zpid = res.data.pid;
          //得到收藏表帖子的id
          this.cpid = res.data.cpid;
          //console.log(this.zpid);
          //console.log(this.cpid);
          //得到帖子所有信息
          for (var key of res.data.rows) {
            this.ptime = this.ptime.concat(key.ptime);
            this.ppid = this.ppid.concat(key.pid);
            key.ptitle = key.ptitle
              .toString()
              .replace(this.val, `<span style="color:red">${this.val}</span>`);
            this.ptitle = this.ptitle.concat(key.ptitle);
            //this.ptitle=this.ptitle.toString().replace(this.val,`<span style="color:red">${this.val}</span>`);
            //console.log(this.ptitle);
            this.pzan = this.pzan.concat(key.pzan);
            this.uhead = this.uhead.concat(key.uhead);
            this.uname = this.uname.concat(key.uname);
            this.uid = this.uid.concat(key.uid);
          }
          //console.log(this.uhead);
          this.list();
          this.coll();
        })
        .catch(err => {
          console.log(err);
        });
    },
    list() {
      //判断点赞与否
      //不登录返回的zpid就是0
      //console.log(this.zpid);
      if (this.zpid.length > 0) {
        //如果登陆了
        //第一遍从0开始,往后加5
        for (var i = 0; i < this.ppid.length; i++) {
          //遍历判断两个数组里是否有g等的
          this.iszan[i] = "dianzan1.png"; //是否点赞默认否
          this.isactive[i] = "noactive";
          //获取zpid里我点赞了几个
          for (var j = 0; j < this.zpid.length; j++) {
            //遍历找到点赞的每个帖子下标
            if (this.ppid[i] == this.zpid[j]) {
              //有就提出来
              this.iszan[i] = "dianzan.png";
              this.isactive[i] = "active";
            }
          }
        }
      } else {
        for (var i = 0; i < this.ppid.length; i++) {
          this.iszan[i] = "dianzan1.png";
        }
      }
      //console.log(this.iszan);
    },
    //判断是否收藏
    coll() {
      //不登录返回的zpid就是0
      if (this.zpid.length > 0) {
        //如果登陆了
        //第一遍从0开始,往后加5
        for (var i = 0; i < this.ppid.length; i++) {
          //遍历判断两个数组里是否有g等的
          this.isc[i] = "shoucang1.png"; //是否收藏默认否
          for (var j = 0; j < this.cpid.length; j++) {
            //遍历找到点赞的每个帖子下标
            if (this.ppid[i] == this.cpid[j]) {
              //有就提出来
              this.isc[i] = "shoucang.png";
            }
          }
        }
      } else {
        for (var i = 0; i < this.ppid.length; i++) {
          this.isc[i] = "shoucang1.png";
        }
      }
      //console.log(this.isc);
    },
    //   点赞功能
    dzan(ppid, i) {
      //获得该贴的下标,和帖子id
      if (this.iszan[i] == "dianzan.png") {
        //点过赞
        var is = 1;
      } else {
        //没点过
        var is = 0;
      }
      var url = "product/dzan";
      //var obj={pid:ppid,is:is};
      var obj = `pid=${ppid}&is=${is}`;
      this.axios.put(url, obj).then(res => {
        // console.log(res);
        if (res.data.code == 0) {
          this.$toast("请先登录");
          this.$router.push("/ceshi1");
        } else {
          if (is == 1) {
            this.iszan.splice(i, 1, "dianzan1.png");
            this.isactive.splice(i, 1, "no");
          } else {
            this.iszan.splice(i, 1, "dianzan.png");
            this.isactive.splice(i, 1, "active");
          }
          this.pzan.splice(i, 1, res.data.gzan[0].pzan);
        }
      });
    },
    // 收藏功能
    scan(ppid, i) {
      //获得该贴的下标,和帖子id
      if (this.isc[i] == "shoucang.png") {
        //收藏过
        var is = 1;
      } else {
        //没收藏过
        var is = 0;
      }
      var url = "product/scan";
      //var obj={pid:ppid,is:is};
      var obj = `pid=${ppid}&is=${is}`;
      this.axios.put(url, obj).then(res => {
        //console.log(res);
        if (res.data.code == 0) {
          this.$toast("请先登录");
          this.$router.push("/ceshi1");
        } else {
          if (is == 1) {
            this.isc.splice(i, 1, "shoucang1.png");
          } else {
            this.isc.splice(i, 1, "shoucang.png");
          }
        }
      });
    }
  }
};
</script>
<style scoped>
* {
  margin: 0;
  padding: 0;
  font-family: "宋体";
}
#d2 {
  height: 80%;
  /* padding-bottom:50px;  */
}
#d2 > h3 {
  margin-top: 10px;
  margin-left: 10px;
}
.no {
  padding: 0;
}
.no > li {
  list-style: none;
  box-shadow: 1px 1px 1px 1px #ccc;
  height: 120px;
  margin-top: 10px;
  margin-bottom: 20px;
  padding: 20px 20px 0 20px;
}
.no > li:hover {
  box-shadow: 3px 3px 3px 3px rgb(126, 125, 125);
}
#list {
  width: 100%;
  height: 100px;
  /*background:#fff;*/
  /*box-shadow: 1px 1px 1px 1px #fff;*/
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

#list > .top {
  width: 100%;
  height: 80%;
  display: flex;
  justify-content: left;
  margin-bottom: 10px;
}
#list > .top > div > img {
  width: 50px;
  height: 50px;
  border-radius: 50%;
}
#list > .top > div {
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  margin-right: 5px;
  /* align-items: center; */
}
#list > .top > div > p {
  color: rgb(86, 188, 206);
  font-weight: bold;
  font-size: 1.2rem;
}
#list > .top > div > .time {
  font-size: 1rem;
  color: #ccc;
  font-weight: normal;
}
#list > .center {
  padding-bottom: 10px;
  border-bottom: 1px solid rgba(222, 222, 222, 0.5);
}
#list > .bottom {
  display: flex;
  justify-content: space-between;
  padding-top: 10px;
}
#list > .bottom > a {
  width: 25%;
  text-align: center;
  color: #ccc;
  text-decoration: none;
}
#list > .bottom .active {
  color: rgb(136, 212, 226);
}
.loading-box {
  height: 80px;
  margin: 0 auto;
}
/* .loading-box .mint-spinner-snake{
 
} */
.no-more {
  height: 80px;
  text-align: center;
}
</style>