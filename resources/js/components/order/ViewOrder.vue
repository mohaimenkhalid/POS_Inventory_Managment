<template>
  <div>
    <div class="form-w3layouts" style="min-height: 800px;">


      <div class="row">
           <div class="col-lg-1"></div>
            <div class="col-lg-10">
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0">
                            <span style="float: left"><h4><b>Order</b></h4></span>
                            <router-link to="/orders"  style="float: right; padding-top: 10px;" type="submit" class="btn btn-primary">View Back</router-link>
                        </header>

                        <p style="text-align: center" v-if="loadingstatushead"><img src="/backend/images/loading.gif" ></p>
                        <div class="panel-body" v-else="">

                            <div class="col-lg-6 ">
                            <ul class="list-group">
                              <li class="list-group-item bg-info text-white">Customer Details</li>
                              <li class="list-group-item">Name: {{ orders.name }}</li>
                              <li class="list-group-item">Phone: {{ orders.phone }}</li>
                              <li class="list-group-item">Address: {{ orders.address }}</li>
                              <li class="list-group-item">Date: {{ orders.order_date }}</li>
                              <li class="list-group-item">Quantity: {{ orders.qty }}</li>
                            </ul>

                        </div>

                        <div class="col-lg-6 ">
                            <ul class="list-group">
                              <li class="list-group-item">Sub Total : {{ orders.sub_total }}</li>
                              <li class="list-group-item">Vat : {{ orders.vat }}%</li>
                              <li class="list-group-item">Total : {{ orders.total }}</li>
                              <li class="list-group-item">Pay : {{ orders.pay }}</li>
                              <li class="list-group-item">Due : {{ orders.due }}</li>
                              <li class="list-group-item">Payby : {{ orders.payby }}</li>
                            </ul>
                            
                        </div>
                        </div>

                    </section>

            </div>
        </div>
        
        <div class="row">
           <div class="col-lg-1"></div>
            <div class="col-lg-10">
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0">
                            <span style="float: left"><h4><b>Order Details</b></h4></span>
                        </header>
                        <div class="panel-body">

                          <div class="table-responsive text-nowrap">

                          <table  class="table table-bordered" ui-jq="footable" ui-options='{
                            "paging": {
                              "enabled": true
                            },
                            "filtering": {
                              "enabled": true
                            },
                            "sorting": {
                              "enabled": true
                            }}'>
                            <thead>
                              <tr>
                                <th data-breakpoints="xs">S/L</th>
                                <th data-breakpoints="xs">Image</th>
                                <th data-breakpoints="xs">Product Name</th>
                                <th data-breakpoints="xs">Product Code</th>
                                <th data-breakpoints="xs"> Unit Price</th>
                                <th data-breakpoints="xs">Quantiry</th>
                                <th data-breakpoints="xs">Total</th>
    
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-if="loadingstatus">
                                <td colspan="7"><p style="text-align: center"><img src="/backend/images/loading.gif" ></p></td>
                              </tr>
                            </tbody>
                            <tbody>
                              <tr data-expanded="true" v-for="(order, index) in orderdetails">
                                <td>{{ index+1 }}</td>
                                <td><img :src="order.product.image" width="150"></td>
                                <td>{{ order.product.product_name }}</td>
                                <td>{{ order.product.product_code }}</td>
                                <td>{{ order.product.selling_price }}</td>
                                <td>{{ order.pro_qantity }}</td>
                                <td>{{ order.sub_total }}</td>
                    
                              </tr>
                              
                            </tbody>
                          </table>
                        </div>
                        </div>
                    </section>

            </div>
        </div>
    </div>
  </div>
</template>

<script>
    export default{
      data(){
            return{

                orderdetails: [],
                orders: {},
                loadingstatus: true,
                loadingstatushead: true,
                searchkey: ""
            }
        },

    mounted(){


        this.order_id = this.$route.params.id;

        if (!User.loggedIn()) {     //check login or not
            this.$router.push({ name: '/' });
        }

        this.allorder();
    },

    methods: {
      allorder(){
        axios.get('/api/order/view-details/'+this.order_id)
        .then(res=>{
          this.loadingstatus = false;
          this.orderdetails = res.data;
        })
        .catch()


        axios.get('/api/order/view-order/'+this.order_id)
        .then(res=>{
          this.loadingstatushead = false;
          this.orders = res.data;
        })
        .catch()
      }
    },

    
   
}
</script>