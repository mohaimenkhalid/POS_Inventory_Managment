<template>
    <div>

        <div class="form-w3layouts" style="min-height: 800px;">
        
        <div class="row">
            <div class="col-lg-12">
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0">
                            <span style="float: left"><h4><b>Product Update Stock</b></h4></span>
                            <router-link to="/stock"  style="float: right; padding-top: 10px;" type="submit" class="btn btn-primary">View Stock</router-link>


                        </header>
                        <div class="panel-body">
                        
                          <form  @submit.prevent="productStockUpdate">
                              
                               <div class="form-row">
                                <div class="form-group col-md-4">
                                  <label for="inputName">Product Name</label>
                                  <input type="text" class="form-control" v-model="form.product_name" disabled>
                                  <small class="text-danger" v-if="errors.product_name">{{ errors.product_name[0] }}</small><br>
                                </div>
                              
                              </div>

                              <div class="form-row">
                                <div class="form-group col-md-4">
                                  <label for="inputName">Product Code</label>
                                  <input type="text" class="form-control" v-model="form.product_code" disabled>
                                  <small class="text-danger" v-if="errors.product_code">{{ errors.product_code[0] }}</small><br>
                                </div>
                                
                               
                              </div>

                               <div class="form-row">
                               
                                <div class="form-group col-md-4">
                                  <label for="inputPassword4">Product Stock</label>
                                  <input type="text" class="form-control" v-model="form.product_quantity" >
                                   <small class="text-danger" v-if="errors.product_quantity">{{ errors.product_quantity[0] }}</small><br>
                                </div>
                              </div>

                            
                              <div class="form-row">
                                
                                <div class="form-group col-md-4">
                                    <img :src="form.image" alt="No image Selected"  height="150" width="100" >
                                </div>
                              </div>
                             
                              <button type="submit" class="btn btn-primary">Update Stock</button>
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

        
    },


    methods: {
        

      
      clickedEmpoyee(){
            axios.get('/api/product/'+this.product_id)
            .then(res=>{
             
              this.form = res.data;
            })
            .catch(error=>{
              console.log('error')
            })
        },

         productStockUpdate(){
         
          axios.post('/api/stock/update/'+this.product_id,this.form)
          .then(res=>{
            this.$router.push({path: '/stock'});
            Notification.success();
          })
          .catch(error=>{
           this.errors = error.response.data.errors;
          })
        }
    }
}
</script>