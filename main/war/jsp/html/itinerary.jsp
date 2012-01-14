<%@page import="org.arp.arp_2012.utils.RequestUtils"%>
<%@include file="/WEB-INF/jsp/common/header.jsp"%>
<div class="inner">
	<div id="content">
		<div class="content account-page">
			<div class="box-login">
				<div class="box-content fixed">
					<div class="stitched"></div>
					<div style="padding: 20px 10px 30px 10px;">
						<div style = "float:left;width: 70%">
							<h3 style="margin: 0px">Itinerary</h3>
						</div>
						<div style = "float:left">
							<a href="<%=cp%>itinerary.pdf">Download (.pdf)</a>
						</div>
						<div style = "clear:both">&nbsp;</div>
						<div id="pdf" style="margin-top: 20px; height: 600px"></div>
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
	jQuery(function() {
		var $e = $("#pdf");
		new PDFObject({
			url : "<%= cp %>itinerary.pdf",
			width : $e.width(),
			height : $e.height(),
			pdfOpenParams: { zoom: '120,100,125' }
		}).embed("pdf");
	});
</script>
<%@include file="/WEB-INF/jsp/common/footer.jsp"%>
