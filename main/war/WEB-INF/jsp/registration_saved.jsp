<%@page import="org.arp.arp_2012.utils.RequestUtils"%>
<%@include file="/WEB-INF/jsp/common/header.jsp"%>
<div class="inner">
	<div id="content">
		<div class="content account-page">
			<div class="box-login">
				<div class="box-content fixed">
					<div class="stitched"></div>
					<div style="width: 100%; height: auto;">
						<div class="success_icon"
							style="width: 100%; padding: 5px 0px 5px 25px; margin-left: 10px;">Your
							registration is now complete and has been saved.</div>
					</div>
					<div class="stitched"></div>
				</div>
			</div>
			<a class="button" href="<%=cp%>jsp/html/index.jsp"
				id="editRegistration"> <span>Home</span>
			</a>
		</div>
	</div>
	<div class="clear"></div>
</div>
<%@include file="/WEB-INF/jsp/common/footer.jsp"%>
