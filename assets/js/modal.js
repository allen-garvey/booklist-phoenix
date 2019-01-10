function hideModal(){
	document.getElementById('modal_container').style.display = 'none';
};

function showModal(){
	document.getElementById('modal_overlay').onclick = hideModal;
	document.getElementById('modal_container').style.display = '';
};

export function modalConfirm(callback, options = {}){
	const modal = document.getElementById('modal');
	modal.classList.remove('alert');
	modal.classList.add('confirm');
	document.getElementById('modal_body').innerHTML = options.modalText || "";
	const confirmButton = document.getElementById('modal_confirm_confirm');
	confirmButton.innerHTML = options.confirmButtonText || 'Delete';
	const cancelButton = document.getElementById('modal_confirm_cancel');
	cancelButton.innerHTML = options.cancelButtonText || 'Cancel';
	cancelButton.onclick = hideModal;
	confirmButton.onclick = callback;
	showModal();
};

export function modalAlert(options = {}){
	const modal = document.getElementById('modal');
	modal.classList.remove('confirm');
	modal.classList.add('alert');
	document.getElementById('modal_body').innerHTML = options.modalText || "";
	const confirmButton = document.getElementById('modal_alert_confirm');
	confirmButton.innerHTML = options.confirmButtonText || 'Ok';
	confirmButton.onclick = hideModal;
	showModal();
};