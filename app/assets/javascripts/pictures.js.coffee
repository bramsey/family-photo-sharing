$(document).ready ->
	callback = -> $('.alert-message').slideUp('medium')
	setTimeout callback, 3000