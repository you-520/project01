<template>
    <div class="creatadd">
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
                    v-model="linkman"
                    name="linkman"
                    label="联系人"
                    placeholder="请填写收货人的姓名"
                    :rules="[{ required: true,}]"
                />
                <van-field name="gender" label="性别">
                    <template #input>
                        <van-radio-group v-model="gender" direction="horizontal">
                        <van-radio checked-color="#231815" name="1">男</van-radio>
                        <van-radio checked-color="#231815" name="0">女</van-radio>
                        </van-radio-group>
                    </template>
                </van-field>
                <van-field
                    v-model="phone"
                    name="phone"
                    label="手机号"
                    placeholder="请填写收货手机号"
                    :rules="[{ required: true,}]"
                />
                <van-field
                readonly
                clickable
                name="province"
                :value="value"
                label="地址"
                placeholder="点击选择城市"
                @click="showPicker = true"
                />
                <van-popup v-model="showPicker" position="bottom">
                    <van-picker
                        show-toolbar
                        :columns="columns"
                        @confirm="onConfirm"
                        @cancel="showPicker = false"
                    />
                </van-popup>
                <van-field
                    v-model="house_number"
                    name="house_number"
                    label="门牌号"
                    placeholder="例如：B座15楼1503室"
                    :rules="[{ required: true,}]"
                />
                <div style="margin: 16px;">
                    <van-button block size="large"  color="#e50055" native-type="submit">
                    {{btnText}}
                    </van-button>
                </div>
                </van-form>
            
            
        </div>
    </div>
</template>
<script>
import Vue from 'vue';
import { Form } from 'vant';
import { Dialog } from 'vant';
import { Toast } from 'vant';

Vue.use(Toast);
Vue.use(Form);
export default {
    data(){
        return{
            isEdit:this.$route.query.isEdit,
            title:this.$route.query.isEdit === 1 ? '编辑地址':'创建地址',
            btnText:this.$route.query.isEdit === 1 ? '保存':'提交',
            gender: '1',
            linkman: '',
            phone: '',
            value: '',
            columns: ['西安', '汉中', '咸阳', '渭南', '华阴'],
            showPicker: false,
            house_number:'',
            aid:''
        }
    },
    mounted(){
        // console.log(this.$route.query.isEdit)
        if(this.isEdit === 1){
            this.axios.post('/getItemAdd', {id:this.$route.query.data.id}).then((res) => {
                let result=res.data.result[0];
                //console.log(result);
                this.aid=result.aid;
                this.linkman=result.linkman;
                this.phone=result.phone;
                this.house_number=result.house_number;
                this.value = result.province
                this.gender = result.gender.toString()
            }).catch((error) => {
                console.log(error);
            });
        }

    },
    methods: {
        onClickLeft() {
            this.$router.go(-1)
        },
        onClickRight() {
        
        },
        onSubmit(values) {
            if(this.isEdit === 0){
                let {uid}=JSON.parse(localStorage.getItem('user')?localStorage.getItem('user'):sessionStorage.getItem('user'));
                values.user_id=uid;
                // console.log('submit', values);
                this.axios.post('/addadress', values).then((response) => {
                    // console.log(response.data);
                    if(response.data===1){
                        Toast.success('创建成功');
                        setTimeout(()=>{
                            this.$router.push('/address');
                        },1000);
                        
                    }else{
                        Toast.fail("创建失败");
                    }
                }).catch((error) => {
                    console.log(error);
                });
            }else {
                console.log(values)
                values.aid=this.aid;
                this.axios.post('/updateAddress', values).then((response) => {
                    if(response.data===1){
                        Toast.success('修改成功');
                        setTimeout(()=>{
                            this.$router.push('/address');
                        },1000);
                        
                    }else{
                        Toast.fail("修改失败");
                    }
                }).catch((error) => {
                    console.log(error);
                });
            }
        },
        onConfirm(value) {
            this.value = value;
            this.showPicker = false;
        },
    },
}
</script>