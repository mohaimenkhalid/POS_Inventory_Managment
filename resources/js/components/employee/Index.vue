<template>
	<div>
		<div class="form-w3layouts">
        
        <div class="row">
            <div class="col-lg-12">
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0">
                            <span style="float: left"><h4><b>All Employee List</b></h4></span>
                            <router-link to="/store-employee"  style="float: right; padding-top: 10px;" type="submit" class="btn btn-primary">Add Employee</router-link>


                        </header>
                        <div class="panel-body">

                          
                        <span><b>Search</b> <input type="text" name="search" v-model="searchkey"></span>
                          <table  class="table" ui-jq="footable" ui-options='{
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
                               <th data-breakpoints="xs sm md" data-title="DOB">Joining Date</th>
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
                                <td><img :src="employee.photo" width="150"></td>
                                <td>{{ employee.phone }}</td>
                                <td>{{ employee.salary }}</td>
                                <td>{{ employee.joining_date }}</td>
                                <td>
                                  <button type="button" class="btn btn-primary btn-sm">Edit</button>
                                  <button type="button" class="btn btn-danger btn-sm">Delete</button></td>
                              </tr>
                              
                            </tbody>
                          </table>

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
      }
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