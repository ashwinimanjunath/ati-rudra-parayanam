(function($) {
	$(function() {
		$("#editRegistration").click(function() {
			$("#editRegistrationForm").ajaxSubmit({
				url : window.cp + "jsp/json/register_new_return_submit.jsp",
				dataType : "json",
				type : "post",
				beforeSubmit : function() {
					$("#editRegistrationForm").find(".error").removeClass("error").end().find(".error_message").remove();
				},
				success : function(response) {
					if (response.success) {
						window.location.href = window.cp + "success.jsp";
					} else {
						var $form = $("#editRegistrationForm");
						var errors = response.errors;
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