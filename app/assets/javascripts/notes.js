$(document).ready(function(){
	$('#new_note').submit( function(){
		var note = $("#note_description").val();		
		if(note == "") {
			alert('Please provide task note');
			return false;
		}
	});	
});