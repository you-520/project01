<template>
    <div>
        <div>
           <van-nav-bar
              title="储值卡"
              left-arrow
              @click-left="onClickLeft"
              @click-right="onClickRight"
              fixed/>
        </div>
        <div class="value-img">
             <img src="../../public/image/valuecard.png" alt="">
        </div>
        <div class="value-text">
              <p>暂无储值卡</p>
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
        }
    },
}
</script>
<style>
  .value-img{
      margin-top: 30%;
  }
  .value-text p{
    margin-top: 5%;
    text-align: center;
    font-size: 17px;
    color: #333;
  }
</style>
