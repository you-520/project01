<template>
  <div style="height:667px"> 
  <!-- 统一父元素开始 -->
    <div class="container">
       <!-- 侧边导航开始 -->
      <div class="van-sidebar">
        <van-sidebar v-model="active" @change="onChange(active)" >
          <van-sidebar-item v-for="(item,index) in items" :key="index" :title="item.text" />
        </van-sidebar>
      </div>
      <!-- 侧边导航结束 -->
      <!-- 右侧区域开始 -->
     <div class="rightContainer">
        <!-- 搜索框开始 -->
        <van-search
          v-model="kw"
          show-action
          placeholder="请输入搜索关键词"
          @search="onSearch"
          clearable>
          <template #action>
            <div @click="onSearch">搜索</div>
          </template>
        </van-search>
        <!-- 搜索框结束 -->
        <p class="my-title">{{items[active].text}}</p>  <!--显示当前选项卡-->
        <!--遍历商品开始 -->
        <div v-for="(shop,index) of shops" :key="index">
          <!-- 楼梯开始 -->
          <div class="flex" v-if="active==shop.lid">
            <!-- 商品介绍开始 -->
            <img class="my-img" :src="shop.pic">  <!--图片-->
            <!-- 商品详情中间列开始 -->
            <div style="margin-left:10px">
              <p class="my-shop">{{shop.title}}</p>
              <p class="my-price">¥{{shop.price.toFixed(2)}}</p>
            </div>
            <!-- 商品详情中间列结束 -->
            <!-- 右边按钮开始 -->
            <div class="btn">
              <van-button v-if="shop.did==2" class="my-btn" @click="choseDetail(shop.sid)">选规格</van-button>
              <van-button v-if="shop.did==1" class="my-btn" @click="choseDetail(shop.sid)">选口味</van-button>
              <van-button v-if="shop.did==0" class="my-add" @click="add(shop.title,shop.price,1)">+</van-button>
            </div>
            <!-- 右边按钮结束 -->
            <!-- 选口味弹窗开始 -->
            <div>
              <van-popup v-model="show"  closeable close-icon-position="top-right" position="bottom"   :style="{ height: '80%',width:'92%',borderRadius: '10px',margin:'50px 15px'} ">
                <div  @click.stop>
                  <div class="flex-center">
                    <van-image class="show-img"  :src="shops[did].pic" />
                  </div>
                  <p class="title">{{shops[did].title}}</p>
                  <!-- 温度和糖度 -->
                  <div>
                    <p class="sub-title" v-if="choseTem.length!=0">温度</p>
                    <div class="btn-group">
                      <div v-for="(tem,index) in choseTem" :key="index">
                        <button @click="choseTemToast(tem,index)" class="choseBtn" :class="{chosenBtn:checkedTem==index}">{{tem}}</button>
                      </div>
                    </div>
                    <p class="sub-title" v-if="choseSugar.length!=0">糖度</p>
                    <div class="btn-group">
                      <div v-for="(sugar,i) in choseSugar" :key="i">
                        <button v-if="sugar.sugar!=''" @click="chosecheckedSugar(sugar,i)" class="choseBtn" :class="{chosenBtn:checkedSugar==i}" >{{sugar}}</button>
                      </div>
                    </div>
                    <!-- 最后的下划线 -->
                    <van-divider />
                    <!-- 价格 -->
                    <div class="show-detail">
                      <div>
                        <p class="show-price">¥{{shops[did].price.toFixed(2)}}</p>
                        <p v-if="choseSugar.length!=0 || choseTem.length!=0" class="show-chosen">已选:{{tem}}<span v-if="tem!==undefined && sugar!==undefined">/</span>{{sugar}}</p>
                      </div>
                      <!-- 购物器的步进器 -->
                      <van-stepper v-model="count" theme="round" button-size="22" disable-input />
                    </div>
                  </div>
                  </div>
                  <!-- 选好了 -->
                  <div class="flex-center">
                    <button class="show-large-btn" type="primary" @click="choseok(shops[did].title,count,shops[did].price,tem,sugar,shops[did].pic)">选好了</button>
                  </div>
                </van-popup>
            </div>
            <!-- 选口味弹窗结尾 -->
            <!-- 商品介绍结束 -->
          </div>
          <!-- 楼梯结束 -->
        </div>
        <!--遍历商品结束 -->
     <!-- 右侧区域结束 -->
     </div>  
    </div>
    <!-- 显示购物车 -->
     <van-popup v-model="showDetail" position="bottom" :style="{marginBottom:'105px',height:'10%'}" />
    <div v-if="total!=0"  class="choseok">
       <div class="icon-info">
         <img style="width:40px" src="../../public/image/shopcart.jpg" alt=""  @click="CartDetail()">
          <span class="total">¥{{this.total.toFixed(2)}}</span>
        </div>
        <button @click="goShopping()" class="goShopping">去结算</button>
    </div>  
    <!-- 购物车详情弹窗开始 -->
    <div v-if="this.ok==1 & this.total!=0" class="cartDetail" :style="this.height">
      <div>
        <van-swipe-cell> <!--购物车详情头-->
          <van-cell :border="false" class="showCartDetail"  title="已选中的商品" value="清空购物车" @click="clear()"/>
        </van-swipe-cell>
      </div>
      <div v-for="(cart,index) in shopList" :key="index"> <!--购物车详情-->
        <van-grid direction="horizontal" :border="false" :column-num="4" v-if="1==1">
          <van-grid-item>
          {{cart.title}}
          </van-grid-item>
          <van-grid-item class="cartTotal">
            ¥{{cart.price}}
          </van-grid-item>
          <van-grid-item class="cartDetail-center">
            {{cart.tem}}<span v-if="cart.tem!==undefined && cart.sugar!==undefined">/</span>{{cart.sugar}}
          </van-grid-item>
          <van-grid-item>
            <van-button class="cart-btn" @click="minus(index,cart.title,cart.count,cart.price,cart.tem,cart.sugar,cart.pic)">-</van-button>
            {{cart.count}}
            <van-button class="cart-btn" @click="plus(index,cart.title,cart.count,cart.price,cart.tem,cart.sugar,cart.pic)">+</van-button>
          </van-grid-item>
        </van-grid>
      </div>
    <!-- </van-popup>   -->
    </div>
    <!-- 购物车详情弹窗结束 -->
  <!-- 统一父元素结束 -->
  </div>
