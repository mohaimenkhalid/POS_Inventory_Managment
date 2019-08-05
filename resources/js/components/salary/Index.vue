<template>
	<div>
		<div class="form-w3layouts" style="min-height: 800px;" >
        
        <div class="row">
            <div class="col-lg-12">
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0">
                            <span style="float: left"><h4><b>All Salary Details</b></h4></span>
                           
                            

                        </header>
                        <div class="panel-body">

                          
                        <span><b>Search</b> <input type="text" name="search" v-model="searchkey"></span>
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
                                <th data-breakpoints="xs">Salary Month</th>
                                <th >Details</th>

                              </tr>
                            </thead>
                            <tbody>
                              <tr v-if="loadingstatus">
                                <td colspan="7"><p style="text-align: center"><img src="/backend/images/loading.gif" ></p></td>
                              </tr>
                            </tbody>
                            <tbody>
                              <tr data-expanded="true" v-for="(salary, index) in filtersearch">
                                <td>{{ index+1 }}</td>
                                <td>{{ salary.salary_month }}</td>
                                
                               
                                <td>
                                  <router-link :to="'/view-salary/'+salary.salary_month"  class="btn btn-primary btn-sm">View Salary</router-link>
                                </td>
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
                salaries: [],

                loadingstatus: true,

                searchkey: ""
            }
        },

    mounted(){

        if (!User.loggedIn()) {     //check login or not
            this.$router.push({ name: '/' });
        }

        this.allSalary();
    },

    methods: {
      allSalary(){
        axios.get('/api/salary/')
        .then(res=>{
          this.loadingstatus = false;
          this.salaries = res.data;
        })
        .catch()
      },
    },


    computed:{
      filtersearch(){
       return this.salaries.filter(salary=>{
          return salary.salary_month.match(this.searchkey);
        });
      }
    }


   
}
</script>