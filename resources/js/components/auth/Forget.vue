<template>
	<div>
		<div class="w3layouts-main">
	<h2>Forget Password</h2>
		<form action="#" method="post">
			<input type="email" class="ggg" name="Email" placeholder="Existing Email Address" v-model="form.email">
				<div class="clearfix"></div>
				<input type="submit" value="Submit" name="login">
		</form>
		<p><router-link to="/"> Back to Login </router-link></p>

</div>

	</div>
</template>

<script>

export default{

	name: 'Login',

	data(){
		return{

			form: {
				email: ""
			
			},

			errors: {},
		}
	},

	mounted(){

		if (User.loggedIn()) { 	//check login or not
			this.$router.push({ name: 'home' });
		}

	},



}

	
</script>