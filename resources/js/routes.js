import Login from './components/auth/Login.vue';
import Register from './components/auth/Register.vue';
import Forget from './components/auth/Forget.vue';

import Home from './components/Home.vue';


export const routes = [
  { path: '/', component: Login , name: '/'},
  { path: '/register', component: Register, name: 'register' },
  { path: '/forget-password', component: Forget, name: 'forget' },
  { path: '/home', component: Home, name: 'home'},

]