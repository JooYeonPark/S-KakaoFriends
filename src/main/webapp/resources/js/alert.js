/**
 * 
 */

function showHideAlert(obj, msg){
	obj.html(getAlert(msg));
	obj.show();
	fadeOut(obj);
}

function getAlert(msg){
	var html = 
		'<div class="alert" role="alert">'+
			'<strong>알림!</strong>'+ msg +
			'<button type="button" class="close" data-dismiss="alert" aria-label="Close" style="height:1em;">'+
				'<span>&times;</span>'+
			'</button>'+
		'</div>';
	
	return html;
}


function fadeOut(obj){
	window.setTimeout(function(){
		obj.fadeOut();
	}, 2000); 
}