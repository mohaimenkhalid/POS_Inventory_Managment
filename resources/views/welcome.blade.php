<!DOCTYPE html>
<head>
    <base href="/" />
<title>POS</title>
<meta name="csrf-token" content="{{ csrf_token() }}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link rel="stylesheet" href="{{ asset('backend/css/bootstrap.min.css')}}" >
<!-- //bootstrap-css -->
<!-- Custom CSS -->
<link href="{{ asset('backend/css/style.css')}}" rel='stylesheet' type='text/css' />
<link href="{{ asset('backend/css/style-responsive.css')}}" rel="stylesheet"/>
<!-- font CSS -->
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<!-- font-awesome icons -->
<link rel="stylesheet" href="{{ asset('backend/css/font.css')}}" type="text/css')}}"/>
<link href="{{ asset('backend/css/font-awesome.css')}}" rel="stylesheet"> 
<link rel="stylesheet" href="{{ asset('backend/css/morris.css')}}" type="text/css')}}"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<!-- calendar -->
<link rel="stylesheet" href="{{ asset('backend/css/monthly.css')}}">
<!-- //calendar -->
<!-- //font-awesome icons -->
<script src="{{ ('backend/js/jquery2.0.3.min.js') }}"></script>
<script src="{{ ('backend/js/raphael-min.js') }}"></script>
<script src="{{ ('backend/js/morris.js') }}"></script>



<!-- Main Bootstrap -->

<link rel="stylesheet" type="text/css" href="{{ asset('css/app.css') }}">
</head>
<body>
    <div id="app">
<section id="container">
<!--header start-->
<header class="header fixed-top clearfix"   v-if="$route.path === '/' || $route.path === '/register' || $route.path === '/forget-password' ? false : true">
<!--logo start-->
<div class="brand">
    <a href="index.html" class="logo">
        VISITORS
    </a>
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars"></div>
    </div>
</div>
<!--logo end-->
<div class="nav notify-row" id="top_menu">
    <!--  notification start -->
    <ul class="nav top-menu">
      
      <h3>Inventory Management System</h3>
    </ul>
    <!--  notification end -->
</div>
<div class="top-nav clearfix">
    <!--search & user info start-->
    <ul class="nav pull-right top-menu">
       <!--  <li>
            <input type="text" class="form-control search" placeholder=" Search">
        </li> -->
        <!-- user login dropdown start-->
        <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <img alt="" src="{{ asset('backend/images/avatar.png') }}">
                <span class="username" id="username"></span>
               <!--  <b class="caret"></b> -->
            </a>
            <ul class="dropdown-menu extended logout">
                <li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
                <li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
                <li><router-link to="/logout"><i class="fa fa-key"></i>Logout</router-link></li>
                
            </ul>
        </li>
        <!-- user login dropdown end -->
       
    </ul>
    <!--search & user info end-->
</div>
</header>
<!--header end-->
<!--sidebar start-->
<aside  v-if="$route.path === '/' || $route.path === '/register' || $route.path === '/forget-password' ? false : true">
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <div class="leftside-navigation">
            <ul class="sidebar-menu" id="nav-accordion">
                <li>
                    <router-link  to="/home">
                        <i class="fa fa-dashboard"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>Employee</span>
                    </a>
                    <ul class="sub">
                        <li><router-link to="/store-employee">Add New</router-link></li>
                        <li><router-link to="/employee">All Employee</router-link></li>
                    </ul>
                </li>



                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>Suppliers</span>
                    </a>
                    <ul class="sub">
                        <li><router-link to="/store-supplier">Add Supplier</router-link></li>
                        <li><router-link to="/supplier">All Supplier</router-link></li>
                    </ul>
                </li>


                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>Category</span>
                    </a>
                    <ul class="sub">
                        <li><router-link to="/store-category">Add Category</router-link></li>
                        <li><router-link to="/category">All Category</router-link></li>
                    </ul>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>Product</span>
                    </a>
                    <ul class="sub">
                        <li><router-link to="/store-product">Add Product</router-link></li>
                        <li><router-link to="/product">All Product</router-link></li>
                    </ul>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>Expense</span>
                    </a>
                    <ul class="sub">
                        <li><router-link to="/store-expense">Add Expense</router-link></li>
                        <li><router-link to="/expense">All Expense</router-link></li>
                    </ul>
                </li>

                
            </ul>
        </div>
        <!-- sidebar menu end-->
    </div>
</aside>
<!--sidebar end-->
<!--main content start-->
<section id="main-content" >
    <section class="wrapper" style="min-height: 800px;">
        
            <router-view></router-view>
  
</section>
 <!-- footer -->
          <div class="footer"  v-if="$route.path === '/' || $route.path === '/register' || $route.path === '/forget-password' ? false : true">
            <div class="wthree-copyright">
              <p>© 2019 Mohaimen. All rights reserved</p>
            </div>
          </div>
  <!-- / footer -->
</section>
<!--main content end-->
</section>
</div>


<script src="{{ asset('js/app.js')}}"></script>
{{-- <script src="{{ asset('backend/js/bootstrap.js')}}"></script> --}}
<script src="{{ asset('backend/js/jquery.dcjqaccordion.2.7.js')}}"></script>
<script src="{{ asset('backend/js/scripts.js')}}"></script>
<script src="{{ asset('backend/js/jquery.slimscroll.js')}}"></script>
<script src="{{ asset('backend/js/jquery.nicescroll.js')}}"></script>
{{-- [if lte IE 8]><script language="javascript" type="text/javascript" src="{{ asset('backend/js/flot-chart/excanvas.min.js')}}"></script><![endif] --}}
<script src="{{ asset('backend/js/jquery.scrollTo.js')}}"></script>
<!-- morris JavaScript --> 

<script type="text/javascript">

    
    let token = localStorage.getItem("token")
    if (token) {
        $("#topbar").css("display", "");
        $("#leftbar").css("display", "");
        $("#footer").css("display", "");
    }

    if (localStorage.getItem("user")) {
            $('#username').html(localStorage.getItem("user"));
    }

</script> 

</body>
</html>
