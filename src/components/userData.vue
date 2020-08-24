<template>
    <div class="userdata">
        <div>
            <van-nav-bar
            :title="title"
            left-arrow
            @click-left="onClickLeft"
            @click-right="onClickRight"
            />
        </div>
        <div class="userdata_head">
            <img :src="avatar" alt="">
        </div>
        <div>
            <van-cell-group>
                <van-field label="昵称" v-model="username" readonly /> 
                <van-field label="性别" v-model="gender" readonly />
                <van-field label="手机号" v-model="phone" readonly />
                <van-field label="生日" v-model="birthday" readonly />
            </van-cell-group>
        </div>
        <div  style="margin: 16px;">
            <van-button block size="large"  color="#e50055" @click="logout">
            注销
            </van-button>
        </div>
    </div>
</template>
<script>
import { Toast } from 'vant';
export default {
    data(){
        return{
            title:'个人资料',
            username:'',
            gender:'',
            phone:'',
            birthday:'',
            avatar:''
        }
    },
    methods:{
        onClickLeft() {
            this.$router.go(-1)
        },
        onClickRight() {
        
        },
        logout(){
            window.localStorage.clear();
            window.sessionStorage.clear();
            Toast.success('您已退出登录！');
            setTimeout(()=>{
                this.$router.push('/mine');
            },1000);
        }
    },
    mounted(){
        let {uname,gender,phone,birthday,avatar}=JSON.parse(localStorage.getItem('user')?localStorage.getItem('user'):sessionStorage.getItem('user'));
        //console.log(uname,gender,phone,birthday,avatar);
        this.username=uname;
        this.gender=gender==0?'女':'男';
        this.phone=phone;
        this.birthday=birthday;
        this.avatar=require('../assets/mine/'+avatar);
    }
}
</script>
<style scoped>
.userdata_head{
    text-align: center;
    margin: 30px 0;
}
.userdata_head img{
    width: 100px;
    height: 100px;
    border-radius: 50%;
}
</style>