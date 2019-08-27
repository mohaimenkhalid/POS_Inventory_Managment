<template>
	<div>
		
	<h2>Forget Password</h2>

	<div class="market-updates">
            <div class="col-md-3 market-update-gd">
                <div class="market-update-block clr-block-2">
                    <div class="col-md-4 market-update-right">
                        <i class="fa fa-usd"></i>
                    </div>
                     <div class="col-md-8 market-update-left">
                     <h4>Today Sell</h4>
                    <h3>{{ todaysell }}</h3>
                    <router-link to="/orders" class="btn btn-sm btn-danger">Today Sell</router-link>
                  </div>
                  <div class="clearfix"> </div>
                </div>
            </div>
            <div class="col-md-3 market-update-gd">
                <div class="market-update-block clr-block-1">
                    <div class="col-md-4 market-update-right">
                        <i class="fa fa-usd" ></i>
                    </div>
                    <div class="col-md-8 market-update-left">
                    <h4>Today Income</h4>
                        <h3>{{ income }}</h3>
                        <router-link to="/orders" class="btn btn-sm btn-success">Today Sell</router-link>
                    </div>
                  <div class="clearfix"> </div>
                </div>
            </div>
            <div class="col-md-3 market-update-gd">
                <div class="market-update-block clr-block-3">
                    <div class="col-md-4 market-update-right">
                        <i class="fa fa-shopping-cart"></i>
                    </div>
                    <div class="col-md-8 market-update-left">
                        <h4>Sales Item</h4>
                       <h3>{{ totalsale }}</h3>
                        <router-link to="/orders" class="btn btn-sm btn-info">Today Sell</router-link>
                    </div>
                  <div class="clearfix"> </div>
                </div>
            </div>
            <div class="col-md-3 market-update-gd">
                <div class="market-update-block clr-block-4">
                    <div class="col-md-4 market-update-right">
                        <i class="fa fa-usd" aria-hidden="true"></i>
                    </div>
                    <div class="col-md-8 market-update-left">
                        <h4>Due</h4>
                        <h3>{{ due }}</h3>
                         <router-link to="/orders" class="btn btn-sm btn-info">Today Sell</router-link>
                    </div>
                  <div class="clearfix"> </div>
                </div>
            </div>
           <div class="clearfix"> </div>



        </div> 


        <div class="col-md-6 w3agile-notifications">
            <div class="notifications" >
                <!--notification start-->
                
                    <header class="panel-heading">
                        Notification 
                    </header>
                    <div class="notify-w3ls" style="height: 400px; overflow: scroll;">

                        <p v-if="loadingstatus" style="text-align: center"><img src="/backend/images/loading.gif" ></p>
                       
                        <div class="alert alert-danger" v-for="product in products">
                            <span >

                            <img :src="product.image" width="50" height="60">
                            </span>
                            <div class="notification-info">
                                <ul class="clearfix notification-meta">
                                    <li class="pull-left notification-sender"><span><a href="#"><h5>{{ product.product_name }}</h5></a></span> <br>Code : {{ product.product_code }} <br>
                                    Price : {{ product.buying_price }}

                                    </li>
                                    <li class="pull-right notification-time"> <span class="badge badge-danger">Stock out</span></li>
                                </ul>
                                
                            </div>
                        </div>
                       
                        
                    </div>
                </div>
            </div>
                
                <!--notification end-->


		


	</div>
</template>

<script>

export default{

    data(){
        return{
            todaysell: "",
            income: "",
            due: "",
            totalsale: "",
            products: "",
            loadingstatus: true,
        }
    },


	mounted(){

		if (!User.loggedIn()) { 	//check login or not
			this.$router.push({ name: '/' });
		}

        this.TodaySell();
        this.TodayIncome();
        this.sale();
        this.TodayDue();
        this.stockOut();

	},

    methods:{
        TodaySell(){
            axios.get('/api/today/sell')
            .then(res=>{
              this.todaysell = res.data;
            })
            .catch()
            },

             TodayIncome(){
            axios.get('/api/today/income')
            .then(res=>{
              this.income = res.data;
            })
            .catch()
            },

             sale(){
            axios.get('/api/today/sale')
            .then(res=>{
              this.totalsale = res.data;
            })
            .catch()
            },

            TodayDue(){
            axios.get('/api/today/due')
            .then(res=>{
              this.due = res.data;
            })
            .catch()
            },


            stockOut(){
            axios.get('/api/stockout')
            .then(res=>{
              this.products = res.data;
            this.loadingstatus = false;
            })
            .catch()
            }
    }

}

	
</script>