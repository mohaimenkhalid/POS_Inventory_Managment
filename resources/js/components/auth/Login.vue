<template>
	<div>
		<div class="w3layouts-main">
	<h2>Sign In Now</h2>
		<form action="#" method="post">
			<input type="email" class="ggg" name="Email" placeholder="E-MAIL" required="">
			<input type="password" class="ggg" name="Password" placeholder="PASSWORD" required="">
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

}

	
</script>