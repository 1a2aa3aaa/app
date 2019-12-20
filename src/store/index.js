import Vue from "vue";
import Vuex from "vuex";
import createPersistedState from "vuex-persistedstate" //引入插件
import axios from "axios"


Vue.use(Vuex);

export default new Vuex.Store({
    plugins: [createPersistedState({
        storage: window.sessionStorage, //防止页面刷新vuex内容重置问题
        reducer(val) {
            return {
                // 只储存state中的isLogin
                isLogin: val.isLogin //只保存islogin状态
            }
        }
    })],
    //plugins: [createPersistedState()], //防止页面刷新vuex内容重置问题
    state: {
        tuisongMessage: "",
        uname: "",
        tabbarShow: false,
        isLogin: 0,
        pathurl: "http://xingh1.applinzi.com/", 
			//http://127.0.0.1:5050/
			//http://linan.applinzi.com/
		//http://xingh1.applinzi.com/
    },
    getters: {
        getTabbarShow(state) {
            return state.tabbarShow
        },
        getisLogin(state) {
            return state.isLogin
        },
        getispathurl(state) {
            return state.pathurl
        }
    },
    mutations: {
        updateMessage(state, payload) {

            state.tuisongMessage = payload;



        },
        setuname(state, uname) {
            state.uname = uname
        },
        updateTabbarShow(state, payload) {
            state.tabbarShow = payload
        },
        updateisLogin(state, payload) {
            state.isLogin = payload
        }
    },
    actions: {
        login(context, name) {
            (async function () {
                var result = await axios.get("user/login", { params: name });
                console.log(result);
                context.commit("setuname", result.data.code)
            })()

        }
    }
});