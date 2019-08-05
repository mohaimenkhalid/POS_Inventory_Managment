<template>
  <div>
    <div class="form-w3layouts" style="min-height: 800px;" >
        
        <div class="row">



          <div class="col-lg-5">
            <section class="panel card">
              <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0;box-shadow: -1px 9px 36px -10px rgba(0,0,0,0.74);">
                            <span style="float: left"><h4><b>Expense Insert</b></h4></span>
                             <button type="button" style="float: right; " class="btn btn-danger btn-sm">Add Customer</button></td>
              </header>
              <br><br>
               <div class="panel-body">
               
                  <table border  class="table table-bordered" ui-jq="footable" ui-options='{
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
                               
                                <th data-breakpoints="xs">Name</th>
                                                                          
                                <th data-breakpoints="xs">Qty</th>                                                                          
                                <th data-breakpoints="xs">Unit</th>                                                                          
                                <th data-breakpoints="xs">Total</th>                                                                          
                                <th data-breakpoints="xs">Action</th>                                                                          
                              
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-if="loadingstatus">
                                <td colspan="12"><p style="text-align: center"><img src="/backend/images/loading.gif" ></p></td>
                              </tr>
                            </tbody>
                            <tbody>
                              <tr data-expanded="true" >
                                <td>Hp 8440 Lapytop</td>
                                <td>2</td>
                                <td>42000</td>
                                <td>84000</td>
                                
                                <td>
                                  
                                  <button type="button" class="btn btn-danger btn-sm">X</button></td>
                              </tr>

                              <tr data-expanded="true" >
                                <td>RAM 8GB</td>
                                <td>2</td>
                                <td>4000</td>
                                <td>8000</td>
                                
                                <td>
                                  
                                  <button type="button" class="btn btn-danger btn-sm">X</button></td>
                              </tr>

                              <tr data-expanded="true" >
                                <td>LG monitor 22"</td>
                                <td>1</td>
                                <td>15000</td>
                                <td>15000</td>
                                
                                <td>
                                  
                                  <button type="button" class="btn btn-danger btn-sm">X</button></td>
                              </tr>
                              
                            </tbody>
                          </table>

                          <hr>


                          <ul class="list-group">
                            <li class="list-group-item"><span class="fleft">Total Quantity:</span> <span style="font-weight: bold;" class="fright">
                            10</span></li>
                            <li class="list-group-item"><span class="fleft">Sub Total:</span> <span style="font-weight: bold;" class="fright">
                            10</span></li>
                            <li class="list-group-item"><span class="fleft">Vat:</span> <span style="font-weight: bold;" class="fright">
                            5%</span></li>
                            <li class="list-group-item"><span class="fleft">Total:</span> <span style="font-weight: bold;" class="fright">
                            150000 ৳</span></li>
                          </ul>

                          <hr>
                            <span for="inputAddress">Customer Name</span>
                             <select class="form-control" >
                                    <option value="" disabled>Select Category</option>
                                    <option value=""  v-for="customer in customers">
                                    {{ customer.name }}</option>
                            </select>

                            <br>
                         
                            <span for="inputAddress">Pay</span>
                            <input type="text" class="form-control">
                            <br>
                            <span for="inputAddress">Due</span>
                            <input type="text" class="form-control" >
                            <br>
                            <span for="inputAddress">Payment method</span>
                             <select class="form-control" >
                                    <option value="" >Hand Cash</option>
                                    <option value="" >Check</option>
                                    <option value="" >Gify Card</option>
                                   
                            </select>
                            <br>
                            <button class="btn btn-primary">Submit</button>

                        

                   
                 </div>

            </section>
          </div>

            <div class="col-lg-7">

  
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0; box-shadow: -1px 9px 36px -10px rgba(0,0,0,0.74);" >
                            <span style="float: left"><h4><b>Products</b></h4></span>
                        </header>
                        <br>
                  <!-- Tab -->
              

                          <ul class="nav nav-tabs" role="tablist">
                          <li ><a class="nav-link active" href="#allproduct" role="tab" data-toggle="tab" >All Product</a></li>
                          <li v-for="category in categories" @click="subproduct(category.id)">
                            <a class="nav-link" href="#subproduct" role="tab" data-toggle="tab" v-if="">
                            {{ category.category_name }}</a>
                          </li>
                          
                        </ul>
                        </li>

                        <!-- Tab panes -->
                        <div class="tab-content">
                          <div class="tab-pane active" id="allproduct">
                            <!-- all product-->
                               <div class="panel-body"  style="height: 800px; overflow: scroll;">
                                    <span id="inp"><b>Search</b> <input type="text" name="search" placeholder="Search Product" v-model="searchkey"></span><br><br>
                                  <div class="row">
                                    <!-- loading status -->
                                  <div class="col-lg-12" v-if="loadingstatus">
                                     <p  style="text-align: center"><img src="/backend/images/loading.gif" ></p>
                                  </div>
                           
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-6" v-for="(product, index) in filtersearch" style=" text-align: center; margin-bottom: 1rem"> 
                                    <a href="">
                                      <div class="card" style="width: 8.5rem; min-height:11rem;">
                                          
                                            <div class="card-body">
                              
                                              <img :src="product.image"  id="card_image">
                                              <small class="card-title">{{ product.product_name }}</small>
                                              <span v-if="product.product_quantity >0" class="badge badge-success">Available ({{ product.product_quantity }})</span>
                                          <span v-if="product.product_quantity < 1" class="badge badge-danger">Stock out</span>
                                            </div>
                                      </div>
                                    </a>
                                    </div>   
                                  </div>
                                </div>
                          </div>

                          <div class="tab-pane" id="subproduct">
                              <!-- subproduct -->

                              <!-- all product-->
                               <div class="panel-body"  style="height: 800px; overflow: scroll;">
                                    <span id="inp"><b>Search</b> <input type="text" name="search" placeholder="Search Product" v-model="getsearchkey"></span><br><br>
                                  <div class="row">
                                    <!-- loading status -->
                                    <div class="col-lg-12" v-if="loadingstatus">
                                     <p  style="text-align: center"><img src="/backend/images/loading.gif" ></p>
                                  </div>
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-6" v-for="(product, index) in getfiltersearch" style=" text-align: center; margin-bottom: 1rem"> 
                                    <a href="">
                                      <div class="card" style="width: 8.5rem; min-height:11rem;">
                                          
                                            <div class="card-body">
                                              <img :src="product.image"  id="card_image" >
                                              <small class="card-title">{{ product.product_name }}</small>
                                              <span v-if="product.product_quantity >0" class="badge badge-success">Available ({{ product.product_quantity }})</span>
                                          <span v-if="product.product_quantity < 1" class="badge badge-danger">Stock out</span>
                                            </div>
                                      </div>
                                    </a>
                                    </div>   
                                  </div>
                                </div>


                          </div>
                          
                        </div>

             
               <!-- Tab -->
                       
                 </section>
            </div>
        </div>
    </div>
  </div>
