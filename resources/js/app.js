require('./bootstrap');
//import vue adn VueRouter router
import Vue from 'vue'
import VueRouter from 'vue-router'
Vue.use(VueRouter)

const router = new VueRouter({
  routes ,
  mode: 'history'
})

//router import
import {routes} from './routes';

//Global Helper Class
import User from './Helpers/User';
window.User = User;

const app = new Vue({
    el: '#app',
    router,
});
