<template>
    <div class="address">
        <div>
         <van-nav-bar
            title="我的收货地址"
            left-arrow
            @click-left="onClickLeft"
            @click-right="onClickRight"
            fixed/>
        </div>
        <div v-if="list.length==0">
            <div class="address_content">
                <img src="../assets/mine/address.png" alt="">
                <p>您还没有收货地址，快去添加一个吧~</p>
            </div>
            <div class="address_button" fixed>
                <van-button :to="{path:'/creatadd',query:{isEdit:0}}" color="#e50055" size="large">添加地址</van-button>
            </div>
        </div>
        <div v-else>
            <van-address-list
            v-model="chosenAddressId"
            :list="list"
            default-tag-text="默认"
            @add="onAdd"
            @edit="onEdit"
            />
        </div>
        
    </div>
</template>
<script>
import { Toast } from 'vant';
export default {
    data(){
        return{
            chosenAddressId: '1',
            list:[]
        }
    },
    methods: {
        onClickLeft() {
            this.$router.push('/mine')
        },
        onClickRight() {
        
        },
        onAdd() {
            this.$router.push({path:'/creatadd',query:{isEdit:0}});
        },
        onEdit(item) {
            this.$router.push({path:'/creatadd',query:{data:item,isEdit:1}});
        },
    },
    mounted(){
        let {uid}=JSON.parse(localStorage.getItem('user')?localStorage.getItem('user'):sessionStorage.getItem('user'));
        this.axios.get('/getaddress',{
            params: {
                user_id: uid
            }
        }).then((res)=>{
            if(res){
                const dataList = []
                res.data.result.map((item) => {
                    let obj ={}
                    obj.id = item.aid
                    obj.name = item.linkman
                    obj.tel = item.phone
                    obj.address = item.province +',' + item.house_number
                    dataList.push(obj)
                })
                this.list=dataList;
            }
        });
    }
}
</script>
<style scoped>
.address_content{
    text-align: center;
    color: #333;
    margin: 186px 0;
}
.address_content>img{
    margin-bottom: 60px;
}
.van-button--danger{
    background-color: #e50055 !important;
}
.van-button--round {
    border-radius: 0 !important;
}
.van-address-list__add{
    margin: 0 !important;
    height: 50px !important;
}
.van-address-list__bottom{
    padding: 0 !important;
}
.van-address-list{
    padding: 46px 0px !important;
}
.address .van-radio__icon{
    display: none !important;
}
</style>
