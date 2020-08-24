import Vue from 'vue'
import Router from 'vue-router'
import index from '../views/index.vue'
import main from '../views/main.vue'
import order from '../views/order.vue'
import take from '../views/take.vue'
import mine from '../views/mine.vue'
import integral from '../components/integral.vue'
import payment from '../components/payment.vue'
import integralDetail from '../components/integralDetail.vue'
import member from '../components/member.vue'
import exchange from '../components/exchange.vue'
import qrcode from '../components/qrcode.vue'
import address from '../components/address.vue'
import creatadd from '../components/creatadd.vue'
import discountcoupon from '../components/discountcoupon.vue'
import loseefficacy from '../components/loseefficacy.vue'
import welfare from '../components/welfare.vue'
import orderfrom from '../components/orderfrom.vue'
import remark from '../components/remark.vue'
import claim from '../components/claim.vue'
import loginin from '../components/loginin.vue'
import register from '../components/register.vue'
import myintegral from '../components/myintegral.vue'
import valuecard from '../components/valuecard.vue'
import userData from '../components/userData.vue'



import Vant from 'vant';
import 'vant/lib/index.css';

Vue.use(Vant);

Vue.use(Router)
const router = new Router({
    routes: [{
        path: '/',
        component: main,
        children: [{
            path: '/',
            name: '首页',
            component: index,
            meta:{
                needLogin:false
            }
        }, {
            path: '/order',
            name: '点餐',
            component: order,
            meta:{
                needLogin:false
            }
        }, {
            path: '/take',
            name: '取餐',
            component: take,
            meta:{
                needLogin:false
            }
        }, {
            path: '/mine',
            name: '我的',
            component: mine,
            meta:{
                needLogin:false
            }
        }, {
            path: '/integralDetail',
            name: '优惠券详情',
            component: integralDetail,
            meta:{
                needLogin:true
            }
        }, {
            path: '/member',
            name: '会员等级',
            component: member,
            meta:{
                needLogin:false
            }
        }]
    }, {
        path: '/qrcode',
        component: qrcode,
        meta:{
            needLogin:true
        }
    }, {
        path: '/integral',
        name: '积分商城',
        component: integral,
        meta:{
            needLogin:true
        }
    }, {
        path: '/exchange',
        name: '兑换码',
        component: exchange,
        meta:{
            needLogin:true
        }
    }, {
        path: '/address',
        name: '收货地址',
        component: address,
        meta:{
            needLogin:true
        }
    }, {
        path: '/discountcoupon',
        name: '优惠券',
        component: discountcoupon,
        meta:{
            needLogin:false
        }
    }, {
        path: '/remark',
        name: '备注',
        component: remark,
        meta:{
            needLogin:false
        }
    },{
        path: '/loseefficacy',
        name: '失效优惠券',
        component: loseefficacy,
        meta:{
            needLogin:false
        }
    }, {
        path: '/payment',
        name: '订单结算',
        component: payment,
        meta:{
            needLogin:true
        }
    }, {
        path: '/creatadd',
        name: '创建地址',
        component: creatadd,
        meta:{
            needLogin:true
        }
    }, {
        path: '/welfare',
        name: '福利社',
        component: welfare,
        meta:{
            needLogin:false
        }
    }, {
        path: '/loginin',
        name: '登录',
        component: loginin,
        meta:{
            needLogin:false
        }
    }, {
        path: '/orderfrom',
        name: '我的订单',
        component: orderfrom,
        meta:{
            needLogin:true
        }
    }, {
        path: '/claim',
        name: '取餐码',
        component: claim,
        meta:{
            needLogin:true
        }
    }, {
        path: '/register',
        name: '注册',
        component:register,
        meta:{
            needLogin:false
        }
    }, {
        path: '/myintegral',
        name: '积分',
        component:myintegral,
        meta:{
            needLogin:false
        }
    }, {
        path: '/valuecard',
        name: '储值卡',
        component:valuecard,
        meta:{
            needLogin:false
        }
    },, {
        path: '/userData',
        name: '个人资料',
        component:userData,
        meta:{
            needLogin:true
        }
    }, ]
})
// 解决Vue-Router升级导致的Uncaught(in promise) navigation guard问题
const originalPush = Router.prototype.push
Router.prototype.push = function push (location, onResolve, onReject) {
  if (onResolve || onReject) return originalPush.call(this, location, onResolve, onReject)
  return originalPush.call(this, location).catch(err => err)
}
router.beforeEach((to, from, next) => {
    // console.log(to.name)
    sessionStorage.setItem('title', to.name);
    let isLogin = localStorage.getItem('token')?localStorage.getItem('token'):sessionStorage.getItem('token');
    if (to.meta.needLogin) { // 判断该路由是否需要登录权限
        if (isLogin) { // 判断是否已经登录
            //console.log('已经登录')
            next()
        } else {
            //console.log('需要登录')
            next({
                path: '/loginin',
                query: {
                    redirect: to.fullPath
                } // 将跳转的路由path作为参数，登录成功后跳转到该路由
            })
        }
    } else {
        next()
    }
})

export default router