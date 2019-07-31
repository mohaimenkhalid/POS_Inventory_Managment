<template>
	<div>
		<div class="w3layouts-main">
	<h2>Sign In Now</h2>
		<form  method="post" @submit.prevent="login">
			<input type="email" class="ggg" name="Email" placeholder="E-MAIL" required="" v-model="form.email">
			<input type="password" class="ggg" name="Password" placeholder="PASSWORD" required="" v-model="form.password">
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
			}
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
				//console.log(res.data)
				User.responseAfterLogin(res);
				this.$router.push({ name: 'home' });
			})
			.catch(error=>{
				console.log(error.response.data)
			})
		}
	}


}

	
</script>