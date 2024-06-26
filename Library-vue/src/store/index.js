//引入Vue核心库
import Vue from 'vue'
//引入Vuex
import Vuex from 'vuex'
// state
import school from './states/school'
import user from './states/user'
import receive from './states/receive'
// action
import actions from './actions'
// mutation
import mutations from "./mutations";
// getter
import getters from './getters';


//应用Vuex插件
Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        user,
        school,
        receive,
    },
    actions,
    mutations,
    getters,
});
