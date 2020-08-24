<template>
    <div class="container">
       <div>
         <van-nav-bar
            title="会员等级"
            left-arrow
            @click-left="onClickLeft"
            @click-right="onClickRight"
            fixed/>
        </div>
        <div class="m-card">
            <img src="../../public/image/m-card.png" alt="">
        </div>
        <div class="t-header">
            <h3>晋级条件</h3>
        </div>
        <div>
            <van-steps direction="vertical" :active="0" >
                <van-step  class="t-grade" v-for="(item,i) of course" :key="i">
                  <h3>{{item.grade}}</h3>
                  <p>{{item.score}}</p>
                  <p>{{item.discount}}</p>                  
                </van-step>
            </van-steps>
        </div>
        <div class="t-explain">
           <h2>等级规则</h2>
           <div class="text">
             <p>1.在小程序消费可增加等级经验值；</p>
             <p>2.经验值达到等级要求后，将会升级并获得等级奖励；</p>
             <p>3.每个周期结束后，系统讲清除当前等级剩余经验值；</p>
             <p>4.若以满足保留等级条件，则周期结束后等级不变；</p>
             <p>5.若不满足保留等级条件，则周期结束后等级将会降级；</p>
           </div>
        </div>
        <div class="t-footer">
            <van-tabbar fixed>
                <p>订阅 "会员等级变更通知" , 升级时提醒</p>
                <button>我要订阅</button>
            </van-tabbar>
        </div>
    </div>
</template>
<script>
 export default {
    data(){
      return{
        active: 1,
        course:[
            {
                grade:"铜牌会员",
                score:"送0会员积分",
                discount:""
            },
            {
                grade:"银牌会员  消费满400元达到",
                score:"送50会员积分",
                discount:"送 满10减3优惠券3张"
            },
            {
                grade:"白银会员  消费满600元达到 ",
                score:"送50会员积分",
                discount:"送 满10减3优惠券1张 满15减6优惠券2张"
            },
            {
                grade:"黄金会员  消费满800元达到",
                score:"送80会员积分",
                discount:"送 满15减6优惠券1张 满20减8优惠券2张"
            },
            {
                grade:"铂金会员  消费满1000元达到",
                score:"送80会员积分",
                discount:"送 满20减8优惠券2张 满30减15优惠券2张"
            },
            {
                grade:"钻石会员  消费满1400元达到",
                score:"送100会员积分",
                discount:"送 满30减15优惠券3张 满20减8优惠券3张"
            }
        ]
      }
    },
    methods: {
        onClickLeft() {
            this.$router.go(-1)
        },
        onClickRight() {
        
        },
    },
 }
</script>
<style scoped>
.container{
    background-color: #fff;
    height: 862px;
}
.m-card{
    margin-top: 45px;
    padding-left: 10px;
    padding-right: 5px;
}
.m-card img{
    width: 100%;
    margin: 0 
}
.t-header h3{
    margin-left: 10px;
    font-weight: 800;
}
.t-grade{
    z-index: 0;
}
.t-grade  h3{
    font-size: 17px;
    color: #333;
    font-weight: 600;
    margin: 2px 0;
}
.t-grade  p{
   font-size: 14px;
   color: #999;
   margin: 2px;
}
.t-footer .van-tabbar p{
    font-size: 13px;
    color: #4f4f4f;
    display: block;
    margin: 13px 10px;
}
.t-footer .van-tabbar button{
    height: 25px;
    width: 60;
    padding: 0 10px;
    background-color: #04c160;
    border: 0;
    border-radius: 5px;
    color: #fff;
    font-size: 14px;
    margin-top: 10px;
    margin-left: 45px;
}
.t-explain{
    margin-bottom: 50px;
}
.t-explain h2{
    margin-left: 10px;
    font-weight: 800;
}
.text p{
    font-size: 14px;
    color: #999;
    margin: 2px;
}
</style>
