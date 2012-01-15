<%@page import="org.arp.arp_2012.Registration"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.arp.arp_2012.utils.RequestUtils"%>
<%@page import="java.util.Map"%>
<%@include file="/WEB-INF/jsp/common/header.jsp"%>
<%
	Registration registration = RequestUtils.registration(request);
%>
<div class="inner">
	<div id="content">
		<form action="<%=cp%>jsp/html/save_registration.jsp"
			enctype="multipart/form-data" id="editRegistrationForm" method="post">
			<h2 class="heading-title">
				<span>1. Registration</span>
			</h2>
<%
 	if (!StringUtils.isBlank(registration.getEmailAddress()) && !RequestUtils.hasPhysicalFitnessForm(registration)) {
 %>			
			<div class="box-login">
				<div class="box-content fixed">
					<div class = "warning_icon" style="width: 100%; padding: 5px 0px 5px 25px;color:red;margin-left: 10px;">Your registration is incomplete. Please upload the medical consent form to complete it.</div>
				</div>
			</div>
<%
 	}
%>			
			<div class="content account-page">
				<div class="box-login">
					<div class="box-content fixed">
						<div class="stitched"></div>
						<div class="left" style="width: 100%; height: auto;">
							<div class="formField">
								<span class="label">E-mail Address</span> <input type="text"
									value="" name="emailAddress" class="text" />
							</div>
							<div class="formField">
								<span class="label">Date of Birth</span> <input type="text"
									value="" name="dateOfBirth" class="text" maxlength=10 />
								<div class="helpText">MM/DD/YYYY</div>
							</div>
							<div class="formField">
								<div class="formField">
									<span class="label">Can you fluently chant Namakam ?</span>
									<div style="background-color: #FFF; padding: 4px; width: 20em">
										<input type="radio" name="canChantNamakamFluently" value="YES" />
										Yes <input type="radio" name="canChantNamakamFluently"
											value="No" /> No
									</div>
								</div>
							</div>
							<div class="formField">
								<div class="formField">
									<span class="label">Can you fluently chant Chamakam ?</span>
									<div style="background-color: #FFF; padding: 4px; width: 20em">
										<input type="radio" name="canChantChamakamFluently"
											value="YES" /> Yes <input type="radio"
											name="canChantChamakamFluently" value="No" /> No
									</div>
								</div>
							</div>
							<div class="formField">
								<span class="label">First Name (as in passport)</span> <input
									type="text" value="" name="firstName" class="text" />
							</div>
							<div class="formField">
								<span class="label">Last Name (as in passport)</span> <input
									type="text" value="" name="lastName" class="text" />
							</div>
							<div class="formField">
								<div style="float: left; width: 40%">
									<span class="label">Citizenship</span> <select id="citizenship"
										class="select" name="citizenship">
										<option value="CANADIAN">Canadian Passport Holder</option>
										<option value="INDIAN" selected="selected">Indian
											Passport Holder</option>
										<option value="US_CITIZEN">U.S. Passport Holder</option>
										<option>Other</option>
									</select>
								</div>
								<div class="notes dod" style="float: right; width: 60%"></div>
								<div class="clear"></div>
							</div>
							<div class="formField">
								<div class="formField">
									<span class="label">Are you a medical professional ?</span> <select
										class="select" name="physicianStatus">
										<option value="NURSE">Nurse</option>
										<option value="PHYSICIAN">Physician</option>
										<option value="PARAMEDICAL">Paramedical</option>
										<option value="NONE" selected="selected">No</option>
									</select>
								</div>
							</div>
							<div class="formField">
								<span class="label">Gender</span>
								<div style="background-color: #FFF; padding: 4px; width: 20em">
									<input type="radio" name="gender" value="MALE" /> Male <input
										type="radio" name="gender" value="FEMALE" /> Female
								</div>
							</div>
							<div class="formField">
								<div style="float: left; width: 40%">
									<span class="label"> <span>Medical Consent</span> <%
 	if (!StringUtils.isBlank(registration.getPhysicalFitnessForm())) {
 %> <a
										href="http://sai-arp-2012-registration.s3-website-us-west-1.amazonaws.com/<%=RequestUtils.generatePDFFileName(registration)%>"
										type="button" onclick="return false;" target="_blank"
										style="padding-left: 100px"
										title="Download your previously uploaded form"> <span>Download</span>
									</a> <%
 	}
 %>
									</span> <input type="file" class="text port"
										name="physicalFitnessForm" disabled="disabled" /> <a
										href="<%=cp%>KM12-Medical-certificate-Overseas.pdf"
										target="_blank" style="display: block; margin-top: 5px"
										title="Right Click, then click save link/target as">Download
										Blank Form Here</a>
								</div>
								<div class="notes" style="float: right; width: 60%">
									<div class="first_line">This requirement is mandatory.</div>
									<div>We strongly believe that Swami's grace will help us
										accomplish this pilgrimage irrespective of our age, physical,
										mental and spiritual fitness. Thus please treat this as
										important but routine.</div>
								</div>
								<div class="clear"></div>
							</div>
						</div>
						<div class="stitched"></div>
					</div>
				</div>
			</div>
			<h2 class="heading-title">
				<span>2. Contact Information </span>
			</h2>
			<div class="content account-page">
				<div class="box-login">
					<div class="box-content fixed">
						<div class="stitched"></div>
						<div class="left" style="width: 100%; height: auto;">
							<div class="formField">
								<span class="label">Phone Number</span> <input type="text"
									value="" name="phoneNumber" class="text" />
								<div class="helpText">A number you are most likely to be
									available at in the xxx-xxx-xxxx format.</div>
							</div>
							<div class="formField">
								<span class="label">Address</span>
								<textarea class="textarea" name="address" style="height: 4em"></textarea>
							</div>
						</div>
						<div class="stitched"></div>
					</div>
				</div>
			</div>
			<h2 class="heading-title">
				<span>3. Travel</span>
			</h2>
			<div class="content account-page">
				<div class="box-login">
					<div class="box-content fixed">
						<div class="stitched"></div>
						<div class="left" style="width: 100%; height: auto;">
							<fieldset style="margin-right: 40px; margin-bottom: 20px">
								<legend>
									<div class="formField">
										<span>Trip Type&nbsp;</span> <span
											title="Will make my own arrangements for travelling"><input
											type="radio" id="ownArrangements" name="tripType"
											value="OWN_ARRANGEMENTS" checked="checked" />Own
											arrangements</span><span
											title="Will be going directly to the pilgrimage and returning to the same city"><input
											type="radio" id="roundTrip" name="tripType"
											value="ROUND_TRIP" /> Round trip </span><span
											title="My itinerary has more than two cities"><input
											type="radio" id="multiCity" name="tripType"
											value="MULTI_CITY" /> Multi-City</span>
									</div>
								</legend>
								<div id="ownArrangements-content">
									<div class="formField">
										<span class="label">I will make my own arrangements for
											traveling and do not want to participate in group booking of
											tickets.</span>
									</div>
								</div>
								<div id="roundTrip-content">
									<div class="formField">
										<span class="label">Departure Airport</span> <input
											type="text" class="text port"
											name="roundTrip[cityOfDeparture]" disabled="disabled"
											value="" />
									</div>
									<div class="formField">
										<span class="label">Arrival Airport</span> <input type="text"
											class="text" readonly="readonly"
											name="roundTrip[cityOfArrival]"
											value="Tribhuvan International Airport (KTM, Kathmandu, Nepal)" />
									</div>
									<div class="formField">
										<div style="float: left; width: 40%">
											<span class="label">Date of Departure</span> <input
												type="text" value="" name="roundTrip[dateOfDeparture]"
												class="text datePicker" maxlength=4 />
											<div class="helpText">MM/DD/YYYY</div>
										</div>
										<div class="notes" style="float: right; width: 60%">
											<div class="dod"></div>
											<span>You are leaving on</span> <input type="text"
												class="text"
												style="font-size: small; background: transparent; border: none;"
												id="date-of-departure-complete" readonly="readonly">
										</div>
										<div class="clear"></div>
									</div>
								</div>
								<div id="multiCity-content" style="display: none">
									<div class="formField">
										<div class="notes">
											<div class="dod" style="padding: 10px"></div>
										</div>
									</div>
									<table style="width: 100%">
										<thead>
											<tr>
												<th>&nbsp;</th>
												<th>Departure Airport</th>
												<th>Arrival Airport</th>
												<th>Date of Departure</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</fieldset>
							<div class="formField">
								<div style="float: left; width: 40%">
									<span class="label">Spend Time at Prashanti Nilayam ?</span>
									<div style="background-color: #FFF; padding: 4px; width: 20em">
										<input type="radio" name="spendTimeAtPN" value="YES" /> Yes <input
											type="radio" name="spendTimeAtPN" value="No" /> No
									</div>
								</div>
								<div class="notes" style="float: right; width: 60%">
									<div>The group plans to spend time at Prashanti Nilayam
										(for at least 2 days) after the pilgrimage.</div>
									<div>We would be happy if you joined us. Would you like
										to ?</div>
								</div>
								<div class="clear"></div>
							</div>
							<div class="formField">
								<span class="label">Special Needs / Questions / Comments
								</span>
								<textarea name="comments" class="textarea"
									style="width: 95%; height: 10em"></textarea>
							</div>
						</div>
					</div>
					<div class="stitched"></div>
				</div>
			</div>
			<a class="button" id="editRegistration" style="display: none"> <span>Save</span>
			</a>
		</form>
	</div>
</div>
<script type="text/javascript">
	window.validationErrors =
<%=RequestUtils.json(RequestUtils.errors(request))%>
	;
	window.registration =
<%=RequestUtils.json(registration)%>
	;
</script>
<script type="text/javascript" src="<%=cp%>js/app/edit_registration.js"></script>
<style>
.ui-autocomplete {
	max-height: 200px;
	overflow-y: auto;
	/* prevent horizontal scrollbar */
	overflow-x: hidden;
	/* add padding to account for vertical scrollbar */
	padding-right: 20px;
}
/* IE 6 doesn't support max-height
     * we use height instead, but this forces the menu to always be this tall
     */
* html .ui-autocomplete {
	height: 200px;
}
</style>
<%@include file="/WEB-INF/jsp/common/footer.jsp"%>