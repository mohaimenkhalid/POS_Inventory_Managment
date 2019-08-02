<template>
    <div>

        <div class="form-w3layouts">
        
        <div class="row">
            <div class="col-lg-12">
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0">
                            <span style="float: left"><h4><b>Update Employee</b></h4></span>
                            <router-link to="/employee"  style="float: right; padding-top: 10px;" type="submit" class="btn btn-primary">View All Employee</router-link>


                        </header>
                        <div class="panel-body">
                        
                          <form enctype="multiplart/form-data" @submit.prevent="employeeUpdate">
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
                                  <label for="inputSalary">Salary</label>
                                  <input type="text" class="form-control" v-model="form.salary" >
                                   <small class="text-danger" v-if="errors.salary">{{ errors.salary[0] }}</small><br>
                                </div>
                              </div>
                              <div class="form-row">

                                <div class="form-group col-md-4">
                                  <label for="inputPhone">Phone No</label>
                                 <input type="number" class="form-control" v-model="form.phone" >
                                   <small class="text-danger" v-if="errors.phone">{{ errors.phone[0] }}</small><br>
                                </div>

                                <div class="form-group col-md-4">
                                  <label for="inputNid">NID Number</label>
                                 <input type="text" class="form-control" v-model="form.nid" >
                                   <small class="text-danger" v-if="errors.nid">{{ errors.nid[0] }}</small><br>
                                </div>
                                <div class="form-group col-md-4">
                                  <label for="inputDate">Joining Date</label>
                                 <input type="date" class="form-control" v-model="form.joining_date" >
                                   <small class="text-danger" v-if="errors.joining_date">{{ errors.joining_date[0] }}</small><br>
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
                                    <img :src="form.photo" alt="No image"  height="150" >
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
                    name : "",
                    email : "",
                    phone : "",
                    salary: "",
                    address: "",
                    nid: "",
                    joining_date: "",
                    photo: "", /*backend/images/noimage.png*/
                },

                employee_id: 0,
                errors: {},
            }
        },

        mounted(){

	        if (!User.loggedIn()) {     //check login or not
	            this.$router.push({ name: '/' });
	        }

        	this.employee_id = this.$route.params.id;
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
        		axios.get('/api/employee/'+this.employee_id)
        		.then(res=>{
        			this.form = res.data;
        		})
        		.catch(error=>{
        			console.log('error')
        		})
        },

        employeeUpdate(){
         
          axios.patch('/api/employee/'+this.employee_id,this.form)
          .then(res=>{
            this.$router.push({path: '/employee'});
            Notification.success();
          })
          .catch(error=>{
           this.errors = error.response.data.errors;
          })
        }
    }
    
}
</script>