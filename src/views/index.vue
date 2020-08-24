<template>
    <div class="body">
      <div>
        <van-swipe class="my-swipe" :autoplay="3000" indicator-color="white">
            <van-swipe-item v-for="(item,i) of swiper" :key="i"><img :src="item" alt=""></van-swipe-item>
        </van-swipe>
      </div>
      <div class="select-card" v-for="(item,i) of lists" :key="i" @click="topage(item.id)">
          <div class="index-left">
              <div class="image">
                  <img :src="item.image" alt="">
              </div>
              <div class="text">
                  <h2>{{item.title}}</h2>
                  <p>{{item.detail}}</p>
              </div>
          </div>
        <div class="index-right">
            <img src="../../public/image/right.png" alt="">
        </div>
      </div>
      <div class="card">
          <div class="card-left">
              <div class="card-top">
                  <h4>甜蜜俱乐部</h4><img src="../../public/image/king.png" alt="">
              </div>
              <p>甜蜜俱乐部是针对蜜雪冰城的忠</p>
              <p>实粉丝推出的会员服务</p>
          </div>
          <div class="card-right">
              <img src="../../public/image/bottom_right.png" alt="">
          </div>
      </div>
    </div>
</template>
<script>
export default {
    data() {
    return{
        swiper:[
           require( "../../public/image/swiper1.jpg"),
           require("../../public/image/swiper2.jpg"),
           require("../../public/image/swiper3.jpg")
        ],
        lists:[
         {
          id:1,
          image:require("../../public/image/takeaway_menu.png"),
          title:"手机点餐",
          detail: "无需排队，快速下单"
        },
         {
          id:2,
          image:require("../../public/image/exchange.png"),
          title:"兑换码",
          detail: "输入兑换码，兑换优惠券"
        },           
         {
          id:3,
          image:require("../../public/image/discounts.png"),
          title:"优惠券",
          detail: "下单优惠，纵享甜蜜"
        }      
      ]
    }
    },
     methods: {
        onClickLeft() {
        Toast('返回');
        },
        onClickRight() {
        Toast('按钮');
        },
        topage:function(id){
            if(id==1){
              this.$router.push('/order');
            }else if(id==2){
               this.$router.push('/exchange');
           }else if(id==3){
               this.$router.push('/discountcoupon');
           }
        }
    },
}
</script>
<style>
   
  .my-swipe .van-swipe-item {
    color: #fff;
    text-align: center;
  }
  .my-swipe .van-swipe-item img{
       width: 100%;
       height: 200px;
       margin-top:45px;
  }
  .body{
      background-color: #fff;
      padding-bottom:10px; 
  }
  .select-card{
      margin:15px 10px;
      border-bottom: 1px solid rgb(244, 244,244);
      display: flex;
      justify-content: space-between;
      align-items: center
  }
  .index-left{
      display: flex;
  }
  .index-right img{
      opacity: 0.2;
  }
  .image img{
      border-radius: 50%;
  }
  .text{
      margin-left: 10px;
      padding-top: 7px;
  }
  .text h2{
    font-size: 17px;
    font-weight: 800;
  }
  .text p{
    font-size: 13px;
  } 
  .card{
      display: flex;
      justify-content: space-between;
      background-color: #fde9ea;
      margin: 0 10px;
      border-radius: 5px;
      margin-bottom: 20px;
  } 
  .card-left{
      margin-left:10px;
  }  
  .card-top{
      display: flex;
      margin-top: 10px;
      align-items: center
  }
  .card-top img{
      padding-bottom: 7px;
  }
  .card-top h4{
      font-size: 17px;
      font-weight: 600
  }
  .card-left p{
      font-size: 5px;
  }
  .card-right{
      border-radius: 5px
  }
  .card-right img{
      border-radius: 5px;
      width: 175px
  }
</style>