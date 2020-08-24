<template>
    <div>
         <div>
         <van-nav-bar
            title="失效优惠券"
            left-arrow
            @click-left="onClickLeft"
            @click-right="onClickRight"
            fixed/>
        </div>
        <div class="los-img">
            <img src="../../public/image/discountcoupon.png" alt="">
        </div>
        <div class="los-text">
              <p>暂无失效的优惠券</p>
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
  .los-img{
     padding: 34% 10% 10% 5%;
  }
  .los-text p{
      font-size: 17px;
      text-align: center;
      color: #333;
  }
</style>
