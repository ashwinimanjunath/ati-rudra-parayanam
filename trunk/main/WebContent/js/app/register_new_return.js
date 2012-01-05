(function($) {
	$(function() {
		$("#editRegistration").click(function() {
			$("#editRegistrationForm").ajaxSubmit({
				url : "register_new_return_submit.jsp",
				dataType : "json",
				type : "post",
				beforeSubmit : function() {
					$("#editRegistrationForm").find(".error").removeClass("error").end().find(".error_message").remove();
				},
				success : function(response) {
					if (response.success) {
						if (response.url) {
							window.location = response.url;
						} else {
							console.error("Uh-oh do not know what to do, response was sucessful but no url specified.");
						}
					} else {
						var $form = $("#editRegistrationForm");
						var errors = response.errors;
						debugger;
						for ( var key in errors) {
							$form.find("[name=" + key + "]").addClass("error").after("<div class = 'error_message'>" + errors[key] + "</div>");
						}
					}
				}
			});

			return false;
		});
	});
})(jQuery);