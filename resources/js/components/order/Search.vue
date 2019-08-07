<template>
    <div>

        <div class="form-w3layouts" style="min-height: 800px;">
        
        <div class="row">
          <div class="col-lg-2"></div>
            <div class="col-lg-8">
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0">
                            <span style="float: left"><h4><b>Search Order</b></h4></span>
                            <router-link to="/orders"  style="float: right; padding-top: 10px;" type="submit" class="btn btn-primary">Today Order</router-link>

                        </header>
                        <div class="panel-body">
                        
                          <form  @submit.prevent="searchbydate">
                              <div class="form-row">

                                <div class="form-group col-md-6">
                                  <label for="inputName">Select Date</label>
                                  <input type="date" class="form-control" v-model="searchkey" required="">
                                  <small class="text-danger" v-if="errors.searchkey">{{ errors.searchkey[0] }}</small><br>
                                </div>
                               
                              </div>

                            
                              <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </section>

            </div>
        </div>


        <div class="row">
          <div class="col-lg-1"></div>
            <div class="col-lg-10">
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0">
                            <span ><h4><b>Search Result</b></h4></span>

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
                                <th data-breakpoints="xs">Name</th>
                                <th data-breakpoints="xs">Total Amount</th>
                                <th data-breakpoints="xs">Pay</th>
                                <th data-breakpoints="xs">Due</th>
                                <th data-breakpoints="xs">PayBy</th>
                      
                                 <th>Action</th>
                              </tr>
                            </thead>
                           
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
                
                searchkey : "",
                
                orders: [],

                errors: {},
            }
        },

    mounted(){

        if (!User.loggedIn()) {     //check login or not
            this.$router.push({ name: '/' });
        }


    },


    methods: {
       
        searchbydate(){
         console.log(this.searchkey);
          axios.get('/api/order/search?query='+this.searchkey)
          .then(res=>{

            console.log(res.data)
           this.orders = res.data;
          })
          .catch(error=>{
           this.errors = error.response.data.errors;
          })
        }
    }
}
</script>