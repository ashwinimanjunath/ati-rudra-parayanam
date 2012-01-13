<%@page import="org.arp.arp_2012.utils.RequestUtils"%>
<%@include file="/WEB-INF/jsp/common/header.jsp"%>
<div class="inner">
    <h2 class="heading-title">
        <span>Important!</span>
    </h2>
    <div id="content">
        <div class="content account-page">
            <div class="box-login">
                <div class="box-content fixed">
                    <div class="stitched"></div>
                    <div class="left" style="height: auto">
                        <h6>Please Note</h6>
                        <div>This pilgrimage is a gift of pure love and divine grace of <strong>Bhagavan Sri Sathya Sai
                            Baba</strong>. Let us all offer the parayanam with utmost humility and reverence at his lotus feet.</div>
                        <ol>
                            <li>
                                The pilgrimage and parayanam are being undertaken as a
                                <strong>collective prayer</strong>
                                and offering for the peace and happiness of every being in every world.
                            </li>
                            <li>
                                It is very important that every devotee
                                <strong>
                                    know to chant the
                                    <a href="<%=cp%>/jsp/html/namakam.jsp">Namakam</a>
                                    and
                                    <a href="<%=cp%>/jsp/html/namakam.jsp">Chamakam</a>
                                    fluently
                                </strong>
                                . The offering of 121 Sri Rudrams by every devotee is the most significant component of
                                the pilgrimage.
                            </li>
                            <li>
                                <strong>Collective sadhana</strong>
                                before the yatra is crucial.
                                <br>
                                By continuing to register you are committing to a sustained and disciplined collective
                                sadhana
                                <strong>for 5 Months (February-June)</strong>
                                before the pilgrimage.
                            </li>
                        </ol>
                        <div style='margin: 20px'>&nbsp;</div>
                        <a class="button" id="button-contact" href="<%=cp%>jsp/html/new_registration.jsp">
                            <span>I Commit! Continue to Registration</span>
                        </a>
                    </div>
                    <div class="stitched"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<script type="text/javascript" src="<%=cp%>js/app/register_new_return.js"></script>
<script type="text/javascript">
    window.validationErrors = <%=RequestUtils.json(RequestUtils.errors(request))%>;
    
	window.editRegistration = _$tag__
estUtils.json(request.getParameterMap())%>
	;
</script>
<%@include file="/WEB-INF/jsp/common/footer.jsp"%>
