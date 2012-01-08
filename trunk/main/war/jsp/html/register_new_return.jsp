<%@page import="org.arp.arp_2012.utils.RequestUtils"%>
<%@include file="/WEB-INF/jsp/common/header.jsp" %>
<div class="inner">
    <h2 class="heading-title">
        <span>Register for Kailash Yatra 2012</span>
    </h2>
    <div id="content">
        <div class="content account-page">
            <div class="box-login">
                <div class="box-content fixed">
                    <div class="stitched"></div>
                    <div class="left">
                        <h6>New Registration</h6>
                        <p>Registration is mandatory for every devotee. However please note that registration is not
                            a reservation. You application will be carefully reviewed for accuracy and suitability. We
                            thank you for your understanding and patience</p>
                        <a class="button" id="button-contact" href="<%= cp %>jsp/html/new_registration.jsp">
                            <span>Register</span>
                        </a>
                    </div>
                    <div class="right">
                        <h6>Edit an existing registration</h6>
                        <form id="editRegistrationForm" action = "<%= cp %>jsp/html/register_new_return_submit.jsp" method = "post">
                            <div class="formField">
                                <span class="label">E-mail Address</span>
                                <input type="text" value="" name="emailAddress" />
                            </div>
                            <div class="formField">
                                <span class="label">4 digit year of birth</span>
                                <input type="text" value="" name="yearOfBirth" maxlength=4 />
                            </div>
                            <a class="button" id="editRegistration">
                                <span>Edit</span>
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
<script type="text/javascript" src="<%= cp %>js/app/register_new_return.js"></script>
<script type="text/javascript">
    window.validationErrors = <%= RequestUtils.json(RequestUtils.errors(request))%>;
    window.editRegistration = <%= RequestUtils.json(request.getParameterMap())%>;
</script>

<%@include file="/WEB-INF/jsp/common/footer.jsp" %>
