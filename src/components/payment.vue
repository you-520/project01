<template>
  <div>
    <div>
      <van-nav-bar
        title="订单结算"
        left-arrow
        @click-left="onClickLeft"
        @click-right="onClickRight"
        fixed
      />
    </div>
    <div class="pay-first">
      <div class="pay-on">
        <van-field
          style="font-size:18px;padding:0;font-weight: 600; border-bottom:0;"
          readonly
          clickable
          label="取餐时间"
          :value="value"
          placeholder="我已到店   >"
          @click="showPicker = true"
        />
        <van-popup v-model="showPicker" round position="bottom">
          <van-picker
            show-toolbar
            :columns="columns"
            @cancel="showPicker = false"
            @confirm="onConfirm"
          />
        </van-popup>
      </div>
      <div class="pay-tw">
        <h2 style="font-size:18px">用餐方式</h2>
        <div class="pay-tw-conyent">
          <van-radio-group v-model="radio" direction="horizontal">
            <van-radio checked-color="#e50055" name="1">打包带走</van-radio>
            <van-radio checked-color="#e50055" name="0">店内用餐</van-radio>
          </van-radio-group>
          <p style="font-size:10px;color:#f6b343;margin:5px 0">为了您和家人的健康，建议选择打包带走</p>
        </div>
      </div>
    </div>
    <div class="pay-second">
      <h2 style="font-size:18px">商品明细</h2>
      <div class="pay-th" v-for="(item,index) in goodsList" :key="index">
        <div class="pay-th-content">
          <p>{{item.title}}</p>
          <span>{{item.sugar?item.tem+'/'+item.sugar:item.tem}}</span>
        </div>
        <p style="color:#898989;font-size:10px">x{{item.count}}</p>
        <p style="color:#535353">￥{{item.price}}</p>
      </div>
      <div class="pay-fo">
        <p style="color:#535353">优惠券</p>
        <p style="color:#898989;font-size:15px">暂无可用</p>
      </div>
      <div class="pay-fi">
        <p>
          共计{{goodsList.length}}件商品，小计:
          <span>￥{{total}}</span>
        </p>
      </div>
    </div>
    <div class="pay-third">
      <h1 style="font-size:18px">备注</h1>
      <router-link to="/remark">
        <p>{{mark}} ></p>
      </router-link>
    </div>
    <div class="pay-footer">
      <van-tabbar fixed>
        <p>￥{{total}}</p>
        <van-button color="#e50055" text="去支付" @click="show1()" />
        <van-overlay :show="show">
          <div class="wrapper">
            <div class="block" style="padding:20px;">
              <!-- <img width="200px" src="../assets/mine/head.jpg" alt=""> -->
              <div id="qrcode" ref="qrcode"></div>
              <p style="font-size:14px;color:#333;text-align:center;margin-top:10px;">请使用微信扫一扫支付</p>
            </div>
          </div>
        </van-overlay>
      </van-tabbar>
    </div>
  </div>
