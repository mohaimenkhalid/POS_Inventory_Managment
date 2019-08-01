class Notification{

		success(){
			new Noty({
			    type: 'success',
				layout: 'topRight',
			    text: 'Successfully Done!',
			    timeout: 1000,
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

		error(){
			new Noty({
			    type: 'warning',
				layout: 'topRight',
			    text: 'Ops! Something wtong',
			    timeout: 1000,
			}).show();
		}
}

export default Notification = new Notification();