<%@page import="org.arp.arp_2012.utils.RequestUtils"%>
<%@include file="/WEB-INF/jsp/common/header.jsp"%>
<div class="inner">
	<div id="content">
		<div class="content account-page">
			<div class="box-login">
				<div class="box-content fixed">
					<div class="stitched"></div>
					<div class="warning_icon"
						style="width: 100%; padding: 5px 0px 5px 25px; color: red; margin-left: 10px;">Your
						registration has been saved but is incomplete. <strong>Please upload your medical consent form
						to complete it.</strong></div>
					<div class="stitched"></div>
				</div>
			</div>
			<a class="button" href="<%=cp%>jsp/html/register_new_return.jsp"
				id="editRegistration"> <span>Edit</span>
			</a>
		</div>
	</div>
	<div class="clear"></div>
</div>
<%@include file="/WEB-INF/jsp/common/footer.jsp"%>
