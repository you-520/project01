import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import iconfont from'./assets/css/iconfont.css'
import axios from 'axios'
import qs from 'qs'
axios.defaults.baseURL = 'http://127.0.0.1:3000/'
Vue.prototype.axios = axios;
Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
