// authentication
import Login from './components/auth/Login.vue';
import Register from './components/auth/Register.vue';
import Forget from './components/auth/Forget.vue';
import Logout from './components/auth/Logout.vue';
//Home
import Home from './components/Home.vue';

//employe
import CreateEmployee from './components/employee/Create.vue';
import Employee from './components/employee/Index.vue';
import EditEmployee from './components/employee/Edit.vue';

//employe
import CreateSupplier from './components/supplier/Create.vue';
import Supplier from './components/supplier/Index.vue';
import EditSupplier from './components/supplier/Edit.vue';

//Category
import CreateCategory from './components/category/Create.vue';
import Category from './components/category/Index.vue';
import EditCategory from './components/category/Edit.vue';

//Product
import CreateProduct from './components/product/Create.vue';
import Product from './components/product/Index.vue';
import EditProduct from './components/product/Edit.vue';

//Expense
import CreateExpense from './components/expense/Create.vue';
import Expense from './components/expense/Index.vue';
import EditExpense from './components/expense/Edit.vue';







export const routes = [
  { path: '/', component: Login , name: '/'},
  { path: '/register', component: Register, name: 'register' },
  { path: '/forget-password', component: Forget, name: 'forget' },
  { path: '/logout', component: Logout, name: 'logout' },
  { path: '/home', component: Home, name: 'home'},
  //employee
   { path: '/store-employee', component: CreateEmployee, name: 'store-employee'},
   { path: '/employee', component: Employee, name: 'employee'},
   { path: '/edit-employee/:id', component: EditEmployee, name: 'edit-employee'},

   //Supplier
   { path: '/store-supplier', component: CreateSupplier, name: 'store-supplier'},
   { path: '/supplier', component: Supplier, name: 'supplier'},
   { path: '/edit-supplier/:id', component: EditSupplier, name: 'edit-supplier'},

   //category
   { path: '/store-category', component: CreateCategory, name: 'store-category'},
   { path: '/category', component: Category, name: 'category'},
   { path: '/edit-category/:id', component: EditCategory, name: 'edit-category'},

   //product
   { path: '/store-product', component: CreateProduct, name: 'store-product'},
   { path: '/product', component: Product, name: 'product'},
   { path: '/edit-product/:id', component: EditProduct, name: 'edit-product'},

    //Expense
   { path: '/store-expense', component: CreateExpense, name: 'store-expense'},
   { path: '/expense', component: Expense, name: 'expense'},
   { path: '/edit-expense/:id', component: EditExpense, name: 'edit-expense'},

]