</template>
<script>
import QRCode from "qrcodejs2";
import { Toast } from "vant";
import { setTimeout } from "timers";
export default {
  data() {
    return {
      radio: "1",
      show: false,
      value: "",
      showPicker: false,
      columns: [
        "11:00",
        "12:00",
        "13:00",
        "14:00",
        "15:00",
        "16:00",
        "17:00",
        "18:00",
      ],
      mark: "",
      goodsList:[],
      goodsDetail:{},
      order_code: "",
      total:0,
      add_time:"",
    };
  },
  created() {
    this.goodsList=eval('(' + window.localStorage.getItem('shopCart') + ')');
    let uid=JSON.parse(window.sessionStorage.getItem('user')).uid||JSON.parse(window.localStorage.getItem('user')).uid
    this.total = window.localStorage.getItem('total');
    this.order_code = this.getOrderCode();
    window.localStorage.setItem('order_code',this.order_code);
    window.localStorage.setItem('add_time',this.add_time)
  },
  methods: {
    onClickLeft() {
      this.$router.push("/order");
    },
    onClickRight() {},
    onConfirm(value) {
      this.value = value;
      this.showPicker = false;
    },
    show1() {//订单兑换码
      var goods_code = "";
      if (window.localStorage.getItem("goods_code")) {
        goods_code = localStorage.getItem("goods_code")
        console.log(goods_code)
        goods_code = parseInt(goods_code);
        goods_code++;
      } else {
        goods_code = 1;
      }
      localStorage.setItem("goods_code", goods_code);
      this.show = true;
      setTimeout(() => {
        sessionStorage.setItem("isPay", true);
        this.show = false;
        Toast.success("支付成功");
        setTimeout(() => {
          this.$router.push({ path: "/take", query:{goodsList:this.goodsList,order_code:this.order_code,total:this.total,add_time:this.add_time}});
        }, 500);
      }, 1000);
    },

    getOrderCode() {
      // 时间戳
      var time = new Date();
      // 年
      var year = String(time.getFullYear());
      // 月
      var mouth = String(time.getMonth() + 1);
      if (mouth.length < 2) {
        mouth = "0" + mouth;
      }
      // 日
      var day = String(time.getDate());
      if (day.length < 2) {
        day = "0" + day;
      }
      // 时
      var hours = String(time.getHours());
      if (hours.length < 2) {
        hours = "0" + hours;
      }
      // 分
      var minutes = String(time.getMinutes());
      if (minutes.length < 2) {
        minutes = "0" + minutes;
      }
      // 秒
      var seconds = String(time.getSeconds());
      if (seconds.length < 2) {
        seconds = "0" + seconds;
      }
      this.add_time = year+"-"+mouth+"-"+day+" "+hours+":"+minutes+":"+seconds;
      window.localStorage.setItem('add_time',JSON.parse(JSON.stringify(this.add_time)));
      var str = "DD" + minutes + year + seconds + hours + day + mouth;
      return str;
    },
    qrcode() {
      let qrcode = new QRCode("qrcode", {
        width: 200,
        height: 200, // 高度
        text: "3595291981106072335", // 二维码内容
        colorDark: "#000", //前景色
        colorLight: "#fff", //背景色
        correctLevel: QRCode.CorrectLevel.L, //容错等级
      });
    },
  },
  mounted() {
    this.qrcode();
    let msg = this.$route.params.mark;
    // console.log(msg);
    if (msg != undefined) {
      this.mark = msg;
    } else {
      this.mark = "口味、偏好等要求";
    }
  },
};
</script>
<style scoped>
.pay-first {
  margin-top: 50px;
  padding: 3px 12px;
  border: 1px solid #f3f3f3;
  border-radius: 5px;
  margin-left: 10px;
  margin-right: 10px;
}
.pay-on {
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 1px solid #f3f3f3;
  padding: 13px 0;
}
.pay-on h2 {
  width: 250%;
}
.van-radio__label {
  font-size: 14px;
}
.pay-tw {
  display: flex;
  justify-content: space-between;
  padding: 13px 0;
}
.pay-tw-conyent {
  display: flex;
  flex-direction: column;
}
.pay-second {
  border: 1px solid #f3f3f3;
  margin: 10px;
  border-radius: 5px;
  padding: 3px 12px;
}
.pay-second h2 {
  border-bottom: 1px solid #f3f3f3;
  padding: 13px 0;
}
.pay-th {
  display: flex;
  justify-content: space-between;
  border-bottom: 1px solid #f3f3f3;
  padding: 13px 0;
  align-items: center;
}
.pay-th-content {
  display: flex;
  flex-direction: column;
}
.pay-th-content span {
  font-size: 10px;
  transform: scale(0.9);
  color: #999;
}
.pay-fo {
  display: flex;
  justify-content: space-between;
  border-bottom: 1px solid #f3f3f3;
  padding: 13px 0;
}
.pay-fi {
  text-align: right!important;
  padding: 10px 0;
}
.pay-fi p {
  color: #898989;
  font-size: 15px;
}
.pay-fi span {
  color: #e50055;
  font-size: 18px;
}
.pay-third {
  border: 1px solid #f3f3f3;
  margin: 10px;
  border-radius: 5px;
  padding: 15px 12px;
  display: flex;
  justify-content: space-between;
}
.pay-third p {
  color: #999;
  font-size: 15px;
}
.van-tabbar {
  justify-content: space-between;
  width: 93% !important;
  margin: 5px 12px;
  align-items: center;
}
.van-tabbar P {
  color: #e50055;
  font-size: 20px;
  font-weight: 600;
}
.van-tabbar button {
  width: 100px;
  height: 40px;
  border-radius: 20px;
  border: 0;
  color: #fff;
  background-color: #e50055;
  font-size: 17px;
}
.content {
  padding: 16px 16px 160px;
}
.van-cell::after {
  border-bottom: 0;
}
.van-field__label {
  margin-right: 133px !important;
}
.van-field__label span {
  color: #000;
  margin-right: 12px;
}
.van-picker__toolbar button {
  color: #000 !important;
  background-color: #fff !important;
  font-size: 16px !important;
}
.van-picker__toolbar button:last-child {
  color: #62c22e !important;
}
.van-field__control {
  font-size: 14px;
  font-weight: 400;
}
.wrapper {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
}

.block {
  width: 200px;
  height: 220px;
  background-color: #fff;
}
</style>