</template>
<script>
import { Toast } from 'vant';
export default {
  data(){
    return{
      active: 0,//当前所在楼层
      items: [ { text: '热销' }, { text: '新品推荐' }, { text: '冰淇淋与茶' }, { text: '真果茶' }, { text:'奶盖茶&原叶茶' }, { text: '奶茶&特饮' }, { text: '雪王提醒' }], //侧标导航的内容
      value:'',//默认搜索框内容
      shops:[],//保存遍历所有数据
      show:false,//是否显示遮罩层
      showDetail:false,//是否显示购物车
      showCart:false,//是否显示购物车详情
      sid:0,//商品的id
      did:0,//用于商品分类的id
      choseTem:[],//所遍历到一个商品的温度
      choseSugar:[],//所遍历到一个商品的糖度
      checkedTem:0, //所选温度按钮的下标
      checkedSugar:0, //所选糖度按钮的下标
      ok:0,//标识是否显示购物车详情
      cid:0,//购物车商品的id
      count:0,//所选商品的数量
      total:0, //商品总价
      height:0,
      shopList:[],
      kw:'' //搜索的关键词
    }
  },
  //  
  methods:{
    onChange(active){ //修改当前所在楼层的active
      this.active=active;
    },
    onSearch(){ //查询功能
     console.log(`查询${this.kw}相关的内容`)
    },
    
    // 订单页选口味
    choseDetail(sid) {//  显示遮罩层
      this.show = true;
      this.checkedTem=0  //将默认的温度下标改为0
      this.checkedSugar=0 //将默认的糖度下标改为0
      this.choseTem=[];//选口味之前把前面的口味清空，再追加
      this.choseSugar=[];
      this.sid=sid;
      this.did=sid-1;
      this.axios.get('/shopdetail',{
        params: {
          sid: sid
        }
      }).then((res)=>{
        this.chose=res.data.result;
        this.chose.map((item)=>{
          if(item.temp!=='')this.choseTem.push(item.temp)
          if(item.sugar!=='')this.choseSugar.push(item.sugar)
        })
        // 设置默认糖度和温度
        this.tem=this.choseTem[0];
        this.sugar=this.choseSugar[0];
      }).catch((error) => {
          console.log(error);
      })
    },
     // 详情页具体选口味
    // 选温度
    choseTemToast(temp,index){
      this.tem=temp;
      this.checkedTem=index;
    },
    // 选糖度
     chosecheckedSugar(sugar,i){
       this.sugar=sugar;
       this.checkedSugar=i;
    },
    CartDetail(){
      this.showCart=true
      if(this.ok==0){//显示购物车详情
        this.ok=1
      }else{
        this.ok=0
      }
    },
    add(title,price,count){
      let shopdetail={}
      shopdetail.uid=this.uid,
      shopdetail.title=title,
      shopdetail.price=price,
      shopdetail.count=count,
      this.total+=price*count;
      this.shopList=eval('(' + window.localStorage.getItem('shopCart') + ')');
      this.shopList.push(shopdetail);
      window.localStorage.setItem('shopCart',JSON.stringify(this.shopList));
    },
     // 选好了
    choseok(title,count,price,tem,sugar,pic){
      this.show=false //按钮选好了也要关闭弹窗
      // 判断用户是否已经登录
      if(window.sessionStorage.getItem('user')==null&&window.localStorage.getItem('user')==null){
       Toast.fail('请先登录');
       setTimeout(()=>{
          this.$router.push('/loginin')
       },1000)
     }else{
       this.uid=JSON.parse(window.sessionStorage.getItem('user')).uid||JSON.parse(window.localStorage.getItem('user')).uid
      let shopdetail={}
      shopdetail.uid=this.uid,
      shopdetail.title=title,
      shopdetail.price=price,
      shopdetail.count=count,
      shopdetail.tem=tem,
      shopdetail.sugar=sugar;
      shopdetail.pic=pic;
      this.total+=count*price;
      if(window.localStorage.getItem('shopCart')==null){
        window.localStorage.setItem('shopCart',JSON.parse(JSON.stringify('[]')));
        this.shopList=eval('(' + window.localStorage.getItem('shopCart') + ')');
        this.shopList.push(shopdetail);
        window.localStorage.setItem('shopCart',JSON.stringify(this.shopList));
      }else{
        this.shopList=eval('(' + window.localStorage.getItem('shopCart') + ')');
        this.shopList.push(shopdetail);
        window.localStorage.setItem('shopCart',JSON.stringify(this.shopList));
      }//默认count
      // 购物车高度
      this.height=90*this.shopList.length;
      setTimeout(() => {
        this.count=1
      }, 1000);
    }
    },
    plus(index,title,count,price,tem,sugar,pic){ //购物车的+
    count+=1;
    let shopdetail={}
    shopdetail.uid=this.uid,
    shopdetail.title=title,
    shopdetail.price=price,
    shopdetail.count=count,
    shopdetail.tem=tem,
    shopdetail.sugar=sugar;
    shopdetail.pic=pic;
    this.shopList.splice(index,1,shopdetail)
    this.total+=price;  
    window.localStorage.setItem('shopCart',JSON.stringify(this.shopList));
    },
    minus(index,title,count,price,tem,sugar,pic){ //购物车的-
    if(count==1){
      this.shopList.splice(index,1);
      window.localStorage.setItem('shopCart',JSON.stringify(this.shopList))
      }else if(count>1){
        count--
        let shopdetail={}
        shopdetail.uid=this.uid,
        shopdetail.title=title,
        shopdetail.price=price,
        shopdetail.count=count,
        shopdetail.tem=tem,
        shopdetail.sugar=sugar;
        shopdetail.pic=pic;
        this.shopList.splice(index,1,shopdetail)
        window.localStorage.setItem('shopCart',JSON.stringify(this.shopList))
      }
        this.total-=price;
    },
    clear(){ //清空购物车
      this.shopList=window.localStorage.setItem('shopCart',JSON.parse(JSON.stringify('[]')))
      this.total=0
      this.ok=0;
    },
    // 去结算
   goShopping(){
     //  点击选好了,将选中的当前商品详情加入shopList
    //  console.log(this.shopList)
      this.axios.post('/addShopCart',this.shopList).then(res => {
        console.log(res.data)
      }).catch((error) => {
      console.log(error);
    });
    this.$router.push({path:"/payment",query:{
      total:this.total,
      shopList:this.shopList
    }});
    window.localStorage.setItem("total",this.total)
    // setTimeout(() => {//去结算后删除该用户购物车信息
    //   window.localStorage.removeItem('shopCart')
    // }, 1000);
   },
  },
  mounted() {
    this.shopList=eval('(' + window.localStorage.getItem('shopCart') + ')');
    // 请求所有商品
    this.axios.get('/shop').then(res=>{
      let data=res.data=res.data.result;
      data.forEach(item => {
        this.shops.push(item)
      });
    });
   },
  created(){
    if(window.localStorage.getItem('shopCart')==null){
        window.localStorage.setItem('shopCart',JSON.parse(JSON.stringify('[]')))
     }
    this.shopList=eval('(' + window.localStorage.getItem('shopCart') + ')');
    this.shopList.forEach(item=>{
    this.total+=item.price*item.count
    })
  },
}
</script>
<style>
  .van-field__control{ /*搜索框样式*/
    font-size: 16px !important;
  }
  .van-stepper--round .van-stepper__minus{
    border:1px solid #7e7e7e !important;
    color:#7e7e7e !important
  }
  .van-grid-item__content{
    text-align: center;
    padding: 8px 0px !important;
  }
  .van-overlay{
    background-color: rgba(128,128,128,.7) !important;
  }
