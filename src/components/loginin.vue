<template>
    <div>
        <div>
            <van-nav-bar
                :title="title"
                left-arrow
                @click-left="onClickLeft"
                @click-right="onClickRight"
                />
        </div>
        <div>
            <van-form @submit="onSubmit">
                <van-field
                    v-model="username"
                    name="uname"
                    label="用户名"
                    placeholder="用户名"
                    :rules="[{ required: true, message: '请填写用户名' }]"
                />
                <van-field
                    v-model="password"
                    type="password"
                    name="upwd"
                    label="密码"
                    placeholder="密码"
                    :rules="[{ required: true, message: '请填写密码' }]"
                />
                <div style="margin: 16px;">
                    <van-button round block color="#e50055" native-type="submit">
                    提交
                    </van-button>
                </div>
            </van-form>
        </div>
        <div class="loginin_reg">
            <van-checkbox v-model="checked" shape="square" checked-color="#231815">记住密码</van-checkbox>
            <router-link to="/register">点击注册</router-link>
        </div>
    </div>
</template>
<script>
import { Toast } from 'vant';
export default {
    data() {
        return {
            title:'登录',
            username: '',
            password: '',
            checked: false,
        };
    },
    methods: {
        onSubmit(values) {
            //console.log('submit', values);
            this.axios.post('/login',values).then((res)=>{
                //console.log(res.data);
                if(this.checked){
                    localStorage.setItem('token',res.data.token);
                    localStorage.setItem('user',JSON.stringify(res.data.resilt));
                }else{
                    sessionStorage.setItem('token',res.data.token);
                    sessionStorage.setItem('user',JSON.stringify(res.data.resilt));
                }
                if(res.data.code==1){
                    Toast.success('登录成功');
                    setTimeout(()=>{
                        if(this.$route.query.redirect){
                        //     let redirect = decodeURIComponent(this.$route.query.redirect);
                            let redirect = this.$route.query.redirect;
                            this.$router.push(redirect);
                        }else{
                            this.$router.push('/');
                        }
                    },1000);
                }else{
                    Toast.fail("登录失败");
                }
            }).catch((error) => {
                console.log(error);
            })
        },
        onClickLeft() {
            this.$router.push('/mine')
        },
        onClickRight() {
        
        }
    },
}
</script>
<style scoped>
.loginin_reg{
    display: flex;
    justify-content: space-between;
    padding: 0 20px;
    font-size: 14px;
}
</style>