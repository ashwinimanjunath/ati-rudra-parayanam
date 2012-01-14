<%@page import="org.arp.arp_2012.utils.RequestUtils"%>
<%@include file="/WEB-INF/jsp/common/header.jsp"%>
<div class="inner">
	<div id="content">
		<div class="content account-page">
			<div class="box-login">
				<div class="box-content fixed">
					<div class="stitched"></div>
					<div style="width: 100%; height: auto;">
						<h2 style="text-align: center;padding: 15px 0px 5px 0px">Your registration has been saved.</h2>
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
