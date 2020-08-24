<template>
    <div class="integral">
        <div>
            <van-nav-bar
            title="积分商城"
            left-arrow
            @click-left="onClickLeft"
            @click-right="onClickRight"/>
        </div>
        <div class="header">
            <div class="left">
                <div class="span">
                    <span></span><span></span><span></span>
                </div>
                <p class="title">我的积分</p>
                <h1>0</h1>
                <p>获得积分后，积分有效期至<span>2021年12月31日</span></p>
            </div>
            <div class="right">
                <div class="image"><img src="../assets/mine/integral.png" alt=""></div>
                <div class="span">
                    <span></span><span></span><span></span>
                </div>
            </div>
        </div>
        <div class="integral_content">
            <div class="title">
                <div><span class="span"></span></div>
                <span class="txt">积分换券</span>
            </div>
            <!-- 优惠券列表 -->
            <div class="card_list" v-for="(list,index) of lists" :key="index">
                <div class="list_item">
                    <div class="left">
                        <p><b>￥</b><b class="num">{{list.price}}</b></p>
                        <p>满{{list.range}}元可用</p>
                    </div>
                    <div class="mindle">
                        <h4>{{list.name}}</h4>
                        <p>领取后当天有效，有效期15天</p>
                        <span>互斥券</span>
                    </div>
                    <div class="right">
                        <p>{{list.integral}}积分</p>
                        <button @click="exchange(index)" >立即兑换</button>
                    </div>
                </div>
                <div class="list_detail">
                    <router-link :to="{path:'/integralDetail', query:{ msg: `满${list.range}元减${list.price}元` }}">
                    查看详情
                    <img src="../assets/mine/icon/you.png" alt="">
                    </router-link>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import { Dialog } from 'vant';
  export default {
  components: {
    [Dialog.Component.name]: Dialog.Component,
  },
  data() {
    return {
      active: "首页",
      headTitle:"积分商城",
      lists:[
          {
            id: 1,
            price: 2,
            range:10,
            name: '2元立减券',
            integral: 200
          },
          {
            id: 2,
            price: 4,
            range:30,
            name: '4元立减券',
            integral: 400
          },
          {
            id: 3,
            price: 1,
            range:5,
            name: '1元立减优惠券',
            integral: 100
          },
          {
            id: 4,
            price: 3,
            range:20,
            name: '3元立减券',
            integral: 300
          },
      ]
    };
  },
  
  methods: {
    onClickLeft() {
      this.$router.go(-1)
    },
    onClickRight() {
      Toast('按钮');
    },
    exchange(index){
    //   Dialog({ message: '提示' });
        Dialog.confirm({
            title: '提示',
            message: `确定使用${this.lists[index].integral}积分兑换${this.lists[index].name}`,
        })
        .then(() => {
            // on confirm
            Dialog.alert({
            title: '消息提示',
            message: '积分不足',
            }).then(() => {
            // on close
            });
        })
        .catch(() => {
            // on cancel
        });
        console.log(this)
    }
  },
  };
</script>
<style>
*{
    padding: 0;
    margin: 0;
}
.header{
    display: flex;
    justify-content: space-between;
    border-bottom: 1px solid #f7f7f7;
    box-shadow: 0 0 2px 2px #f7f7f7;
    padding: 0 20px;
}
.header .span{
    height: 4px;
    display: flex;
}
.header span{
    display: inline-block;
    width: 15px;
    height: 4px;
    background-color: #e50055;
    margin-right: 7px;
    border-radius: 2px;
}
.header span:last-child{
    margin-right: 0;
}
.header .left h1{
    color: #e50055;
    font-size: 38px;
    margin: 0;
}
.header .left .title{
    margin: 15px 0;
}
.header .left>p:last-child{
    color: #9f9f9f;
    font-size: 13px;
    margin: 0 0 19px 0;
}
.header .left>p>span{
    display: inline;
    background-color: #fff;
    color: #ff9f00;
}
.header .right .image{
    margin: 26px 0;
}
.header .right .span{
    padding-left: 10%;
}
.integral_content{
    background-color: #fff;
    margin: 2px;
    padding: 10px;
}
.title{
    display: flex;
}
.title>div{
    padding-top: 3px;
}
.title .span{
    display: inline-block;
    width: 2px;
    height: 16px;
    background-color: #e50055;
    border-radius: 3px;
    margin-right: 8px;
    border: 1px solid #e50055;
}
.title .txt{
    font-size: 16px;
    color: #4d4d4d;
}
.list_item{
    display: flex;
    justify-content: space-around;
    align-items: center;
    padding: 12px 0;
}
.card_list{
    border: 1px solid #f7f7f7;
    box-shadow: 0 0 2px 1px #f7f7f7;
    border-radius: 10px;
    box-sizing: border-box;
    font-size: 13px;
    color: #666;
    padding: 0 10px;
}
.list_item .left,.mindle{
    margin-right: 15px;
}
.list_item .left>p:first-child{
    color: #f5222d;
    text-align: center;
    font-size: 18px;
    margin: 0;
}
.list_item .left .num{
    font-size: 30px;
}
.list_item .mindle{
    width: 45%;
}
.list_item .mindle h4{
    font-size: 15px;
    font-weight: 500;
}
.list_item .mindle p{
    margin: 5px 0;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.list_item .mindle span{
    background-color: #feeae6;
    color: #f32d09;
    display: inline-block;
    padding: 2px 5px;
    border-radius: 5px;
}
.list_item .right p{
    text-align: center;
    color: #f32d09;
    margin-bottom: 3px;
}
.list_item .right button{
    border: 0;
    background-color: #e50055;
    color: #fff;
    width: 80px;
    height: 30px;
    border-radius: 20px;
}
.list_detail{
    text-align: right;
    border-top:2px dotted #f7f7f7;
    padding: 8px 0;
}
</style>
