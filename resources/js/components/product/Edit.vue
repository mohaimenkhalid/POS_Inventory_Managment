<template>
    <div>

        <div class="form-w3layouts" style="min-height: 800px;"> 
        
        <div class="row">
            <div class="col-lg-12">
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0">
                            <span style="float: left"><h4><b>Update Product</b></h4></span>
                            <router-link to="/product"  style="float: right; padding-top: 10px;" type="submit" class="btn btn-primary">View All Product</router-link>


                        </header>
                        <div class="panel-body">
                        
                          <form enctype="multiplart/form-data" @submit.prevent="productUpdate">
                              <div class="form-row">
                                <div class="form-group col-md-4">
                                  <label for="inputName">Product Name</label>
                                  <input type="text" class="form-control" v-model="form.product_name">
                                  <small class="text-danger" v-if="errors.product_name">{{ errors.product_name[0] }}</small><br>
                                </div>
                                
                                <div class="form-group col-md-4">
                                  <label for="inputPassword4">Product Code</label>
                                  <input type="text" class="form-control" v-model="form.product_code" >
                                   <small class="text-danger" v-if="errors.product_code">{{ errors.product_code[0] }}</small><br>
                                </div>

                                <div class="form-group col-md-4">
                                  <label for="inputPassword4">Product Quantity</label>
                                  <input type="text" class="form-control" v-model="form.product_quantity" >
                                   <small class="text-danger" v-if="errors.product_quantity">{{ errors.product_quantity[0] }}</small><br>
                                </div>
                              </div>


                               <div class="form-row">
                                <div class="form-group col-md-4">
                                  <label for="inputAddress">Category</label>
                                  <select class="form-control" v-model="form.category_id">
                                    <option value disabled>Select Category</option>
                                    <option v-for="category in categories" :value="category.id">{{ category.category_name }}</option>
                                  </select>
                                   <small class="text-danger" v-if="errors.category_id">{{ errors.category_id[0] }}</small><br>
                                </div>
                                <div class="form-group col-md-4">
                                  <label for="inputSalary">Supplier</label>
                                  
                                  <select class="form-control" v-model="form.supplier_id">
                                    <option value disabled>Select Supplier</option>
                                    <option v-for="supplier in suppliers" :value="supplier.id">{{ supplier.name }}</option>
                                  </select>
                                   <small class="text-danger" v-if="errors.supplier_id">{{ errors.supplier_id[0] }}</small><br>
                                </div>

                                <div class="form-group col-md-4">
                                  <label for="inputSalary">Root</label>
                                  <input type="text" class="form-control" v-model="form.root" >
                                   <small class="text-danger" v-if="errors.root">{{ errors.root[0] }}</small><br>
                                </div>
                              </div>
                              <div class="form-row">

                                <div class="form-group col-md-4">
                                  <label for="inputPhone">Buying Price</label>
                                 <input type="text" class="form-control" v-model="form.buying_price" >
                                   <small class="text-danger" v-if="errors.buying_price">{{ errors.buying_price[0] }}</small><br>
                                </div>

                                <div class="form-group col-md-4">
                                  <label for="inputNid">Selling Price</label>
                                 <input type="text" class="form-control" v-model="form.selling_price" >
                                   <small class="text-danger" v-if="errors.selling_price">{{ errors.selling_price[0] }}</small><br>
                                </div>
                                <div class="form-group col-md-4">
                                  <label for="inputDate">Buying Date</label>
                                 <input type="date" class="form-control" v-model="form.buying_date" >
                                   <small class="text-danger" v-if="errors.buying_date">{{ errors.buying_date[0] }}</small><br>
                                </div>
                                
                                
                              </div>
                              <div class="form-row">
                                
                                <div class="form-group col-md-4">
                                <label for="inputPhoto">Product Image</label>
                                 <input type="file" class="custom-file-input" id="inputGroupFile04" @change="onFileSelected" >
                                <label class="custom-file-label" for="inputGroupFile04" >Choose file</label>
                                <!-- <small class="text-danger" v-if="errors.photo">{{ errors.photo[0] }}</small><br> -->
                                </div>
                                
                              </div>

                              <div class="form-row">
                                
                                <div class="form-group col-md-4">
                                    <img :src="form.image" alt="No image Selected"  height="150" width="100" >
                                </div>
                              </div>
                             
                              <button type="submit" class="btn btn-primary">Update</button>
                            </form>
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
                form:{
                    product_name : "",
                    product_code : "",
                    category_id : "",
                    supplier_id: "",
                    root: "",
                    buying_price: "",
                    selling_price: "",
                    buying_date: "",
                    product_quantity: "",
                    image: "",
                    
                },

                errors: {},
                categories: {},
                suppliers: {},
            }
        },

    mounted(){

        if (!User.loggedIn()) {     //check login or not
            this.$router.push({ name: '/' });
        }

        this.product_id = this.$route.params.id;
        this.clickedEmpoyee();

        this.allcategory()
        this.allsupplier()

        
    },


    methods: {
        onFileSelected(event){ 
          let file = event.target.files[0]; 
         
          if (file.size > 1048770) {
            Notification.image_validation();
            /*this.form.photo = 'backend/images/noimage.png';*/
          }else{
              let reader = new FileReader();
              reader.onload = event => {
                this.form.image = event.target.result;
                //console.log(event.target.result);
              }
              reader.readAsDataURL(file);
          }
        },

        allcategory(){
          axios.get('/api/category/')
          .then(res=>{
            this.categories = res.data;
          })
          .catch()
        },

        allsupplier(){
        axios.get('/api/supplier/')
        .then(res=>{
          this.suppliers = res.data;
        })
        .catch()
      },

      clickedEmpoyee(){
            axios.get('/api/product/'+this.product_id)
            .then(res=>{
             
              this.form = res.data;
            })
            .catch(error=>{
              console.log('error')
            })
        },

         productUpdate(){
         
          axios.patch('/api/product/'+this.product_id,this.form)
          .then(res=>{
            this.$router.push({path: '/product'});
            Notification.success();
          })
          .catch(error=>{
           this.errors = error.response.data.errors;
          })
        }
    }
}
</script>