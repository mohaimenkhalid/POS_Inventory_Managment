<template>
    <div>

        <div class="form-w3layouts" style="min-height: 800px;">
        
        <div class="row">
            <div class="col-lg-12">
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0">
                            <span style="float: left"><h4><b>Add New Supplier</b></h4></span>
                            <router-link to="/supplier"  style="float: right; padding-top: 10px;" type="submit" class="btn btn-primary">View All Supplier</router-link>


                        </header>
                        <div class="panel-body">
                        
                          <form enctype="multiplart/form-data" @submit.prevent="employeeInsert">
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

                                 <div class="form-group col-md-4">
                                  <label for="inputSalary">shopname</label>
                                  <input type="text" class="form-control" v-model="form.shopname" >
                                   <small class="text-danger" v-if="errors.shopname">{{ errors.shopname[0] }}</small><br>
                                </div> 

                                <div class="form-group col-md-4">
                                  <label for="inputAddress">Address</label>
                                  <input type="text" class="form-control" v-model="form.address" >
                                   <small class="text-danger" v-if="errors.address">{{ errors.address[0] }}</small><br>
                                </div>

                                <div class="form-group col-md-4">
                                  <label for="inputPhone">Phone No</label>
                                 <input type="number" class="form-control" v-model="form.phone" >
                                   <small class="text-danger" v-if="errors.phone">{{ errors.phone[0] }}</small><br>
                                </div>
                                
                              </div>
                              
                              <div class="form-row">
                                
                                <div class="form-group col-md-4">
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
                    name : "",
                    email : "",
                    phone : "",
                    shopname: "",
                    address: "",
                    photo: "", /*backend/images/noimage.png*/
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

        employeeInsert(){
         
          axios.post('/api/supplier/',this.form)
          .then(res=>{
            this.$router.push({path: '/supplier'});
            Notification.success();
          })
          .catch(error=>{
           this.errors = error.response.data.errors;
          })
        }
    }
}
</script>