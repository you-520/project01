<template>
  <div>
    <div>
        <van-nav-bar
        fixed
        :title="headTitle"
        :left-arrow="headTitle !== '首页'"
        :right-text="logintext"
        @click-left="onClickLeft"
        @click-right="onClickRight">
        <van-image
          v-if="loginaction"
          round
          width="30px"
          height="30px"
          :src="image"  rel="external nofollow"
          slot="right"
        />
        </van-nav-bar>
    </div>
    <div>
      <van-tabbar v-model="active" active-color="#EB1F69" inactive-color="#A1A1A1" route>
        <van-tabbar-item replace to="/" name="首页">
          <span>首页</span>
          <template #icon="props">
          <img :src="props.active ? icon.inactive : icon.active" />
          </template>
        </van-tabbar-item>
        <van-tabbar-item replace to="/order" name="点餐">
            <span>点餐</span>
            <template #icon="props">
            <img :src="props.active ? icon.inactive1 : icon.active1" />
            </template>
        </van-tabbar-item>
        <van-tabbar-item replace to="/take" name="取餐">
            <span>取餐</span>
            <template #icon="props">
            <img :src="props.active ? icon.inactive2 : icon.active2" />
            </template>
        </van-tabbar-item>
        <van-tabbar-item replace to="/mine" name="我的">
            <span>我的</span>
            <template #icon="props">
            <img :src="props.active ? icon.inactive3 : icon.active3" />
            </template>
            </van-tabbar-item> 
        </van-tabbar>
    </div>
    <router-view></router-view>
  </div>
    
</template>

<script>
  import { Toast } from 'vant';
  export default {
  data() {
    return {
      active: "首页",
      logintext:'',
      image:'',
      avatar:'',
      loginaction:false,
      headTitle:'首页',
      isHome:true,
      icon: {
        active: './image/index_active.png',
        inactive: './image/index_inactive.png',
        active1: './image/order_active.png',
        inactive1: './image/order_inactive.png',
        active2: './image/take_active.png',
        inactive2: './image/take_inactive.png',
        active3: './image/mine_active.png',
        inactive3: './image/mine_inactive.png',
      },
    };
  },
  methods: {
    onClickLeft() {
      this.$router.go(-1)
    },
    onClickRight() {
      if(this.loginaction){
        this.$router.push('/userData');
      }else{
        this.$router.push('/loginin');
      }
      
    },
  },
  mounted(){
    this.headTitle=sessionStorage.getItem('title');
    let token=localStorage.getItem('token')?localStorage.getItem('token'):sessionStorage.getItem('token');
    if(token){
        let {uname,avatar}=JSON.parse(localStorage.getItem('user')?localStorage.getItem('user'):sessionStorage.getItem('user'));
        this.logintext=uname;
        this.image=require('../assets/mine/'+avatar);
        this.loginaction=true;
    }else{
        this.logintext='请登录';
        this.loginaction=false;
    }
  },
  beforeRouteUpdate(to, from, next) {
    //console.log(to.query.title)
    this.headTitle=sessionStorage.getItem('title');
    next();
  }
  };
</script>

<style scoped>
.van-nav-bar__text {
    color: #323233;
}
</style>
