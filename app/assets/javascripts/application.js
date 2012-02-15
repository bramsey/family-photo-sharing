// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap
//= require best_in_place
//= require jquery.masonry.min
//= require_tree .

$(document).ready(function() {
	var $container = $('#pictures');

	$container.imagesLoaded( function(){
	  $container.masonry({
	    itemSelector : '.picture'
	  });
	});
	
	$('#users').imagesLoaded( function(){
	  $('#users').masonry({
	    itemSelector : '.user'
	  });
	});
});