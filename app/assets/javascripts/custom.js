$(document).on('ready page:load', function() {
  window['rangy'].initialized = false
	load_common_proc();
	validations_on_demand();
});

function load_common_proc() {
	$('.wysihtml5').each(function(i, elem) {
    $(elem).wysihtml5({
			locale: "zh-CN",
			size: "sm"
		});
  });
}

function validations_on_demand() {
	if ($('form').length == 0)
		return;

	$.validator.addMethod("mobile", function(value, element) {
    return this.optional(element) || _validate_mobile(value);
  }, "非法手机号码");
	
	_jquery_validate('#new_user', {
		"user[email]": { email: true },
		"user[mobile]": { mobile: true }
	}, {
		"user[email]": { email: "邮箱格式不正确" },
		"user[mobile]": { mobile: "手机格式不正确" }
	});
}


/**
 * internal methods
 */
function _jquery_validate(selector, rules, messages) {
	$(selector).validate({
		ignore: ':not(select:hidden, input:visible, textarea:visible)',
    debug: true,
		rules: rules,
    messages: messages,
    highlight: function(element) {
      fg = $(element).closest('.form-group');
      fg.removeClass('has-success');
      fg.addClass('has-error');
			$(element).siblings('.form-control-feedback').remove();
			$(element).after('<span class="form-control-feedback glyphicon glyphicon-remove" style="display: block"></span>');
    },
    unhighlight: function(element) {
			if ($(element).val() == "") {
				$(element).siblings('.form-control-feedback').remove();
				fg = $(element).closest('.form-group');
				fg.removeClass('has-error');
				fg.removeClass('has-success');
				$(element).closest('.validate-message').remove();
				$(element).siblings('.validate-message').remove();
			}
    },
    success: function(element) {
			if ($(element).siblings('.form-control-feedback').length == 0) {
				$(element).after('<span class="form-control-feedback glyphicon glyphicon-ok" style="display: block"></span>');
			} else {
				$(element).siblings('.form-control-feedback').removeClass('glyphicon-remove').addClass('glyphicon-ok');	
			}
      fg = $(element).closest('.form-group');
			fg.removeClass('has-error');
			fg.addClass('has-success');
      $(element).closest('.validate-message').remove();
			$(element).siblings('.validate-message').remove();
		},
		errorElement: 'span',
		errorClass: 'validate-error validate-message',
		errorPlacement: function(error, element) {
			if ($(element).parent().attr("class") == "input-group") {
				error.insertAfter($(element).closest(".input-group"));
			}	else if ($(element).next("div.bootstrap-select").length != 0) {
				error.insertAfter($(element).next("div.bootstrap-select")[0]);
			} else {
				error.insertAfter($(element));
			}
		},
    submitHandler: function(form) {
      form.submit();
    }
	});
}


function _validate_mobile(value) {
	var resp = "";
	$.getJSON('http://tcc.taobao.com/cc/json/mobile_tel_segment.htm?callback=?&tel=' + value, function(data) { console.log(data); resp = data; });
	while(1) {
		__sleep(1000, function() {});
		if (resp != "") {
			break;
		}
	}
	if (resp && resp.telString) {
		return true;
	}
	return false;
}

function __sleep(milliseconds, cb) {
	setTimeout(function() { cb(); }, milliseconds);
}
