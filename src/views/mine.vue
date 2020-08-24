<template>
    <div class="mine">
        <div class="mine_header">
            <router-link to="/userData" v-if="isLogin">
                <div class="mine_header_top">
                    <div>
                        <img :src="avatar" alt="">
                    </div>
                    <div>
                        <p>{{uname}}</p>
                        <p>{{phone}}</p>
                    </div>
                </div>
            </router-link>
            <router-link to="/loginin" v-else>
                <div class="mine_header_top">
                    <div>
                        <img src="../assets/mine/unload.png" alt="">
                    </div>
                    <div>
                        <p>请登录</p>
                    </div>
                </div>
            </router-link>
            <div class="mine_header_bottom">
                <router-link to="/myintegral" class="prim">
                    <p>积分</p>
                    <h1>0</h1>
                </router-link>
                <div class="info"></div>
                <router-link to="/valuecard" class="prim">
                    <p>储值卡</p>
                    <h1>0</h1>
                </router-link>
                <div class="info"></div>
                <router-link to="/discountcoupon" class="prim">
                    <p>优惠券</p>
                    <h1>0</h1>
                </router-link>
            </div>
        </div>
        <div class="content">
            <router-link to="/member">
                <div class="first list">
                    <div class="list_top">
                        <img src="../assets/mine/icon/huiyuan.png" alt="">
                    </div>
                    <div class="list_bottom">
                        <div>会员等级</div>
                        <div><img src="../assets/mine/icon/you.png" alt=""></div>
                    </div>
                </div>
                <div class="line"></div>
            </router-link>
            <router-link to="/welfare">
                <div class="list">
                    <div class="list_top">
                        <img src="../assets/mine/icon/hongbao.png" alt="">
                    </div>
                    <div class="list_bottom">
                        <div>福利社</div>
                        <div><img src="../assets/mine/icon/you.png" alt=""></div>
                    </div>
                </div>
                <div class="line"></div>
            </router-link>
            <router-link to="/qrcode">
                <div class="list">
                    <div class="list_top">
                        <img src="../assets/mine/icon/qrqcode.png" alt="">
                    </div>
                    <div class="list_bottom">
                        <div>会员码</div>
                        <div><img src="../assets/mine/icon/you.png" alt=""></div>
                    </div>
                </div>
                <div class="line"></div>
            </router-link>
            <router-link to="/integral">
                <div class="list">
                    <div class="list_top">
                        <img src="../assets/mine/icon/zhu.png" alt="">
                    </div>
                    <div class="list_bottom">
                        <div>积分商城</div>
                        <div><img src="../assets/mine/icon/you.png" alt=""></div>
                    </div>
                </div>
                <div class="line"></div>
            </router-link>
            <router-link to="/orderfrom">
                <div class="list">
                    <div class="list_top">
                        <img src="../assets/mine/icon/icon.png" alt="">
                    </div>
                    <div class="list_bottom">
                        <div>我的订单</div>
                        <div><img src="../assets/mine/icon/you.png" alt=""></div>
                    </div>
                </div>
                <div class="line"></div>
            </router-link>
            <router-link to="/address">
                <div class="list">
                    <div class="list_top">
                        <img src="../assets/mine/icon/hb-addrss.png" alt="">
                    </div>
                    <div class="list_bottom">
                        <div>收货地址</div>
                        <div><img src="../assets/mine/icon/you.png" alt=""></div>
                    </div>
                </div>
                <div class="line"></div>
            </router-link>
            <router-link to="/exchange">
                <div class="list">
                    <div class="list_top">
                        <img src="../assets/mine/icon/gift.png" alt="">
                    </div>
                    <div class="list_bottom">
                        <div>兑换码</div>
                        <div><img src="../assets/mine/icon/you.png" alt=""></div>
                    </div>
                </div>
                <div class="line"></div>
            </router-link>
            <div class="last list">
                <div class="list_top">
                    <img src="../assets/mine/icon/i.png" alt="">
                </div>
                <div class="list_bottom">
                    <span>版本号</span>
                    <span>开个店 1.9.30</span>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            show: false,
            uname:'',
            phone:'',
            avatar:'',
            isLogin:false
        }
    },
    mounted(){
        let token=localStorage.getItem('token')?localStorage.getItem('token'):sessionStorage.getItem('token');
        if(token){
            this.isLogin=true;
            let {uname,phone,avatar}=JSON.parse(localStorage.getItem('user')?localStorage.getItem('user'):sessionStorage.getItem('user'));
            this.uname=uname;
            this.phone=phone;
            this.avatar=require('../assets/mine/'+avatar);
        }else{
            this.isLogin=false;
        }
    }
}
</script>
<style scoped>
.mine{
    margin-top: 46px;
}
.mine_header{
    padding:10px 20px;
    box-sizing: border-box;
    color: rgb(34,34,34);
    font-size: 15px;
}
.mine_header_top{
    display: flex;
}
.mine_header_top p{
    margin: 5px 0;
}
.mine_header_top img{
    width: 50px;
    height: 50px;
    border-radius: 50%;
    margin-right: 10px;
}
.mine_header_bottom{
    display: flex;
}
.mine_header_bottom .prim{
    width: 33%;
    text-align: center;
}
.mine_header_bottom .info{
    width: 2px;
    height: 33px;
    background-color: rgb(237,237,237);
    margin-top: 13px;
}
.mine_header_bottom .prim p{
    color: rgb(180,180,180);
    margin: 5px 0 0 0;
}
.mine_header_bottom .prim h1{
    color: rgb(229,0,85);
    font-weight: normal;
    font-size: 26px;
    margin: 0;
}
.content{
    background-color: rgb(247, 247, 247);
    padding: 10px;
}
.first{
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
}
.last{
    border-bottom-left-radius: 5px;
    border-bottom-right-radius: 5px;
    
    
    display: flex;
    justify-content: space-between
}
.list_bottom>span:last-child{
    color: #b5b5b5;
}
.content .list{
    line-height: 33px;
    font-size: 15px;
    display: flex;
    align-items: center;
    padding: 10px 16px;
    background-color: #fff;
    /* border-bottom: 1px solid #bebebe; */
}
.list_bottom{
    display: flex;
    justify-content: space-between;
    width: 100%;
}
.list_top img{
    display: block;
    margin-right: 10px;
}
.line{
    margin: 0 10px;
    height: 1px;
    background-color:  #ededed;
}
.content a{
    color: #333;
}
</style>
