<template>
	
</template>

<script>

export default{

mounted(){

	localStorage.removeItem("token");
	localStorage.removeItem("user");
	this.$router.push({ name : '/' });
	Toast.fire({
		type: 'success',
		title: 'Logout Successfully!!'
	})
	}
}
	
</script>