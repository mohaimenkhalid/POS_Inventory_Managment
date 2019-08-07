<template>
	<div>
		<div class="form-w3layouts" style="min-height: 800px;">
        
        <div class="row">
            <div class="col-lg-12">
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0">
                            <span style="float: left"><h4><b>All Supplier List</b></h4></span>
                            <router-link to="/store-supplier"  style="float: right; padding-top: 10px;" type="submit" class="btn btn-primary">Add New</router-link>


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
                                <th data-breakpoints="xs">Name</th>
                                <th >Photo</th>
                                <th data-breakpoints="xs">Phone</th>
                                <th data-breakpoints="xs">Shop Name</th>                                                                          
                               <th data-breakpoints="xs sm md" data-title="DOB">Address</th>
                                 <th>Action</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-if="loadingstatus">
                                <td colspan="7"><p style="text-align: center"><img src="/backend/images/loading.gif" ></p></td>
                              </tr>
                            </tbody>
                            <tbody>
                              <tr data-expanded="true" v-for="(supplier, index) in filtersearch">
                                <td>{{ index+1 }}</td>
                                <td>{{ supplier.name }}</td>
                                <td><img :src="supplier.photo" width="100"></td>
                                <td>{{ supplier.phone }}</td>
                                <td>{{ supplier.shopname }}</td>
                                <td>{{ supplier.address }}</td>
                                <td>
                                  <router-link :to="'/edit-supplier/'+supplier.id"  class="btn btn-primary btn-sm">Edit</router-link>
                                  <button @click="deleteSupplier(supplier.id)" type="button" class="btn btn-danger btn-sm">Delete</button></td>
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
                suppliers: [],

                loadingstatus: true,

                searchkey: ""
            }
        },

    mounted(){

        if (!User.loggedIn()) {     //check login or not
            this.$router.push({ name: '/' });
        }

        this.supplier();
    },

    methods: {
      supplier(){
        axios.get('/api/supplier/')
        .then(res=>{
          this.loadingstatus = false;
          this.suppliers = res.data;
        })
        .catch()
      },

      deleteSupplier(id){

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

              axios.delete('/api/supplier/'+id)
              .then(res=>{
                 this.suppliers = this.suppliers.filter(supplier=>{
                    return supplier.id !=  id
                 })
              })
              .catch(()=>{
                this.router.push({ path: '/supplier'});
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
       return this.suppliers.filter(supplier=>{
          return supplier.name.match(this.searchkey);
        });
      }
    }


   
}
</script>