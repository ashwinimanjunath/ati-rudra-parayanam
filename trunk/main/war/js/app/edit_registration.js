(function($) {
	$(function() {
		var $form = $("#editRegistrationForm");

		// first populate all the registration fields with proper values
		var registration = window.registration;
		for ( var property in registration) {
			var $e = $form.find("[name=" + property + "]");
			if ($e.is (":radio")) {
				$form.find("[name=" + property + "][value=" + registration[property] + "]").attr("checked", true);
			} else {
				$e.val(registration[property]);
			}
		}

		// Now update error messages if any
		var errors = window.validationErrors;
		for (var property in errors) {
			var $e = $form.find("[name=" + property + "]");
			var $errorDiv = $e.is (":radio") ? $e.parent ("div") : $e;
			$errorDiv.addClass("error").after("<div class = 'error_message'>" + errors[property] + "</div>");
		}

		// Now get the airport codes and keep them ready
		$.getJSON(window.cp + "js/airport_codes.js", function(airportCodes) {
			var airports = $.map(airportCodes, function(airportCode) {
				return airportCode.name + " (" + airportCode.code + ", " + airportCode.location + ")";
			});
			$(".port").autocomplete({
				cacheLength : 0,
				matchCase : false,
				matchContains : true,
				mustMatch : true,
				maxItemsToShow : 10,
				selectOnly : true,
				width : 500,
				source : airports,
				customFind : function(q) {
					return $.map(airports, function(airport, index) {
						if (airport.toLowerCase().indexOf(q) !== -1) {
							// We just need an array with one element, however jquery seems to be merging the array if we return an array
							// Thus we loose the original array, thus have to make it two dimensional
							return [ [ airport ] ];
						}
					});
				}
			}).removeAttr("disabled");

			$("[name=dateOfDeparture]").datepicker({
				dateFormat : "mm/dd/yy",
				defaultDate : "06/17/2012",
				maxDate : "06/22/2012",
				minDate : "04/01/2012",
				altField : "#date-of-departure-complete",
				altFormat : "DD, d MM, yy"
			}).datepicker("setDate", registration["dateOfDeparture"]);

			$("#editRegistration").show();

		});

		$("#editRegistration").click(function() {
			$form.submit();
			return false;
		});
	});
})(jQuery);