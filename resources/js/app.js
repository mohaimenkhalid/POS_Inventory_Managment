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

//Noti Helper Class
import Notification from './Helpers/Notification';
window.Notification = Notification;


//Sweet Alert2
import Swal from 'sweetalert2'
window.Swal = Swal;

const Toast = Swal.mixin({
  toast: true,
  position: 'top-end',
  showConfirmButton: false,
  timer: 3000
});
window.Toast = Toast;


const app = new Vue({
    el: '#app',
    router,
});
