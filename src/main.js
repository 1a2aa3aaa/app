// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import store from './store';
import App from './App'
import router from './router'
import Vuetouch from 'vue-touch'
Vue.use(Vuetouch, { name: 'v-touch' })
import MintUI from "mint-ui"
import "mint-ui/lib/style.css"
Vue.use(MintUI)
//Vue.config.productionTip = false
import axios from "axios"
axios.defaults.baseURL = "http://xingh1.applinzi.com/"
//http://xingh1.applinzi.com/
//http://127.0.0.1:5050/
axios.defaults.withCredentials = true
Vue.prototype.axios = axios;
import VueSocketio from 'vue-socket.io';

Vue.use(new VueSocketio({
    debug: true,
    connection: 'ws://xhai.applinzi.com',
		//ws://xingh.applinzi.com:4000
	//ws://127.0.0.1:4000
}))
/* eslint-disable no-new */
// 10:注册vuex
//Vue.use(Vuex)
new Vue({
    el: '#app',
    router,
    store,
    components: { App },
    template: '<App/>'
})