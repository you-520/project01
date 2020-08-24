<template>
  <div>
    <div v-if="isPay == true" class="ordertail">
      <div class="ordertail_cotent">
        <div class="ordertail_detail">
          <div class="ordertail_title">
            <div>预约18:15</div>
            <span>取餐号</span>
            <img src="../assets/mine/icon/qrcode.png" alt="" @click="takeqrcode">
          </div>
          <h1 v-if="goods_code<10">000{{goods_code}}</h1>
          <h1 v-if="goods_code<100&&goods_code>9">00{{goods_code}}</h1>
          <h1 v-if="goods_code<1000&&goods_code>99">0{{goods_code}}</h1>
          <h1 v-if="goods_code<10000&&goods_code>999">{{goods_code}}</h1>
          <div class="ordertail_state">
            <div class="ordertail_state_now">
              <img src="../assets/mine/icon/order1.png" alt="">
              <p>已下单</p>
            </div>
            <h4>·········</h4>
            <div>
              <img src="../assets/mine/icon/order2.png" alt="">
              <p>制作中</p>
            </div>
            <h4>·········</h4>
            <div class="ordertail_state_now">
              <img src="../assets/mine/icon/order3.png" alt="">
              <p>可取餐</p>
            </div>
          </div>
        </div>
        <div class="ordertail_order">
          <div class="ordertail_order_top" v-for="(item,index) in goodsList" :key="index">
            <div class="ordertail_order_left">
              <p>{{item.title}}</p>
              <span>{{item.sugar?item.tem+'/'+item.sugar:item.tem}}</span>
            </div>
            <div class="ordertail_order_right">
              <span>×{{item.count}}</span>
              <span>￥{{item.price}}</span>
            </div>
          </div>
          <div class="ordertail_order_top ordertail_order_bottom">
            <div class="ordertail_order_left">
              <p class="ordertail_order_p">合计</p>
            </div>
            <div class="ordertail_order_right">
              <span>￥{{total}}</span>
            </div>
          </div>
          <p>下单时间：{{add_time}}</p>
          <p>订单编号：{{order_code}}</p>
        </div>
      </div>
    </div>
    <div v-if="isPay == false">
      <div class="take-img">
        <img src="../../public/image/orderfrom.png" alt />
      </div>
      <div class="take-text">
        <p>您还没有订单，快去点一杯吧~</p>
      </div>
      <div class="take-btn">
        <button @click="toorder()">去点单</button>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      isPay: false,
      goodsList: [],
      goods_code:"",
      total:0,
    };
  },
  created() {
     this.goodsList=eval('(' + window.localStorage.getItem('shopCart') + ')');
     this.order_code = localStorage.getItem("order_code");
     this.total = localStorage.getItem("total");
     this.add_time = localStorage.getItem("add_time");
     this.goods_code = localStorage.getItem("goods_code");
    if (sessionStorage.getItem("isPay")) {
      this.isPay = true;
    } else {
      this.isPay = false;
    }
  },
  methods: {
    toorder() {
      this.$router.push("/order");
    },
    takeqrcode(){
         this.$router.push({path:"/claim",query:{
             goods_code:this.goods_code
         }});
    },
  },
};
</script>
<style scoped>
.take-img img {
  margin: 20px 24px;
}
.take-text p {
  text-align: center;
  font-size: 17px;
  margin-bottom: 180px;
}
.take-btn button {
  text-align: center;
  width: 80%;
  margin-left: 10%;
  height: 50px;
  background-color: #e50055;
  color: #fff;
  border: 0;
  border-radius: 5px;
}
.ordertail {
  margin-top: 46px;
  background-color: #f3f3f3;
  padding: 10px;
  height: 555px;
}
.ordertail_cotent {
  background-color: #fff;
  padding-top: 15px;
  font-size: 15px;
}
.ordertail_detail {
  border-bottom: 1px solid #f3f3f3;
  border-radius: 5px;
}
.ordertail_title {
  display: flex;
  justify-content: space-between;
}
.ordertail_title div {
  background-color: #403c38;
  color: #fff;
  padding: 4px 10px;
  border-top-right-radius: 15px;
}
.ordertail_state_now {
  opacity: 0.4;
}
.ordertail_state p {
  font-size: 13px;
}
.ordertail_title img {
  margin-right: 15px;
}
.ordertail_detail h1 {
  text-align: center;
}
.ordertail_state {
  display: flex;
  justify-content: space-around;
  padding: 0 20px;
  margin: 15px 0;
}
.ordertail_state h4 {
  height: 53px;
  line-height: 43px;
}
.ordertail_order {
  padding: 10px;
}
.ordertail_order_top {
  display: flex;
  justify-content: space-between;
  margin: 10px 0;
}
.ordertail_order_left span {
  font-size: 12px;
  color: #adadad;
}
.ordertail_order_right {
  padding: 7px;
}
.ordertail_order_right span:last-child {
  margin-left: 50px;
}
.ordertail_order_p {
  padding: 7px;
}
.ordertail_order_bottom {
  margin-top: 20px;
  padding-bottom: 10px;
  border-bottom: 2px solid #f3f3f3;
}
.ordertail_order > p {
  font-size: 12px;
  color: #adadad;
  margin: 5px;
}
</style>
