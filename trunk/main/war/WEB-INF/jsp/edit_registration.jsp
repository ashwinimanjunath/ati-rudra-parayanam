<%@page import="org.arp.arp_2012.Registration"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.arp.arp_2012.utils.RequestUtils"%>
<%@page import="java.util.Map"%>
<%@include file="/WEB-INF/jsp/common/header.jsp"%>
<%
    Registration registration = RequestUtils.registration(request);
%>
<div class="inner">
    <h2 class="heading-title">
        <span>Registration</span>
    </h2>
    <div id="content">
        <div class="content account-page">
            <div class="box-login">
                <div class="box-content fixed">
                    <div class="stitched"></div>
                    <div class="left" style="width: 100%; height: auto;">
                        <form action="<%=cp%>jsp/html/save_registration.jsp" enctype="multipart/form-data"
                            id="editRegistrationForm" method = "post">
                            <div class="formField">
                                <span class="label">E-mail Address</span>
                                <input type="text" value="" name="emailAddress" class="text" />
                            </div>
                            <div class="formField">
                                <span class="label">Date of Birth</span>
                                <input type="text" value="" name="dateOfBirth" class="text" maxlength=10 />
                                <div class="helpText">MM/DD/YYYY</div>
                            </div>
                            <div class="formField">
                                <span class="label">First Name (as in passport)</span>
                                <input type="text" value="" name="firstName" class="text" />
                            </div>
                            <div class="formField">
                                <span class="label">Last Name (as in passport)</span>
                                <input type="text" value="" name="lastName" class="text" />
                            </div>
                            <div class="formField">
                                <span class="label">Gender</span>
                                <div style="background-color: #FFF;padding: 4px;width: 20em">
                                <input type="radio" name="gender" value="MALE" />
                                Male
                                <input type="radio" name="gender" value="FEMALE" />
                                Female
                                </div>
                            </div>
                            <div class="formField">
                                <span class="label">Citizenship / Immigration Status</span>
                                <select class="select" name="immigrationStatus">
                                    <option value="CANADIAN">Canadian Citizen</option>
                                    <option value="INDIAN_CITIZEN">Indian Citizen</option>
                                    <option value="US_CITIZEN">U.S. Citizen</option>
                                    <option selected="selected" value="US_GC">U.S. Green Card Holder</option>
                                    <option>Other</option>
                                </select>
                            </div>
                            <div class="formField">
                                <div style="float: left; width: 40%">
                                    <span class="label">City of Departure</span>
                                    <input type="text" class="text port" name="cityOfDeparture" disabled="disabled"
                                        value="Loading ..."
                                    />
                                </div>
                                <div class="notes" style="float: right; width: 60%">
                                    <div class="first_line">If you are flying to/from India you will have to make
                                        your own arrangements</div>
                                    <div>
                                        with your travel agent to arrive in
                                        <strong>Kathmandu</strong>
                                        , Nepal by
                                        <strong>June/21/2012</strong>
                                        .
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>
                            <div class="formField">
                                <div style="float: left; width: 40%">
                                    <span class="label">Date of Departure</span>
                                    <input type="text" value="" name="dateOfDeparture" class="text" maxlength=4 />
                                    <div class="helpText">MM/DD/YYYY</div>
                                </div>
                                <div class="notes" style="float: right; width: 60%">
                                    <span class="label">&nbsp;</span>
                                    <span>Leaving on</span>
                                    <input type="text" class="text"
                                        style="font-size: small; background: transparent; border: none;"
                                        id="date-of-departure-complete" readonly="readonly"
                                    >
                                </div>
                                <div class="clear"></div>
                            </div>
                            <div class="formField">
                                <span class="label">City of Arrival</span>
                                <input type="text" class="text port" name="cityOfArrival" disabled="disabled"
                                    value="Loading ..."
                                />
                            </div>
                            <div class="formField">
                                <div style="float: left; width: 40%">
                                    <span class="label">
                                        <span>Physical Fitness Form</span>
<%
    if (!StringUtils.isBlank(registration.getPhysicalFitnessForm())) {
%>
                                    <a href = "http://sai-arp-2012-registration.s3-website-us-west-1.amazonaws.com/<%= RequestUtils.generatePDFFileName(registration) %>" type = "button" onclick = "return false;" target = "_blank" style = "padding-left: 100px" title = "Download your previously uploaded form"><span>Download</span></a>
<%        
    }
%>                                    
                                        
                                    </span>
                                    <input type="file" class="text port" name="physicalFitnessForm" disabled="disabled"
                                    />
                                    <a href="<%=cp%>KM12-Medical-certificate-Overseas.pdf" target="_blank"
                                        style="display: block; margin-top: 5px"
                                        title="Right Click, then click save link/target as"
                                    >Download Blank Form Here</a>
                                </div>
                                <div class="notes" style="float: right; width: 60%">
                                    <div class="first_line">This requirement is mandatory.</div>
                                    <div>We strongly believe that Swami's grace will help us accomplish this
                                        pilgrimage irrespective of our age, physical, mental and spiritual fitness. Thus
                                        please treat this as important but routine.</div>
                                </div>
                                <div class="clear"></div>
                            </div>
                            <div style='margin: 20px'>&nbsp;</div>
                            <a class="button" id="editRegistration" style="display: none">
                                <span>Save</span>
                            </a>
                        </form>
                    </div>
                    <div class="stitched"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<script type="text/javascript">
	window.validationErrors = <%= RequestUtils.json(RequestUtils.errors(request))%>;
	window.registration = <%= RequestUtils.json(registration)%>;
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