</template>

<style>

.nav-tabs{
  background-color:#C8D3DB;
}

.nav-tabs > li > a{
  border-radius: 5px;
}
.nav-tabs > li > a:hover{
  background-color: #3D515F !important;
    border-radius: 5px;
    color:#fff;
    border:1px solid black;
}
.nav-tabs > li.active > a,
.nav-tabs > li.active > a:focus,
.nav-tabs > li.active > a:hover{
    background-color: #68889E !important;
    color:#fff;
    border:2px solid #3F515F;
}
  #card_image{
  height:90px;
  width: 80px;

}

#inp input[type=text] {
  width: 130px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  font-size: 16px;
  background-color: white;
  background-repeat: no-repeat;
  -webkit-transition: width 0.4s ease-in-out;
  transition: width 0.4s ease-in-out;

}

#inp input[type=text]:focus {
  width: 100%;
}

.nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
    color: #fff;
    background-color: #007bff;
    border-color: #dee2e6 #dee2e6 #f8fafc;
}

.nav li a{
  color: #007bff;
}

.nav-tabs{
  background-color: #fff;
}

.nav-tabs li a{
  border-radius: 39px;
}
.nav-tabs li  a:hover{
  background-color: #007bff;
}

.fleft{
  float: left;
}

.fright{
  float: right;
}


</style>

<script>
    export default{
      data(){
            return{
                products: [],

                loadingstatus: true,
                imageloadingstatus: true,

                searchkey: "",
                getsearchkey: "",
                categories: {},
                getproducts: [],
                ariaselected: true,
                customers: {},

            }
        },

    mounted(){

        if (!User.loggedIn()) {     //check login or not
            this.$router.push({ name: '/' });
        }

        this.product();
        this.allcategory();
        this.customer();
    },

    methods: {
      product(){
        axios.get('/api/product/')
        .then(res=>{
          this.loadingstatus = false;
          this.products = res.data;
        })
        .catch()
      },

       allcategory(){
          axios.get('/api/category/')
          .then(res=>{
            this.categories = res.data;
          })
          .catch()
        },

        subproduct(id){
          axios.get('/api/getting/product/'+id)
          .then(res=>{
            this.loadingstatus = false;
            this.getproducts = res.data;
          })
          .catch()
        },


        customer(){
        axios.get('/api/customer/')
        .then(res=>{
          this.customers = res.data;
        })
        .catch()
      },

      
    },

    computed:{
      filtersearch(){
       return this.products.filter(employee=>{
          return employee.product_name.match(this.searchkey);
        });
      },

      getfiltersearch(){
        return this.getproducts.filter(getproduct=>{
          return getproduct.product_name.match(this.getsearchkey);
        });
      }
    }


   
}
</script>