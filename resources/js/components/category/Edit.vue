<template>
    <div>

        <div class="form-w3layouts" style="min-height: 800px;">
        
        <div class="row">
           <div class="col-lg-3"></div>
            <div class="col-lg-6">
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0">
                            <span style="float: left"><h4><b>Update category</b></h4></span>
                            <router-link to="/category"  style="float: right; padding-top: 10px;" type="submit" class="btn btn-primary">View All category</router-link>


                        </header>
                        <div class="panel-body">
                        
                          <form enctype="multiplart/form-data" @submit.prevent="categoryUpdate">
                              <div class="form-row">
                                <div class="form-group col-md-6">
                                  <label for="inputName">Category Name</label>
                                  <input type="text" class="form-control" v-model="form.category_name">
                                  <small class="text-danger" v-if="errors.category_name">{{ errors.category_name[0] }}</small><br>
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


<script type="text/javascript">
    export default{
    	name: 'Edit',
        data(){
            return{
                form:{
                    category_name : "",
                   
                },

                category_id: 0,
                errors: {},
            }
        },

        mounted(){

	        if (!User.loggedIn()) {     //check login or not
	            this.$router.push({ name: '/' });
	        }

        	this.category_id = this.$route.params.id;
        	this.clickedEmpoyee();

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
                this.form.photo = event.target.result;
                //console.log(event.target.result);
              }
              reader.readAsDataURL(file);
          }
        },

        clickedEmpoyee(){
        		axios.get('/api/category/'+this.category_id)
        		.then(res=>{
        			this.form = res.data;
        		})
        		.catch(error=>{
        			console.log('error')
        		})
        },

        categoryUpdate(){
         
          axios.patch('/api/category/'+this.category_id,this.form)
          .then(res=>{
            this.$router.push({path: '/category'});
            Notification.success();
          })
          .catch(error=>{
           this.errors = error.response.data.errors;
          })
        }
    }
    
}
</script>