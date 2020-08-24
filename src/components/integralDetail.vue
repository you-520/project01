<template>
    <div>
        <div>
            <van-nav-bar
            :title="headTitle"
            left-arrow
            @click-left="onClickLeft"
            @click-right="onClickRight"/>
        </div>
        <div>
            <van-cell-group>
                <van-cell title="优惠说明" :value="value" />
                <van-cell title="有效日期" value="领取后当天有效，有效期15天" />
                <van-cell title="适用门店" value="适用该商户下所有门店" />
                <van-cell title="适用商品" value="全商品通用" />
                <van-cell title="使用须知" label="1.该优惠券仅限蜜雪冰城手机点餐使用
                2.该优惠券不找零，不兑现，取消订单后不再返还
                3.该优惠券领取后有效期15天，优惠券过期后不可再用" />
            </van-cell-group>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            headTitle:"优惠券详情",
            value:this.$route.query.msg
        }
    },
    mounted(){
        console.log(this.$route.query.msg)
    },
    methods: {
        onClickLeft() {
        this.$router.go(-1)
        },
        onClickRight() {
        Toast('按钮');
        },
    }
}
</script>
