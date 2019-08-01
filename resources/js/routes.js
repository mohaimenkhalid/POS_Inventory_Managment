// authentication
import Login from './components/auth/Login.vue';
import Register from './components/auth/Register.vue';
import Forget from './components/auth/Forget.vue';
import Logout from './components/auth/Logout.vue';
//Home
import Home from './components/Home.vue';

//employe
import Create from './components/employee/Create.vue';
import Index from './components/employee/Index.vue';




export const routes = [
  { path: '/', component: Login , name: '/'},
  { path: '/register', component: Register, name: 'register' },
  { path: '/forget-password', component: Forget, name: 'forget' },
  { path: '/logout', component: Logout, name: 'logout' },
  { path: '/home', component: Home, name: 'home'},
  //employee
   { path: '/store-employee', component: Create, name: 'store-employee'},
   { path: '/employee', component: Index, name: 'employee'},

]