</style>
<style scoped>
  .container{
    margin-top: 35px;
    display: flex;
    justify-content: space-between;
  }
  .rightContainer{
    position:absolute;
    left:92px
  }
  .van-sidebar{ /*侧边栏*/
    max-width: 85px;
    text-align: center;
    padding: 10px 0 105px 0;
    background-color: #F0F0F0;
    position:fixed
  }
  .van-sidebar-item{ /*侧边栏选项卡*/
    background-color: #F0F0F0;
    padding: 20px 9px;
  }
  .my-title{
    font-size:14px;
    color: #8F8F8F;
  }
  .my-img{
    width: 100px;
    height: 90px;
  }
  .flex{
    display:flex;
    justify-content: space-between;
  }
  .my-shop{
    width: 85px;
    font-size:16px;
    color:#4B4B4B;
    font-weight:bold
  }
  .my-price{
    margin-top:55px;
    color:#FFA511;
    font-size:18px;
  }
  .btn{
    display: flex;
    justify-content:flex-end;
    align-items:flex-end;
  }
  .my-btn{ /*选口味按钮*/
    font-size: 12px;
    color: #fff;
    height: 25px;
    background: #E50055;
    border-radius: 15px
  }
  .my-add{ /*添加按钮*/
    margin-left:45px;
    width: 20px;
    height: 20px;
    border-radius: 50%;
    color: #fff;
    padding:0;
    background-color: #E50055;
  }
  .cart-btn{
    width: 20px;
    height: 20px;
    border-radius: 50%;
    color: #fff;
    padding:0;
    background-color: #E50055;
    margin: 0 10px;
  }
  .flex-center{ /*遮罩层图片*/
    display: flex;
    justify-content:center;
  }
  .show-img{
    width:200px;
    height:180px;
  }
  .title{ /*遮罩层商品标题*/
    font-size:18px;
    font-weight:400;
    margin:10px 0px 5px 10px 
  }
  .sub-title{ /*温度和糖度的字体*/
    font-size:16px;
    margin:5px 10px;
  }
  .btn-group{ /*按钮组*/
    display: flex;
    flex-wrap:wrap;
  }
  .choseBtn{ /*遮罩层口味按钮*/
    font-size: 16px;
    color: #707070;
    width: 100px;
    background-color:#F8F8F8;
    padding:8px 8px;
    border:1px solid #D0D0D0;
    border-radius: 5px;
    margin:3px 5px 
  }
  .chosenBtn{ /*遮罩层被选按钮*/
    color: #fff;
    background-color:#E50055 ;
  } 
  .show-detail{ /*遮罩层的商品已选项和+-*/
    display: flex;
    justify-content:space-between;
  }
  .show-price{ /*遮罩层价格*/
    font-size:18px;
    padding-left:5px
  }
  .show-chosen{/*遮罩层已选项字体*/
    font-size:14px;
    color:#B0B0B0;
    padding: 5px;
  }
  .show-large-btn{
    padding:10px 8px;
    color:#fff;
    width:90%;
    border-radius:25px;
    background-color:#E50055;
    border:0;
    margin:5px 0px;
  }
  .choseok{
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #F0F0F0;
    width:375px;
    z-index: 1000;
    position: fixed;
    bottom: 50px;
  }
  .total{
    font-size:26px;
    margin-left: 10px;
    color:#2D2D2D;
    line-height: 50px;
  }
  .goShopping{
    z-index: 1000;
    color: #fff;
    background: #E50055;
    width: 100px;
    height: 57px;
    border: 0;
  }
  .showCartDetail{
    background-color: #EDEDED;
    color:#000000 ;
    padding: 8px;
  }
  .cartTotal{
    color:#FFA511;
    font-size:18px;
    flex-basis: 18% !important
  }
  .cartDetail{
    width: 100%;
    /* height: 100%; */
    /* background-color: rgba(128,128,128,.7) !important; */
    bottom: 100px;
    /* z-index: 9999; */
    position: fixed;
  }
  .cartDetail-center{
    flex-basis: 30% !important;
  }
  
</style>