<template>
	<div>
		<div class="w3layouts-main">
	<h2>Sign In Now</h2>
		<form  method="post" @submit.prevent="login">
			<input type="email" class="ggg" name="Email" id="inputEmail" placeholder="E-MAIL"  v-model="form.email">
			<small class="text-danger" v-if="errors.email">{{ errors.email[0] }}</small>
			<input type="password" class="ggg" id="password" name="password"  placeholder="PASSWORD" v-model="form.password">
			<small class="text-danger" v-if="errors.password">{{ errors.password[0] }}</small><br>
			<router-link to="/forget-password"> Forgot Password?</router-link>
			
				<div class="clearfix"></div>
				<input type="submit" value="Sign In" name="login">
		</form>
		<p>Don't Have an Account ?<router-link to="/register">Create an account</router-link></p>
</div>

	</div>
</template>

<script>

export default{

	name: 'Login',

	data(){
		return{

			form: {
				email: "", 
				password: "" 
			},

			errors: {},
		}
	},

	mounted(){

		if (User.loggedIn()) { 	//check login or not
			this.$router.push({ name: 'home' });
		}

	},

	methods:{
		login(){
			axios.post('/api/auth/login', this.form)
			.then(res=>{
				User.responseAfterLogin(res);
				Toast.fire({
				  type: 'success',
				  title: 'Login in successfully'
				})
				this.$router.push({ name: 'home' });
			})
			.catch(error=>{
				this.errors = error.response.data.errors;

				Toast.fire({
				  type: 'error',
				  title: 'Username or Password Invalid!!'
				})
			})
		}
	}


}

	
</script>