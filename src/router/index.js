import Vue from 'vue'
import Router from 'vue-router'
import ceshi1 from '../components/ceshi/ceshi1.vue'
import reg from '../components/ceshi/reg.vue'
import product0 from '../components/product/product.vue'
import product1 from '../components/product/product1.vue'
import product2 from '../components/product/product2.vue'
import product3 from '../components/product/product3.vue'
import prtop from '../components/pr-0/pr-t.vue'
import banner from '../components/pr-0/pr-banner.vue'
import list from '../components/pr-0/pr-list.vue'
import publish from '../components/pr-1/publish/publish.vue'
import detil from '../components/detil/detil.vue'
import mess from "@/components/detil/mess.vue"
import collect from "@/components/pr-3/collect.vue"
import mypost from "@/components/pr-3/mypost.vue"
import mymess from "@/components/pr-3/mymess.vue"
import my from "@/components/pr-3/my.vue"
import sel from "@/components/detil/select.vue"
import rwxx from "@/components/detil/rwxx.vue"
import upr from "@/components/1.vue"
import cc from "@/components/Upload.vue"
import liaot from "@/components/pr-2/liaot.vue"
Vue.use(Router)
//解决多次重复点击路由报错却不影响使用问题
const originalPush = Router.prototype.push;
Router.prototype.push = function push(location) {
    return originalPush.call(this, location).catch(err => err);
};
export default new Router({
    routes: [
        { path: '/', component: ceshi1 },
        { path: '/ceshi1', component: ceshi1 },
        { path: '/reg', component: reg },
        { path: '/product0', component: product0 },
        { path: '/product1', component: product1 },
        { path: '/product2', component: product2 },
        { path: '/product3', component: product3 },
        { path: '/prtop', component: prtop },
        { path: '/banner', component: banner },
        { path: '/list', component: list },
        { path: '/publish', component: publish },
        {
            path: '/detil',
            name: 'detil',
            component: detil
        },
        { path: '/mess', component: mess },
        { path: '/collect', component: collect },
        { path: '/mypost', component: mypost },
        { path: '/mymess', component: mymess },
        { path: '/my', component: my },
        { path: '/sel', component: sel },
        { path: '/upr', component: upr },
        { path: '/cc', component: cc },
        { path: '/liaot/:uname/:uid', component: liaot, props: true },
        { path: '/rwxx/:uid', component: rwxx, props: true },
        // {
        //     path: '/detil/:lid',
        //     component: detil,
        //     props: true
        // }
    ]
})