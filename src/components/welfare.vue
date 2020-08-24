<template>
    <div>
         <div>
         <van-nav-bar
            title="福利社"
            left-arrow
            @click-left="onClickLeft"
            @click-right="onClickRight"
            fixed/>
        </div>
        <div class="wel-img">
            <img src="../../public/image/welfare.png" alt="">
        </div>
        <div class="wel-footer">
            <van-tabbar fixed>
                <p>订阅 "优惠券领取" 提醒，有新券可领取时通知</p>
                <button>我要订阅</button>
            </van-tabbar>
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
.wel-img{
    padding: 30% 10% 10% 10%;
}
.van-tarbar{
       height: 55px;
}
.wel-footer{
    align-items: center;
}
.wel-footer .van-tabbar p{
    font-size: 13px;
    color: #4f4f4f;
    display: block;
    margin: 13px 10px;
}
.wel-footer .van-tabbar button{
    height: 25px;
    width: 60;
    padding: 0 10px;
    background-color: #04c160;
    border: 0;
    border-radius: 5px;
    color: #fff;
    font-size: 14px;
    margin-left: 5px;
    margin-top: 10px;
}
</style>
