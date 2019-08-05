<template>
    <div>

        <div class="form-w3layouts" style="min-height: 800px;">
        
        <div class="row">
          <div class="col-lg-3"></div>
            <div class="col-lg-6">
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0">
                            <span style="float: left"><h4><b>Add New Category</b></h4></span>
                            <router-link to="/category"  style="float: right; padding-top: 10px;" type="submit" class="btn btn-primary">View All Category</router-link>


                        </header>
                        <div class="panel-body">
                        
                          <form enctype="multiplart/form-data" @submit.prevent="employeeInsert">
                              <div class="form-row">

                                <div class="form-group col-md-6">
                                  <label for="inputName">Category Name</label>
                                  <input type="text" class="form-control" v-model="form.category_name">
                                  <small class="text-danger" v-if="errors.category_name">{{ errors.category_name[0] }}</small><br>
                                </div>
                               
                              </div>


                               
                             
                              <button type="submit" class="btn btn-primary">Submit</button>
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
                    category_name : ""
                },

                errors: {},
            }
        },

    mounted(){

        if (!User.loggedIn()) {     //check login or not
            this.$router.push({ name: '/' });
        }
    },


    methods: {
       
        employeeInsert(){
         
          axios.post('/api/category/',this.form)
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