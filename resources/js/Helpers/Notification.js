class Notification{

		success(){
			new Noty({
			    type: 'success',
				layout: 'topRight',
			    text: 'Successfully Done!',
			    timeout: 3000,
			}).show();
		}

		alert(){
			new Noty({				
			    type: 'alert',
				layout: 'topRight',
			    text: 'Successfully Done !',
			    timeout: 1000,
			}).show();
		}

		error(){
			new Noty({
			    type: 'error',
				layout: 'topRight',
			    text: 'Something went wrong!',
			    timeout: 1000,
			}).show();
		}

		warning(){
			new Noty({
			    type: 'warning',
				layout: 'topRight',
			    text: 'Ops! Something wtong',
			    timeout: 1000,
			}).show();
		}


		image_validation(){
			new Noty({
			    type: 'error',
				layout: 'topRight',
			    text: 'Ops! Upload Image less then 1mb',
			    timeout: 3000,
			}).show();
		}
}

export default Notification = new Notification();