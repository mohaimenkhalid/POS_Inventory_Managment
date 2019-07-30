<template>
	<div>
		<div class="w3layouts-main">
	<h2>Register Now</h2>
		<form action="#" method="post">
			<input type="text" class="ggg" name="Name" placeholder="NAME" required="">
			<input type="email" class="ggg" name="Email" placeholder="E-MAIL" required="">
			<input type="text" class="ggg" name="Phone" placeholder="PHONE" required="">
			<input type="password" class="ggg" name="Password" placeholder="PASSWORD" required="">
			<input type="password" class="ggg" name="confirm_Password" placeholder="CONFIRM PASSWORD" required="">
			
			
				<div class="clearfix"></div>
				<input type="submit" value="submit" name="register">
		</form>
		<p>Already Registered.<router-link to="/">Login</router-link></p>

</div>

	</div>
</template>

<script>

export default{

}

	
</script>