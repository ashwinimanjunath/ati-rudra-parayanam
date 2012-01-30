(function($) {
	$(function() {
		var $form = $("#list");

		$("#submit").click(function() {
			$form.submit();
			return false;
		});

		$(":text").keypress(function(e) {
			if (e.which === 13) {
				$form.submit();
				return false;
			}
		});
	});
})(jQuery);