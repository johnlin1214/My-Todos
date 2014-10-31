$(document).ready(function() {
	bindEvents();
});

function bindEvents(){
	$('#add-note-button').on('submit', Server.addTodo)
}

var Server = (function(){
	function addTodo(e){
		e.preventDefault();
		$.ajax({
      url: '/notes',
      type: 'POST',
      data: $('#add-note-button').serialize()
     }).done(View.addTodoView).fail(function(){alert("Unable to add note")});
	};

	return { addTodo: addTodo }
})();

var View = (function(){
	function addTodoView(response){
		alert('in the view')
		var link = $('<a>').addClass('delete').text('Delete').on('click', Server.removeNote)
		var newLi = $('<li>').text(response.title)
												 .data('todoId', response.note_id)
												 .append(link);
		$('.notes-div').append(newLi);
	}

	return { addTodoView: addTodoView }
})();



