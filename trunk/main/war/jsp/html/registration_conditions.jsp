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
                        <ol>
                            <li>
                                This pilgrimage is being undertaken as a
                                <strong>collective prayer</strong>
                                and offering for the peace and happiness of every being in every world.
                            </li>
                            <li>
                                It is very important that every devotee
                                <strong>
                                    learn to chant the
                                    <a href="<%=cp%>/jsp/html/namakam.jsp">Namakam</a>
                                    and
                                    <a href="<%=cp%>/jsp/html/namakam.jsp">Chamakam</a>
                                    fluently
                                </strong>
                                . The offering of 121 Sri Rudrams by every devotee is the most significant component of
                                the pilgrimage.
                            </li>
                            <li>
                                We strongly believe that this pilgrimage is a gift of pure grace and thus would want to
                                offer our love with utmost purity to the lord. To purify ourselves we will be
                                undertaking a
                                <strong>sustained and disciplined sadhana for 6 Months</strong> (January-June)
                                before the pilgrimage. We request your fullest enthusiastic participation.
                            </li>
                        </ol>
                        <div style='margin: 20px'>&nbsp;</div>
                        <a class="button" id="button-contact" href="<%=cp%>jsp/html/new_registration.jsp">
                            <span>I Agree. Continue to Registration!</span>
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
