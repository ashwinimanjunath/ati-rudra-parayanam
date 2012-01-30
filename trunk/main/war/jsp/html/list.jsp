<%@page import="org.arp.arp_2012.utils.RequestUtils"%>
<%@include file="/WEB-INF/jsp/common/header.jsp"%>
<div class="inner">
	<h2 class="heading-title">
		<span>Shiva Sena!</span>
	</h2>
	<div id="content">
		<div class="content account-page">
			<div class="box-login">
				<div class="box-content fixed">
					<div class="stitched"></div>
					<div class="left" style="height: 120px">
						<form id="list"
							action="<%=cp%>jsp/html/list_submit.jsp" method="post">
							<div class="formField">
								<span class="label">E-mail Address</span> <input type="text"
									value="" name="emailAddress" />
							</div>
						</form>
						<a class="button" id="submit"> <span>Submit</span>
						</a>
					</div>
					<div class="stitched"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<script type="text/javascript" src="<%=cp%>js/app/list.js"></script>
<%@include file="/WEB-INF/jsp/common/footer.jsp"%>
