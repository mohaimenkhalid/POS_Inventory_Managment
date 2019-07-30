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
/*Vue.component('example-component', require('./components/ExampleComponent.vue').default);*/

const app = new Vue({
    el: '#app',
    router,
});
