$(document).on('ready page:load', function(){
  window['rangy'].initialized = false
	$('.wysihtml5').each(function(i, elem) {
    $(elem).wysihtml5({
			locale: "zh-CN",
			size: "sm"
		});
  });
});
