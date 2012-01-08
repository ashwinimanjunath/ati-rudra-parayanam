<%@page import="org.arp.arp_2012.utils.RequestUtils"%>
<%@include file="/WEB-INF/jsp/common/header.jsp"%>
<div class="inner">
    <div id="content">
        <div class="content account-page">
            <div class="box-login">
                <div class="box-content fixed">
                    <div class="stitched"></div>
                    <div style="padding: 20px 10px 30px 10px;">
                        <h3>Complete Anuvakam Audio</h3>
                        <div id="audio"></div>
                        <div class = "helpText">&copy;&nbsp;<a href = "http://www.sssbpt.org/sri-rudram/instructions-to-user.htm">Sri Sathya Sai Books And Publications Trust</a></div>
                    </div>
                    
                    <div style="padding: 20px 10px 30px 10px;">
                        <h3 style = "margin: 0px">Anuvakam Pdf</h3>
                        <div class = "helpText">&copy;&nbsp;<a href = "http://www.sssbpt.org/sri-rudram/instructions-to-user.htm">Sri Sathya Sai Books And Publications Trust</a></div>
                        <div id="pdf" style = "margin-top: 20px;height: 600px"></div>
                    </div>
                    <div class="stitched"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<script type="text/javascript" src="<%=cp%>js/app/vedam/embed_pdf.js"></script>
<script type="text/javascript">
	jQuery (function () {
		jQuery.embed_vedam_pdf ("http://sai-arp.s3-website-us-east-1.amazonaws.com/namakam/4.pdf", "http://sai-arp.s3-website-us-east-1.amazonaws.com/namakam/4.mp3")
	});
</script>
<%@include file="/WEB-INF/jsp/common/footer.jsp"%>
