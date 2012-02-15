$(function () {

    $('.fileupload-content').append('<div id="loading"></div>');

    var inputs = $('#new_picture :input[type=text]');
    
    clearFields(inputs);
    
    function clearFields (inputs) {
      $('.ui-state-error-text').remove();
      $.each(inputs, function(index, field){
        $(field).focus(function(){
          $(field).removeClass("ui-state-error");
          $(field).next().remove();
        });
      });
    };
  
    // Initialize the jQuery File Upload widget:
    $('#fileupload').fileupload({
      maxNumberOfFiles: 150,
      autoUpload: true,
      acceptFileTypes: /\.(jpg|jpeg|gif|png|JPG|JPEG|GIF|PNG)$/
    });
    
    // 
    // Load existing files:
    $.getJSON($('#fileupload form').prop('action'), function (files) {
            $(".best_in_place").best_in_place();
            Shadowbox.init();
            $('#loading').hide();
    });

    // Open download dialogs via iframes,
    // to prevent aborting current uploads:
    $('#fileupload .files a:not([target^=_blank])').live('click', function (e) {
        e.preventDefault();
        $('<iframe style="display:none;"></iframe>')
            .prop('src', this.href)
            .appendTo('body');
    });
    
    
    $('#fileupload').bind('fileuploadprogressall', function (e,data) {
      var progress = parseInt(data.loaded / data.total * 100, 10);
      //$('.progress-bar').find('div').css('width',  progress + '%').find('span').html(progress + '%');
      console.info(progress);
    });

	$('#fileupload')
		.bind('fileuploadstop', function (e, data) {
				var path = $('#redirect_path').html();
				window.location.assign(path);	
		});

});