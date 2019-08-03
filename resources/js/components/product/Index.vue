<template>
	<div>
		<div class="form-w3layouts">
        
        <div class="row">
            <div class="col-lg-12">
                    <section class="panel card">
                        <header class="clearfix card-hader"  style="padding: 20px 10px 20px 10px; background: #DDEDE0">
                            <span style="float: left"><h4><b>All Product List</b></h4></span>
                            <router-link to="/store-product"  style="float: right; padding-top: 10px;" type="submit" class="btn btn-primary">Add New</router-link>


                        </header>
                        <div class="panel-body">

                          
                        <span><b>Search</b> <input type="text" name="search" v-model="searchkey"></span>
                        <br><br>
                          <table border  class="table" ui-jq="footable" ui-options='{
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
                                <th data-breakpoints="xs">Code</th>
                                <th >Photo</th>
                                <th data-breakpoints="xs">Category</th>
                                <th data-breakpoints="xs">Supplier</th>                                                                          
                                <th data-breakpoints="xs">Buying Price</th>                                                                          
                                <th data-breakpoints="xs">Selling Price</th>                                                                          
                                <th data-breakpoints="xs">Quantity</th>                                                                          
                                <th data-breakpoints="xs">Root</th>                                                                          
                               <th data-breakpoints="xs sm md" data-title="DOB">Buying Date</th>
                                 <th>Action</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr v-if="loadingstatus">
                                <td colspan="7"><p style="text-align: center"><img src="/backend/images/loading.gif" ></p></td>
                              </tr>
                            </tbody>
                            <tbody>
                              <tr data-expanded="true" v-for="(product, index) in filtersearch">
                                <td>{{ index+1 }}</td>
                                <td>{{ product.product_name }}</td>
                                <td>{{ product.product_code }}</td>
                                <td><img :src="product.image" width="50" height="60"></td>
                                <td>{{ product.category.category_name }}</td>
                                <td>{{ product.supplier.name }}</td>
                                <td>{{ product.buying_price }}</td>
                                <td>{{ product.selling_price }}</td>
                                <td>{{ product.product_quantity }}</td>
                                <td>{{ product.root }}</td>
                                <td>{{ product.buying_date }}</td>
                                <td>
                                  <router-link :to="'/edit-product/'+product.id"  class="btn btn-primary btn-sm">Edit</router-link>
                                  <button @click="deleteEmployee(product.id)" type="button" class="btn btn-danger btn-sm">Delete</button></td>
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
                products: [],

                loadingstatus: true,

                searchkey: ""
            }
        },

    mounted(){

        if (!User.loggedIn()) {     //check login or not
            this.$router.push({ name: '/' });
        }

        this.product();
    },

    methods: {
      product(){
        axios.get('/api/product/')
        .then(res=>{
          this.loadingstatus = false;
          this.products = res.data;
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

              axios.delete('/api/product/'+id)
              .then(res=>{
                 this.products = this.products.filter(product=>{
                    return product.id !=  id
                 })
              })
              .catch(()=>{
                this.router.push({ path: '/product'});
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
       return this.products.filter(employee=>{
          return employee.product_name.match(this.searchkey);
        });
      }
    }


   
}
</script>