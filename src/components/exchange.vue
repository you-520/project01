<template>
    <div id="container">
        <div>
            <van-nav-bar
            title="兑换码"
            left-arrow
            @click-left="onClickLeft"
            @click-right="onClickRight"/>
        </div>
       <div class="exchange">
           <div class="e-header">
              <p>请输入兑换码</p>
              <img src="../../public/image/saoma.png" alt="">
           </div>
           <div>
              <van-field v-model="digit" type="digit" maxlength=10 size="large" autofocus="true" id="exid"  input-align="center"/>
           </div> 
       </div>
        <div class="btn" >
             <button class="active" @click="hint()" :class="{actived:this.digit.length>=6}">兑换</button>
        </div>
        <div class="text">
            <h4>兑换码使用规则</h4>
            <p>·请使用扫码按钮，扫描二维码进项兑换</p>
        </div>
    </div>
</template>
<script>
import { Dialog } from 'vant';
 export default {
     data() {
    return {
        digit: '',
      };
    },
    methods: {
    onClickLeft() {
     this.$router.go(-1)
      },
    onClickRight() {
     
      },
    hint(){
           Dialog.confirm({
           title: '提示',
           message: '是否使用此兑换码进行兑换',
          })
         .then(() => {
           Dialog.alert({
           title: '提示',
           message: '此兑换码无效，无法使用',
         })
         })
         .catch(() => {
         // on cancel
         });
    },
    mounted() {
        document.getElementById("exid").focus();
    }
  }
 }
</script>
<style scoped>

#container{
    background-color: #fff;
    height: 667px;
    margin-top:10px;
}
.exchange{
    border: 1px solid #f5f5f5;
    border-radius: 10px;
    margin: 10px;
}
.e-header{
    display: flex;
    justify-content: space-between;
}
.e-header p{
    margin: 30px 20px;
    color: #999;
}
.e-header img{
    margin: 30px 20px;
}
 .van-cell{
     line-height: 100px;
     font-size: 50px;
 }
 .active{
    width: 94%;
    height: 55px;
    margin: 20px 10px;
    background-color: #ccc;
    border: 0;
    border-radius: 10px;
    color: #f0f0f0;
    font-size: 20px
 }
 .actived{
    color: #fff;
    background-color: #E50055 ;
}
 .van-field__control{
    border-bottom: 1px solid #f5f5f5;
    border-radius: 0;
    font-size: 35px
 }
 .text h4{
   font-size: 14px;
 }
</style>
