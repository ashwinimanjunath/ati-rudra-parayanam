(function($) {
	$(function() {
		// Create the rows for multiple values
		var html = [];
		for ( var i = 0; i < 9; ++i) {
			html.push('<tr><td width="10px" style="font-size: 1.2em;">');
			html.push(i + 1);
			html.push('.</td><td><div class="formField"><input type="text" class="text port" name="multiCityFlightLegs[');
			html.push(i);
			html.push('][cityOfDeparture]" disabled="disabled" value=""/></div></td>');
			html.push('<td><div class="formField"><input type="text" class="text port" name="multiCityFlightLegs[');
			html.push(i);
			html.push('][cityOfArrival]" disabled="disabled" value=""/></div></td>');
			html.push('<td><div class="formField"><input type="text" style="width: 10em" class = "text datePicker" value="" name="multiCityFlightLegs[');
			html.push(i);
			html.push('][dateOfDeparture]" class="text" maxlength="10"/>');
			html.push('</div></td></tr>');
		}
		$("#multiCity-content tbody").html(html.join(""));

		$("#multiCity, #roundTrip").change(function() {
			$("#multiCity-content, #roundTrip-content").hide();
			var contentId = "#" + $(this).attr("id") + "-content";
			$(contentId).show();
		});

		var $form = $("#editRegistrationForm");

		// first populate all the registration fields with proper values
		var registration = window.registration;

		var setSimpleValue = function(property, value) {
			var $e = $form.find("[name='" + property + "']");
			if ($e.is(":radio")) {
				$form.find("[name='" + property + "'][value='" + value + "']").attr("checked", true).change ();
			} else {
				$e.val(value);
			}
		};


		var setValuesUsing = function(obj, propertyPrefix) {
			for (var property in obj) {
				var value = obj[property];
				if ($.isArray(value)) {
					$.each(value, function(index, arrayValue) {
						if (propertyPrefix) {
							setValuesUsing(arrayValue, propertyPrefix + "[" + property + "]" + "[" + index + "]");
						} else {
							setValuesUsing(arrayValue, property + "[" + index + "]");
						}
					});
				} else if ($.isPlainObject(value)) {
					if (propertyPrefix) {
						setValuesUsing(value, propertyPrefix + "[" + property + "]");
					} else {
						setValuesUsing(value, property);
					}
				} else {
					if (propertyPrefix) {
						setSimpleValue(propertyPrefix + "[" + property + "]", value);
					} else {
						setSimpleValue(property, value);
					}
				}
			}
		};
		
		setValuesUsing (registration);

		// Now update error messages if any
		var errors = window.validationErrors;
		for ( var property in errors) {
			var $e = $form.find("[name='" + property + "']");
			var $errorDiv = $e.is(":radio") ? $e.parent("div") : $e;
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

			$(".datePicker").datepicker({
				dateFormat : "mm/dd/yy",
				defaultDate : "06/17/2012",
				maxDate : "07/31/2012",
				minDate : "04/01/2012",
				altField : "#date-of-departure-complete",
				altFormat : "DD, d MM, yy"
			});

			$("#editRegistration").show();

		});

		$("#editRegistration").click(function() {
			$form.submit();
			return false;
		});

		$("#citizenship").change(
				function() {
					var $this = $(this);
					var value = $this.val();
					var $notes = $(".dod");
					var notes = "";
					if (value === "INDIAN") {
						notes = [ '<div class="first_line">Please plan to <strong>arrive in New Delhi, India by Tuesday, the 19th of June</strong></div>',
								'<div>Tibetian and Chinese VISAs will be issued in New Delhi on Wednesday the 20th of June.</div>', '<div>You will then be flown to Kathmandu, Nepal on Thursday the 21st of June</div>' ]
								.join("");
					} else if (value === "US_CITIZEN" || value === "CANADIAN") {
						notes = [ '<div class="first_line">Please plan to <strong>arrive in Kathmandu, Nepal by 21st of June</strong></div>',
								'<div>Please carry <strong>40 USD in cash</strong> for the Nepalese VISA.</div>',
								'<div>Tibetian and Chinese VISAs will be issued in Kathmandu on the 22nd of June</div>' ].join("");
					}

					$notes.html(notes);
				}).change();
	});
})(jQuery);