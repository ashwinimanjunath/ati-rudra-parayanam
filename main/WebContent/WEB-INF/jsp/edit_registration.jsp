<%@include file="/WEB-INF/jsp/common/header.jsp"%>
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
                        <form id="editRegistrationForm">
                            <div class="formField">
                                <span class="label">E-mail Address</span>
                                <input type="text" value="" name="email" class="text" />
                            </div>
                            <div class="formField">
                                <span class="label">Date of Birth</span>
                                <input type="text" value="" name="yob" class="text" maxlength=4 />
                                <div class="helpText">MM/DD/YYYY</div>
                            </div>
                            <div class="formField">
                                <div style="float: left; width: 40%">
                                    <span class="label">Country of Departure</span>
                                    <select class="select">
                                        <option value="canada">Canada</option>
                                        <option value="india">India</option>
                                        <option value="usa" selected="selected">United States of America</option>
                                    </select>
                                </div>
                                <div class="notes" style="float: right; width: 60%">
                                    <div class="first_line">If you are flying from India you will have to make
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
                                <span class="label">Port of Departure</span>
                                <select class="select">
                                    <option value="canada">Canada</option>
                                    <option value="india">India</option>
                                    <option value="US" selected="selected">United States of America</option>
                                </select>
                                <div class="helpText">MM/DD/YYYY</div>
                            </div>
                            <div class="formField">
                                <span class="label">Country of Departure</span>
                                <select class="select">
                                    <option value="canada">Canada</option>
                                    <option value="india">India</option>
                                    <option value="US" selected="selected">United States of America</option>
                                </select>
                                <div class="helpText">MM/DD/YYYY</div>
                            </div>
                            <div class="formField">
                                <span class="label">Country of Departure</span>
                                <select class="select">
                                    <option value="canada">Canada</option>
                                    <option value="india">India</option>
                                    <option value="US" selected="selected">United States of America</option>
                                </select>
                                <div class="helpText">MM/DD/YYYY</div>
                            </div>
                            <div class="formField">
                                <span class="label">Country of Departure</span>
                                <select class="select">
                                    <option value="canada">Canada</option>
                                    <option value="india">India</option>
                                    <option value="US" selected="selected">United States of America</option>
                                </select>
                                <div class="helpText">MM/DD/YYYY</div>
                            </div>
                            <br />
                            <br />
                            <a class="button" id="editRegistration">
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
<link href="<%=cp%>stylesheet/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=cp%>js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="<%=cp%>js/app/edit_registration.js"></script>
<%@include file="/WEB-INF/jsp/common/footer.jsp"%>
