<template>
    <div>
        <div>
         <van-nav-bar
            title="填写备注"
            left-arrow
            @click-left="onClickLeft"
            @click-right="onClickRight"
            fixed/>
        </div>
        <div class="inputmsg">
           <van-field
            v-model="message"
            rows="2"
            autosize
            type="textarea"
            placeholder="请填写备注信息(最多50个字)"
            show-word-limit
            />
        </div>
        <button @click="mark">完成</button>
    </div>
</template>
<script>
export default {
    data(){
        return{
          message:''
        }
    },
    methods:{
        onClickLeft() {
            this.$router.go(-1)
        },
        onClickRight() {
        
        },
        mark(){
            this.$router.push({
                name: '订单结算',
                params: {
                    mark: this.message
                }
            });
        }
    }
}
</script>
<style scoped>
    .inputmsg{
        margin: 70px 15px 50px  15px ;
        border: 1px solid grey;
        height: 150px;
    }
    button{
        width: 92%;
        margin: 20px 15px ;
        height: 50px;
        background-color: #e50055;
        border: 0;
        border-radius: 5px;
        color: #fff !important;
        font-size: 18px !important;
    }
</style>