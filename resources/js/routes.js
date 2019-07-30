import Login from './components/auth/Login.vue';
import register from './components/auth/register.vue';


export const routes = [
  { path: '/', component: Login },
  { path: '/login', component: register },

]