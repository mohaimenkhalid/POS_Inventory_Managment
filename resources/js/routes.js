import Login from './components/auth/Login.vue';
import Register from './components/auth/Register.vue';
import Forget from './components/auth/Forget.vue';


export const routes = [
  { path: '/', component: Login },
  { path: '/register', component: Register },
  { path: '/forget-password', component: Forget },

]