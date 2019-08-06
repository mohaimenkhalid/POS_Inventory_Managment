<template>
  <div>
    <div class="form-w3layouts" style="min-height: 800px;" >
        
        <div class="row">



          <div class="col-lg-5">
            <section class="panel card">
              <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0;box-shadow: -1px 9px 36px -10px rgba(0,0,0,0.74);">
                            <span style="float: left"><h4><b>Expense Insert</b></h4></span>
                             <button data-toggle="modal" data-target="#exampleModal" type="button" style="float: right; " class="btn btn-danger btn-sm">Add Customer</button></td>

                             <!-- Modal -->
                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                  <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">New Customer Add</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="closeModal">
                                          <span aria-hidden="true">&times;</span>
                                        </button>
                                      </div>
                                      <div class="modal-body">
                                <!-- Modal Body -->
                                              <form enctype="multiplart/form-data" @submit.prevent="customerInsert">
                                                <div class="form-row">
                                                  <div class="form-group col-md-6">
                                                    <label for="inputName">Full Name</label>
                                                    <input type="text" class="form-control" v-model="form.name">
                                                    <small class="text-danger" v-if="errors.name">{{ errors.name[0] }}</small><br>
                                                  </div>
                                                  <div class="form-group col-md-6">
                                                    <label for="inputPassword4">Email Address</label>
                                                    <input type="Email" class="form-control" v-model="form.email" >
                                                     <small class="text-danger" v-if="errors.email">{{ errors.email[0] }}</small><br>
                                                  </div>
                                                </div>


                                                 <div class="form-row">


                                                  <div class="form-group col-md-6">
                                                    <label for="inputAddress">Address</label>
                                                    <input type="text" class="form-control" v-model="form.address" >
                                                     <small class="text-danger" v-if="errors.address">{{ errors.address[0] }}</small><br>
                                                  </div>

                                                  <div class="form-group col-md-6">
                                                    <label for="inputPhone">Phone No</label>
                                                   <input type="number" class="form-control" v-model="form.phone" >
                                                     <small class="text-danger" v-if="errors.phone">{{ errors.phone[0] }}</small><br>
                                                  </div>
                                                  
                                                </div>
                                                
                                                <div class="form-row">
                                                  
                                                  <div class="form-group col-md-6">
                                                  <label for="inputPhoto">Select Image</label>
                                                   <input type="file" class="custom-file-input" id="inputGroupFile04" @change="onFileSelected" >
                                                  <label class="custom-file-label" for="inputGroupFile04" >Choose file</label>
                                                  <!-- <small class="text-danger" v-if="errors.photo">{{ errors.photo[0] }}</small><br> -->
                                                  </div>
                                                  
                                                </div>

                                                <div class="form-row">
                                                  
                                                  <div class="form-group col-md-4">
                                                      <img :src="form.photo" alt="No image Selected"  height="150" >
                                                  </div>
                                                </div>
                                               
                                                <button type="submit" class="btn btn-primary" >Submit</button>
                                              </form>



                                      </div>
                                      <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                      </div>
                                    </div>
                                  </div>
                                </div>
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
                              <tr v-if="loadingcartstatus">
                                <td colspan="5"><p style="text-align: center"><img src="/backend/images/loading.gif" ></p></td>
                              </tr>
                            </tbody>
                            <tbody>
                              <tr data-expanded="true"  v-for="cart in carts">
                                <td>{{ cart.pro_name }}</td>
                                <td>
                                  
                                  <span>
                                    <button class="btn btn-sm btn-danger" @click="cartDecrement(cart.id)" v-if="cart.pro_quantity >= 2">-</button>
                                  <button class="btn btn-sm btn-danger" @click="cartDecrement(cart.id)" v-else="" disabled>-</button>

                                  <input type="text"  size="2" :value="cart.pro_quantity " style="text-align: center" disabled>

                                  <button class="btn btn-sm btn-success" @click="cartIncrement(cart.id)" > + </button>
                                  </span>

                                </td>
                                <td>
                                <span class="load_modal" v-if="buttonloadingstatus && cart.id == cartid" style="text-align: center;"> <img src="/backend/images/button_loading.gif" width="25" ></span>
                                
                                <span v-else=""> {{ cart.pro_price }}</span>

                               </td>
                                <td>
                                <span class="load_modal" v-if="buttonloadingstatus && cart.id == cartid" style="text-align: center;"> <img src="/backend/images/button_loading.gif" width="25" ></span>
                               <span v-else=""> {{ cart.sub_total }} </span>
                              </td>
                                <td><button @click.prevent="removeCartItem(cart.id)" type="button" class="btn btn-danger btn-sm">X</button></td>
                              </tr>

                            </tbody>
                          </table>

                          <hr>


                          <ul class="list-group">
                            <li class="list-group-item" v-if="loadingcartstatus"> <p style="text-align: center"><img src="/backend/images/loading.gif" ></p></li>
                            <li class="list-group-item"><span class="fleft">Total Quantity:</span> <span style="font-weight: bold;" class="fright">{{ qty }}
                           </span></li>
                            <li class="list-group-item"><span class="fleft">Sub Total:</span> <span style="font-weight: bold;" class="fright"> {{ subtotal }} ৳
                            </span></li>
                            <li class="list-group-item"><span class="fleft">Vat:</span> <span style="font-weight: bold;" class="fright">
                            {{ ((subtotal * vats.vat)/100) }} ৳ ( {{ vats.vat }} %
                          </span></li>
                            <li class="list-group-item"><span class="fleft">Total:</span> <span style="font-weight: bold;" class="fright">
                            {{ subtotal+((subtotal * vats.vat)/100) }} ৳</span>
                          </li>
                          </ul>

                          <hr>

                          <form @submit.prevent="orderNow">
                            <span for="inputAddress">Customer Name</span>
                             <select class="form-control"  v-model="customer_id">
                                    <option value="" disabled>Select Category</option>
                                    <option value="customer.id"  v-for="customer in customers">
                                    {{ customer.name }}</option>
                            </select>

                            <br>
                         
                            <span for="inputAddress">Pay</span>
                            <input type="text" class="form-control" v-model="pay" required>
                            <br>
                            <span for="inputAddress">Due</span>
                            <input type="text" class="form-control"  v-model="due" required>
                            <br>
                            <span for="inputAddress">Payment method</span>
                             <select class="form-control"  v-model="payby">
                                    <option value="HandCash" >Hand Cash</option>
                                    <option value="Check" >Check</option>
                                    <option value="GiftCard" >Gift Card</option>
                                   
                            </select>
                            <br>
                            <button class="btn btn-primary">Submit</button>

                        </form>

                   
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
                           
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-6" v-for="(product, index) in filtersearch" style=" text-align: center; margin-bottom: 1rem;"> 

                                    <a href @click.prevent="addToCart(product.id)">
                                      <div class="card" style=" min-height:11rem;">
                                          
                                            <div class="card-body">
                              
                                              <img :src="product.image"  id="card_image"><br>
                                              <small class="card-title">{{ product.product_name }}</small><br>
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
                                    <a href @click.prevent="addToCart(product.id)">
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

.nav-tabs  li.active  a, .nav-tabs li.active a:focus, .nav-tabs  li.active a:hover {
    background-color: #007bff !important;
    color: #fff;
    border: 0px solid #3F515F;
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

                form:{
                    name : "",
                    email : "",
                    phone : "",
                    address: "",
                    photo: "", /*backend/images/noimage.png*/
                },

                customer_id: "",
                pay: "",
                due: "",
                payby: "",

                errors: {},

                products: [],
                loadingstatus: true,
                imageloadingstatus: true,
                loadingcartstatus: true,
                buttonloadingstatus: false,
                cartid: 0,

                searchkey: "",
                getsearchkey: "",
                categories: {},
                getproducts: [],
                ariaselected: true,
                customers: {},
                carts: [],
                vats: '',

            }
        },

    mounted(){

        if (!User.loggedIn()) {     //check login or not
            this.$router.push({ name: '/' });
        }

        this.product();
        this.allcategory();
        this.customer();
        this.cartproduct();
        this.vat();
       
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
      },

      qty(){
           let sum=0;
           for(let i =0; i < this.carts.length; i++ ){
              sum += (parseFloat(this.carts[i].pro_quantity));
           }
           return sum;
         },

      subtotal(){
            let sum=0;
              for(let i =0; i < this.carts.length; i++){
              sum += (parseFloat(this.carts[i].pro_quantity) * parseFloat(this.carts[i].pro_price));
            }
            return sum;
         },

    },
    
    methods: {

      orderNow(){
          alert("sfsf");
      },
      vat(){
          axios.get('/api/vat')
        .then(res=>{
          this.vats = res.data;
        })
        .catch(error=>{
          console.log(error);
        })
          
      },

    //cart
      addToCart(id){
        this.buttonloadingstatus = true,
       axios.post('/api/addTocart/'+ id)
          .then(res=>{
            this.buttonloadingstatus = false
            this.cartid = id;
             this.cartproduct();
            Notification.cart_success();
          })
          .catch(error=>{
              console.log(error);
          })
      },

      cartproduct(){
        axios.get('/api/cart/product')
        .then(res=>{
          this.loadingcartstatus = false;
          this.carts = res.data;
        })
        .catch()
      },


      removeCartItem(id){
        Swal.fire({
            title: 'Are you sure to remove Item?',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, remove it!'
          }).then((result) => {
            if (result.value) {

              axios.get('/api/cart/delete/'+id)
              .then(res=>{

                //this.cartproduct(); or
                 this.carts = this.carts.filter(cart=>{
                    return cart.id !=  id
                 })
              })
              .catch(()=>{
                this.router.push({ path: '/pos'});
              })

              Swal.fire(
                'Removed!',
                'Your Product has been removed.',
                'success'
              )
            }
          })

      },


      cartIncrement(id){
        this.buttonloadingstatus = true,
          axios.post('/api/cart/increment/'+ id)
          .then(res=>{
             this.cartproduct();
            Notification.success();
            this.buttonloadingstatus = false
            this.cartid = id;
          })
          .catch(error=>{
              console.log(error);
          })
      },

      cartDecrement(id){
        this.buttonloadingstatus = true,
          axios.post('/api/cart/decrement/'+ id)
          .then(res=>{
             this.cartproduct();
            Notification.success();
            this.buttonloadingstatus = false
            this.cartid = id;
          })
          .catch(error=>{
              console.log(error);
          })
      },


      onFileSelected(event){ 
          let file = event.target.files[0]; 
         
          if (file.size > 1048770) {
            Notification.image_validation();
            /*this.form.photo = 'backend/images/noimage.png';*/
          }else{
              let reader = new FileReader();
              reader.onload = event => {
                this.form.photo = event.target.result;
                //console.log(event.target.result);
              }
              reader.readAsDataURL(file);
          }
        },


        customerInsert(){
         
          axios.post('/api/customer/',this.form)
          .then(res=>{
            /*this.$router.push({path: '/customer'});*/
            this.customer();
            $('#closeModal').click();
            Notification.success();
          })
          .catch(error=>{
           this.errors = error.response.data.errors;
          })
        },

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



   
}
</script>