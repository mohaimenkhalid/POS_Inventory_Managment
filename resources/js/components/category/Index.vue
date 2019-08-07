<template>
	<div>
		<div class="form-w3layouts" style="min-height: 800px;">
        
        <div class="row">
           <div class="col-lg-2"></div>
            <div class="col-lg-8">
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0">
                            <span style="float: left"><h4><b>All Category List</b></h4></span>
                            <router-link to="/store-category"  style="float: right; padding-top: 10px;" type="submit" class="btn btn-primary">Add New</router-link>


                        </header>
                        <div class="panel-body">

                          
                        <span><b>Search</b> <input type="text" name="search" v-model="searchkey"></span><br><br>
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
                                <th data-breakpoints="xs">Category Name</th>
                      
                                 <th>Action</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-if="loadingstatus">
                                <td colspan="7"><p style="text-align: center"><img src="/backend/images/loading.gif" ></p></td>
                              </tr>
                            </tbody>
                            <tbody>
                              <tr data-expanded="true" v-for="(category, index) in filtersearch">
                                <td>{{ index+1 }}</td>
                                <td>{{ category.category_name }}</td>
                                
                                <td>
                                  <router-link :to="'/edit-category/'+category.id"  class="btn btn-primary btn-sm">Edit</router-link>
                                  <button @click="deleteEmployee(category.id)" type="button" class="btn btn-danger btn-sm">Delete</button></td>
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
                categorys: [],
                loadingstatus: true,
                searchkey: ""
            }
        },

    mounted(){

        if (!User.loggedIn()) {     //check login or not
            this.$router.push({ name: '/' });
        }

        this.category();
    },

    methods: {
      category(){
        axios.get('/api/category/')
        .then(res=>{
          this.loadingstatus = false;
          this.categorys = res.data;
        })
        .catch()
      },

      deleteEmployee(id){

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

              axios.delete('/api/category/'+id)
              .then(res=>{
                 this.categorys = this.categorys.filter(category=>{
                    return category.id !=  id
                 })
              })
              .catch(()=>{
                this.router.push({ path: '/category'});
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
       return this.categorys.filter(category=>{
          return category.category_name.match(this.searchkey);
        });
      }
    }


   
}
</script>