# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$(document).ready ->
	hide_comments()


$('.show_comment').live 'click', () ->
	show_comment = $(this).closest('.action')
	$(show_comment).hide()
	$(show_comment).siblings('.comment').slideDown(300)
	
	callback = -> $('#pictures').masonry( 'reload' )
	setTimeout callback, 300
	
	return false
	

hide_comments = () ->
	comment_blocks = $('.comments')
	
	collapse_comments(comment_block) for comment_block in comment_blocks
	

collapse_comments = (comment_block) ->
	comments = $(comment_block).children('.comment')
	
	count = comments.length
	if count > 2
		$(comment).hide() for comment in comments[2...count]
		$(comment_block)
			.append(
				"<div class='action'><p><a href='#' class='show_comment'>Show all " + count + " comments</a></p></div>");