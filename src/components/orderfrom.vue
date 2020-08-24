<template>
  <div>
    <div>
      <van-nav-bar
        title="我的订单"
        left-arrow
        @click-left="onClickLeft"
        @click-right="onClickRight"
        fixed
      />
    </div>
    <div class="order-header">
      <van-tabs v-model="activeName">
        <!-- <van-tab title="到店" name="a">
                     <div v-if="ispay == false">
                         <div class="order-img">
                             <img src="../../public/image/orderfrom.png" alt="">
                         </div>
                         <div class="order-text">
                             <p>您还没有订单，快去点一杯吧~</p>
                         </div>
                         <div class="order-btn">
                             <button @click="toorder()">去点单</button>
                         </div>
                     </div>
                </van-tab>
                <van-tab title="外卖" name="b">
                    <div v-if="ispay == false">
                         <div class="order-img">
                             <img src="../../public/image/orderfrom.png" alt="">
                         </div>
                         <div class="order-text">
                             <p>您还没有订单，快去点一杯吧~</p>
                         </div>
                         <div class="order-btn">
                             <button @click="toorder()">去点单</button>
                         </div>
                     </div>
                </van-tab>
                <van-tab title="商城" name="c">
                    <div v-if="ispay == false">
                         <div class="order-img">
                             <img src="../../public/image/orderfrom.png" alt="">
                         </div>
                         <div class="order-text">
                             <p>您还没有订单，快去点一杯吧~</p>
                         </div>
                     </div>
        </van-tab>-->
        <van-tab :title="item.title" :name="item.sta" v-for="(item,index) in menuList" :key="index"></van-tab>
      </van-tabs>
    </div>
    <div class="order-content">
        <!-- 未支付 -->
      <div v-if="ispay == false">
        <div class="order-img">
          <img src="../../public/image/orderfrom.png" alt />
        </div>
        <div class="order-text">
          <p>您还没有订单，快去点一杯吧~</p>
        </div>
        <div class="order-btn" v-if="activeName != 'c'">
          <button @click="toorder()">去点单</button>
        </div>
      </div>
      <!-- 订单list -->
      <div v-if="ispay == true">
        <div class="orderMenu">
          <div class="orderMenu-header">
            <p>蜜雪冰城</p>
            <p>制作中</p>
          </div>
          <div class="orderMenu-pic" style="display:flex;justify-content:space-between;" v-for="(item,index) in goodsInfo" :key="index">
            <img :src="item.pic" alt="" width="50px" height="50px">  
            <div style="display:flex;justify-content:space-between;align-items : center;">
              <div>{{item.title}}</div>
              <div style="margin-left: 60px">x{{item.count}}</div>
              <div style="margin-left: 30px">￥{{item.price}}</div>
            </div>
          </div>
          <div>
             <div class="orderMenu-text">
               <div class="orderMenu-Num">
                 <p>下单时间：{{add_time}}</p>
                 <p>订单编号：{{order_code}}</p>
               </div>
               <p style="margin-top:20px">￥{{total}}</p>
             </div>
             <div class="orderMenu-btn">
               <button>申请退款</button>
               <button>联系商家</button>
               <button @click="toclaim">取餐码</button>
             </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      menuList: [
        {
          title: "到店",
          sta: "a",
        },
        {
          title: "外卖",
          sta: "b",
        },
        {
          title: "商城",
          sta: "c",
        },
      ],
      ispay: false,
      add_time:"",
      activeName: "a",
      goodsInfo:[],
      goods_code:0,
    };
  },
  created() {
     this.goodsInfo=eval('(' + window.localStorage.getItem('shopCart') + ')');
     this.order_code = localStorage.getItem("order_code");
     this.total = localStorage.getItem("total");
     this.add_time = localStorage.getItem("add_time");
     this.goods_code = localStorage.getItem("goods_code");
    if(sessionStorage.getItem("isPay")){
        this.ispay = true;
    }else{
        this.ispay = false;
    }
  },
  methods: {
    onClickLeft() {
      this.$router.go(-1);
    },
    onClickRight() {},
    toorder() {
      this.$router.push("/order");
    },
    toclaim(){
      // goods_code
      this.$router.push({path:"/claim",query:{goods_code:this.goods_code}});
    }
  },
};
</script>
<style>
.order-header {
  margin-top: 45px;
}
.order-img img {
  margin: 20px 24px;
}
.order-text p {
  text-align: center;
  font-size: 17px;
  margin-bottom: 180px;
}
.order-btn button {
  text-align: center;
  width: 80%;
  margin-left: 10%;
  height: 50px;
  background-color: #e50055;
  color: #fff;
  border: 0;
  border-radius: 5px;
}
.orderMenu{
  margin: 20px 10px 0 10px;
  background-color:#fafafa;
  border-radius: 5px;
}
.orderMenu-header{
  padding: 10px 0px;
  margin: 0 15px;
  display: flex;
  justify-content: space-between;
  border-bottom: 1px solid #d0d0d0;
}
.orderMenu-pic{
  padding: 10px 0px;
  margin: 0 15px;
  border-bottom: 1px solid #d0d0d0;
}
.orderMenu-text{
  padding: 10px 0px;
  margin: 0 15px;
  display: flex;
  justify-content: space-between;
}
.orderMenu-Num{
  display: flex;
  flex-direction: column;
}
.orderMenu-btn {
  padding: 10px 0px;
  margin: 0 15px;
  text-align: right;
}
.orderMenu-btn button{
  margin-left: 10px;
  color: #707071;
  font-size: 12px;
  padding: 6px;
  border: 1px ;
}
</style>
