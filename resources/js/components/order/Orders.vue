<template>
	<div>
		<div class="form-w3layouts" style="min-height: 800px;">
        
        <div class="row">
           <div class="col-lg-1"></div>
            <div class="col-lg-10">
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0">
                            <span style="float: left"><h4><b>Today Orders</b></h4></span>
                        </header>
                        <div class="panel-body">

                          
                        <span><b>Search</b> <input type="text" name="search" v-model="searchkey"></span><br><br>
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
                                <th data-breakpoints="xs">Name</th>
                                <th data-breakpoints="xs">Total Amount</th>
                                <th data-breakpoints="xs">Pay</th>
                                <th data-breakpoints="xs">Due</th>
                                <th data-breakpoints="xs">PayBy</th>
                      
                                 <th>Action</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-if="loadingstatus">
                                <td colspan="7"><p style="text-align: center"><img src="/backend/images/loading.gif" ></p></td>
                              </tr>
                            </tbody>
                            <tbody>
                              <tr data-expanded="true" v-for="(order, index) in orders">
                                <td>{{ index+1 }}</td>
                                <td>{{ order.customer.name }}</td>
                                <td>{{ order.total }}</td>
                                <td>{{ order.pay }}</td>
                                <td>{{ order.due }}</td>
                                <td>{{ order.payby }}</td>
                                
                                <td>
                                  <router-link :to="'/view-order/'+order.id"  class="btn btn-primary btn-sm">View</router-link>
                                 </td>
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
                orders: [],
                loadingstatus: true,
                searchkey: ""
            }
        },

    mounted(){

        if (!User.loggedIn()) {     //check login or not
            this.$router.push({ name: '/' });
        }

        this.allorder();
    },

    methods: {
      allorder(){
        axios.get('/api/orders')
        .then(res=>{
          this.loadingstatus = false;
          this.orders = res.data;
        })
        .catch()
      }
    },

    computed:{
      /*filtersearch(){
       return this.allorder.filter(order=>{
          return order.customer_id.match(this.searchkey);
        });
      }*/
    }


   
}
</script>