<template>
    <div>

        <div class="form-w3layouts" style="min-height: 800px;">
        
        <div class="row">
          <div class="col-lg-2"></div>
            <div class="col-lg-8">
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0">
                            <span style="float: left"><h4><b>Pay Employee Salary</b></h4></span>
                            <router-link to="/employee"  style="float: right; padding-top: 10px;" type="submit" class="btn btn-primary">View All Employee</router-link>


                        </header>
                        <div class="panel-body">
                        
                          <form @submit.prevent="salaryPaid" >
                              <div class="form-row">
                                <div class="form-group col-md-6">
                                  <label for="inputName">Employee Name</label>
                                  <input type="text" class="form-control" v-model="form.name" disabled> 
                                  <small class="text-danger" v-if="errors.name">{{ errors.name[0] }}</small><br>
                                </div>
                                <div class="form-group col-md-6">
                                  <label for="inputPassword4">Email Address</label>
                                  <input type="Email" class="form-control" v-model="form.email"  disabled>
                                   <small class="text-danger" v-if="errors.email">{{ errors.email[0] }}</small><br>
                                </div>
                              </div>


                               <div class="form-row">
                                <div class="form-group col-md-6">
                                  <label for="inputAddress">Month</label>
                                  <select class="form-control" v-model="form.month">
                                    <option value disabled >Select a Month</option>
                                    <option value="January">January</option>
                                    <option value="February">February</option>
                                    <option value="March">March</option>
                                    <option value="April">April</option>
                                    <option value="May">May</option>
                                    <option value="June">June</option>
                                    <option value="July">July</option>
                                    <option value="August">August</option>
                                    <option value="Septembar">Septembar</option>
                                    <option value="October">October</option>
                                    <option value="November">November</option>
                                    <option value="December">December</option>
                                  </select>
                                   <small class="text-danger" v-if="errors.month">{{ errors.month[0] }}</small><br>
                                </div>
                                <div class="form-group col-md-6">
                                  <label for="inputSalary">Salary</label>
                                  <input type="text" class="form-control" v-model="form.salary" disabled>
                                   <small class="text-danger" v-if="errors.salary">{{ errors.salary[0] }}</small><br>
                                </div>
                              </div>

                             
                              <button type="submit" class="btn btn-primary">Pay Now</button>
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
                    salary: "",
                    month: "", /*backend/images/noimage.png*/
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
      

        clickedEmpoyee(){
        		axios.get('/api/employee/'+this.employee_id)
        		.then(res=>{
        			this.form = res.data;
        		})
        		.catch(error=>{
        			console.log('error')
        		})
        },

        salaryPaid(){
         
          axios.post('/api/salary/paid/'+this.employee_id,this.form)
          .then(res=>{
            this.$router.push({path: '/given-salary'});
            Notification.success();
          })
          .catch(error=>{
           this.errors = error.response.data.errors;
          })
        }
    }
    
}
</script>