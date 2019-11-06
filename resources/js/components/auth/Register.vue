<template>
	<div>
		<div class="w3layouts-main">
	<h2>Register Now</h2>
		<form  method="post"  @submit.prevent="signup">
			<input type="text" class="ggg" name="Name" placeholder="NAME" v-model="form.name" >
			<small class="text-danger" v-if="errors.name">{{ errors.name[0] }}</small>
			<input type="email" class="ggg" name="inputEmail" placeholder="E-MAIL" v-model="form.email" >
			<small class="text-danger" v-if="errors.email">{{ errors.email[0] }}</small>
			<input type="text" class="ggg" name="Phone" placeholder="PHONE" v-model="form.phone">
			<small class="text-danger" v-if="errors.phone">{{ errors.phone[0] }}</small>
			<input type="password" class="ggg" name="Password" placeholder="PASSWORD" v-model="form.password">
			<small class="text-danger" v-if="errors.password">{{ errors.password[0] }}</small>
			<input type="password" class="ggg" name="confirm_Password" placeholder="CONFIRM PASSWORD" v-model="form.password_confirmation">
			
			
			<div class="clearfix"></div>
			<input type="submit" value="submit" name="register">
		</form>
		<p>Already Registered.<router-link to="/">Login</router-link></p>

</div>

	</div>
</template>

<script>

export default{
	name: 'signup',

	data(){
		return{
			form: {
				name: "",
				email: "",
				phone: "",
				password: "",
				password_confirmation: "",
			},

			errors:{}

		}
	},


	mounted(){
		if (User.loggedIn()) { 	//check login or not
			this.$router.push({ name: 'home' });
		}
	},

	methods:{
		signup(){
			axios.post('/api/auth/signup', this.form)
			.then(res=>{
				User.responseAfterLogin(res);
				Toast.fire({
				  type: 'success',
				  title: 'Login in successfully'
				})
				this.$router.push({ name: 'home' });
			})
			.catch(error=>{
				console.log(error.response.data)
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