<template>
    <div>
        <div>
            <van-nav-bar
                title="取餐码"
                left-arrow
                @click-left="onClickLeft"
                @click-right="onClickRight"
                fixed/>
        </div>
        <div class="c-body">
            <div class="c-center">
                <h2>取餐码</h2>
          <p v-if="goods_code<10">000{{goods_code}}</p>
          <p v-if="goods_code<100&&goods_code>9">00{{goods_code}}</p>
          <p v-if="goods_code<1000&&goods_code>99">0{{goods_code}}</p>
          <p v-if="goods_code<10000&&goods_code>999">{{goods_code}}</p>
                <div id="qrcode" ref="qrcode"></div>
            </div>
            <img style="  margin: 10% 40% 10% 40%;" src="../../public/image/cancel.png" alt="" @click="toback">
        </div> 
    </div>
</template>
<script>
import QRCode from 'qrcodejs2'
export default {
    data(){
        return{
            goods_code:"",
        }
    },
    created(){
        this.goods_code = this.$route.query.goods_code;
    },
    methods:{
       onClickLeft() {
        this.$router.go(-1)
        },
        onClickRight() {
        
        },
        toback(){
           this.$router.go(-1)
        },
        qrcode() {
        let qrcode = new QRCode('qrcode', {
            width: 180,
            height: 180, // 高度
            text: this.goods_code, // 二维码内容
            colorDark : '#000',      //前景色
            colorLight : '#fff',      //背景色
            correctLevel : QRCode.CorrectLevel.L     //容错等级 
        })
        }
    },
    mounted(){
        this.qrcode();
    }
}
</script>
<style scoped>
.c-body{
    background-color: #f3f3f3;
    padding: 30% 12% 22.5% 12%;
}
.c-center{
    display: flex;
    flex-direction: column;
    text-align: center;
    width: 100%;
    height: 60%;
    background-color: #fff;
    border-radius: 10px;
}
.c-center h2{
    color: #e50055;
    font-size: 24px;
    margin: 20px  12% 0 12%;
    padding-bottom: 20px;
    border-bottom: 2px dashed #e50055;
}
.c-center p{
    color: #e50055;
    font-size: 35px;
    font-weight: 600;
    margin: 15px 12% 30px 12%;
}
#qrcode{
    margin: 0 19% 30px 19%;
}
</style>