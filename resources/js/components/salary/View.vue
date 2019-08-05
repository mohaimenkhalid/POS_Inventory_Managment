<template>
	<div>
		<div class="form-w3layouts" style="min-height: 800px;">
        
        <div class="row">
            <div class="col-lg-12">
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0">
                            <span style="float: left"><h4><b>Monthly Salary Details on "{{ this.salary_month }}"</b></h4></span>
                           <router-link to="/salary"  style="float: right; padding-top: 10px;" type="submit" class="btn btn-primary">View Salary Details</router-link>
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
                                <th data-breakpoints="xs">Name</th>
                                <th >Month</th>
                                <th data-breakpoints="xs">Amount</th>                                     
                                <th data-breakpoints="xs">Date</th>                                     
                                 <th>Action</th>
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
                                <td>{{ salary.employee.name }}</td>
                                <td>{{ salary.salary_month }}</td>
                                <td>{{ salary.employee.salary }}</td>
                                <td>{{ salary.salary_date }}</td>
                                <td>
                                  <button @click="deleteSalary(salary.id)"  class="btn btn-danger btn-sm">Delete Salary</button>
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

                searchkey: "",

                salary_month: 0,
            }
        },

    mounted(){

        if (!User.loggedIn()) {     //check login or not
            this.$router.push({ name: '/' });
        }

        this.salary_month = this.$route.params.id;


        this.viewSalary();
    },

    methods: {
      viewSalary(){
        axios.get('/api/view-salary/'+this.salary_month )
        .then(res=>{
          this.loadingstatus = false;
          this.salaries = res.data;
        })
        .catch()
      },


      deleteSalary(id){

          Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
          }).then((result) => {
            if (result.value) {

              axios.get('/api/salary/delete/'+id)
              .then(res=>{
                 this.salaries = this.salaries.filter(salary=>{
                    return salary.id !=  id
                 })
              })
              .catch(()=>{
                this.router.push({ path: '/salary'});
              })

              Swal.fire(
                'Deleted!',
                'Your file has been deleted.',
                'success'
              )
            }
          })


      }
    },


    computed:{
      filtersearch(){
       return this.salaries.filter(salary=>{
          return salary.employee.name.match(this.searchkey);
        });
      }
    }


   
}
</script>