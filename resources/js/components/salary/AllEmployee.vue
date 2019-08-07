<template>
	<div>
		<div class="form-w3layouts" style="min-height: 800px;" >
        
        <div class="row">
            <div class="col-lg-12">
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0">
                            <span style="float: left"><h4><b>Employee Salary List</b></h4></span>
                           
                            <router-link to="/salary"  style="float: right; padding-top: 10px;" type="submit" class="btn btn-primary">View Salary Details</router-link>

                        </header>
                        <div class="panel-body">

                          
                        <span><b>Search</b> <input type="text" name="search" v-model="searchkey"></span>
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
                                <th >Photo</th>
                                <th data-breakpoints="xs">Phone</th>
                                <th data-breakpoints="xs">Salary</th>                                                                     
                                 <th>Action</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-if="loadingstatus">
                                <td colspan="7"><p style="text-align: center"><img src="/backend/images/loading.gif" ></p></td>
                              </tr>
                            </tbody>
                            <tbody>
                              <tr data-expanded="true" v-for="(employee, index) in filtersearch">
                                <td>{{ index+1 }}</td>
                                <td>{{ employee.name }}</td>
                                <td><img :src="employee.photo" width="100"></td>
                                <td>{{ employee.phone }}</td>
                                <td>{{ employee.salary }}</td>
                               
                                <td>
                                  <router-link :to="'/pay/salary/'+employee.id"  class="btn btn-primary btn-sm">Pay Salary</router-link>
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
                employees: [],

                loadingstatus: true,

                searchkey: ""
            }
        },

    mounted(){

        if (!User.loggedIn()) {     //check login or not
            this.$router.push({ name: '/' });
        }

        this.employee();
    },

    methods: {
      employee(){
        axios.get('/api/employee/')
        .then(res=>{
          this.loadingstatus = false;
          this.employees = res.data;
        })
        .catch()
      },
    },


    computed:{
      filtersearch(){
       return this.employees.filter(employee=>{
          return employee.name.match(this.searchkey);
        });
      }
    }


   
}
</script>