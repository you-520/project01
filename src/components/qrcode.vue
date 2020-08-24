<template>
    <div class="content">
        <div>
         <van-nav-bar
            title="会员码"
            left-arrow
            @click-left="onClickLeft"
            @click-right="onClickRight"
            fixed/>
        </div>
        <div class="qrcode">
           <div class="text1">
               <p>请向商家出示二维码</p>
           </div>
            <img id="barcode"/>
            <p class="text-p">3595291981106072335</p>
            <div id="qrcode" ref="qrcode"></div>
        </div>
    </div>
</template>
<script>
import JsBarcode from 'jsbarcode'
import QRCode from 'qrcodejs2'
var jsBarcode = require('jsbarcode')

export default {
    data(){
        return{

        }
    },
     methods: {
        onClickLeft() {
        this.$router.go(-1)
        },
        onClickRight() {
        
        },
        qrcode() {
        let qrcode = new QRCode('qrcode', {
            width: 128,
            height: 128, // 高度
            text: '佳倩小仙女，今晚到我房里来', // 二维码内容
            colorDark : '#000',      //前景色
            colorLight : '#fff',      //背景色
            correctLevel : QRCode.CorrectLevel.L     //容错等级 
        })
        console.log(qrcode)
        }
    },
    mounted(){
     JsBarcode("#barcode", "3595291981106072335",{
             format: "CODE128",  //条形码的格式
             lineColor: "#000",  //线条颜色
             width:2, //线宽
             height:60,  //条码高度
             displayValue: false //是否显示文字信息
           });
           this.qrcode()
        },
 }
</script>
<style scoped>
 .qrcode{
     margin: 46px 10px 200px 10px;
     border: 1px solid #f6ca8a;
     background: #fff;
     border-radius: 10px;
 }
 .content{
     background-color: #f6ca8a;
     height: 617px;
     padding-top: 50px;
 }
 .text1{
     background: #fceedc;
     border-radius: 10px 10px 0 0;
 }
 .text1 p{
     padding: 10px;
     text-align: center
 }
 #barcode{
     margin-top: 30px;
     margin-left: 10px;
     width: 95%;
 }
 .text-p{
     text-align: center;
     margin-bottom: 30px;
 }
 #qrcode{
    margin-left: 30%; 
    margin-bottom: 10%
 }
</style>
