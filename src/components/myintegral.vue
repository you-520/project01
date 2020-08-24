<template>
    <div>
        <div>
           <van-nav-bar
              title="我的积分"
              left-arrow
              @click-left="onClickLeft"
              @click-right="onClickRight"
              fixed/>
        </div>
        <div class="integral-card">
            <h4>0</h4>
            <p>获得积分后，积分有效期至2021年12月31日</p>
            <button @click="tointegral">积分商城</button>
        </div>
        <div class="integral-title">
            <p>积分记录</p>
        </div>
        <div class="integral-list">
            <p>暂无积分记录~</p>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            
        }
    },
     methods: {
        onClickLeft() {
        this.$router.go(-1)
        },
        onClickRight() {
        },
        tointegral:function(){
            this.$router.push('/integral')
        }

    },
}
</script>
<style>
  .integral-card{
      margin: 55px 10px 30px 10px;
      border: 1px solid #f5f5f5;
      border-radius: 10px;
  }
   .integral-card h4{
       margin-top: 20px;
       margin-bottom: 10px;
       text-align: center;
       font-size: 60px;
       font-weight: 500;
   }
   .integral-card p{
       text-align: center;
       margin-bottom: 10px;
       color: #999;
       font-size: 14px;
   }
   .integral-card button{
       width: 90% !important;
       height: 40px;
       margin-left: 5%;
       margin-bottom: 15px;
       border-radius: 20px;
       border: 0;
       background-color: #f6c68a;
       color: #fff;
   }
   .integral-title p{
      margin-left: 20px; 
      margin-bottom: 20px;
   }
   .integral-list{
       text-align: center;
       border: 1px solid #f5f5f5;
       margin: 0 10px;
       border-radius: 10px;
   }
   .integral-list p{
       margin: 12px;
       color: #333;
   }
</style>
