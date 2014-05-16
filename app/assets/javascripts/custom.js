$(document).on('page:load', function(){
  window['rangy'].initialized = false
});

$(document).ready(function(){

  $('.wysihtml5').each(function(i, elem) {
    $(elem).wysihtml5({
			locale: "zh-CN",
			size: "sm"
		});
  });

});
