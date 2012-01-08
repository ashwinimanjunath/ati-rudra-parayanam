(function($) {
	$(function() {
		var $form = $("#editRegistrationForm");

		// first populate all the registration fields with proper values
		var editRegistration = window.editRegistration;
		for ( var property in editRegistration) {
			var $e = $form.find("[name=" + property + "]");
			if ($e.is (":radio")) {
				$form.find("[name=" + property + "][value=" + editRegistration[property] + "]").attr("checked", true);
			} else {
				$e.val(editRegistration[property]);
			}
		}

		// Now update error messages if any
		var errors = window.validationErrors;
		for (var property in errors) {
			var $e = $form.find("[name=" + property + "]");
			var $errorDiv = $e.is (":radio") ? $e.parent ("div") : $e;
			$errorDiv.addClass("error").after("<div class = 'error_message'>" + errors[property] + "</div>");
		}

		$("#editRegistration").click(function() {
			$form.submit ();
			return false;
		});
	});
})(jQuery);