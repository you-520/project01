<template>
    <div>
         <div>
         <van-nav-bar
            title="我的优惠券"
            left-arrow
            @click-left="onClickLeft"
            @click-right="onClickRight"
            fixed/>
        </div>
        <div class="dis-img">
            <img src="../../public/image/discountcoupon.png" alt="">
        </div>
        <div class="dis-text">
              <p>暂无可用的优惠券</p>
        </div>
        <div class="dis-btn">
            <router-link to="/loseefficacy" ><button>查看失效的优惠券></button></router-link>
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
    },
}
</script>
<style>
  .dis-img{
     padding: 34% 10% 10% 5%;
  }
  .dis-text p{
      font-size: 17px;
      text-align: center;
      color: #333;
  }
  .dis-btn button{
      color: #333 !important;
      background-color: #f6f7f9;
      margin-top: 211px;
      width: 100% !important;
      height: 55px;
      border: 0;
      font-size: 15px;
  }
</style>
