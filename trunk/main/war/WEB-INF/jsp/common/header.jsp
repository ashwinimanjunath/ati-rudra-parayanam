<%
	final String cp = "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Ati Rudra Parayanam - 2012</title>
<link rel="stylesheet" href="<%=cp%>stylesheet/stylesheet.css"
	type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Lobster'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet" type="text/css"
	href="<%=cp%>stylesheet/aristo/jquery-ui-1.8.7.custom.css" />
<!-- jQuery and Custom scripts -->
<script src="<%=cp%>js/jquery-1.5.2.min.js" type="text/javascript"></script>
<script src="<%=cp%>js/jquery.cycle.lite.1.0.min.js"
	type="text/javascript"></script>
<script src="<%=cp%>js/custom_scripts.js" type="text/javascript"></script>
<script src="<%=cp%>js/jquery.roundabout.min.js" type="text/javascript"></script>
<script src="<%=cp%>js/jquery-ui-1.8.9.custom.min.js"
	type="text/javascript"></script>
<script src="<%=cp%>js/tabs.js" type="text/javascript"></script>
<script src="<%=cp%>js/jquery.form.js" type="text/javascript"></script>
<script src="<%=cp%>js/tipsy/jquery.tipsy.js" type="text/javascript"></script>
<script src="<%=cp%>js/pdfobject.js" type="text/javascript"></script>
<link href="<%=cp%>js/tipsy/css.tipsy.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript">
	window.cp = "<%=cp%>";
</script>
</head>
<body>
	<div id="swami">&nbsp;</div>
	<div id="shirdi_swami">&nbsp;</div>
	<!-- MAIN WRAPPER -->
	<div id="container">
		<!-- HEADER -->
		<div id="header">
			<div class="inner">
				<div id="welcome"
					style="float: left; margin-left: 325px; margin-bottom: 0px">
					<h3 style="color: #FFF; margin-bottom: 0px">Om Namo Bhagavate
						Rudraya!</h3>
				</div>
				<% 
					if (!Boolean.TRUE.equals(request.getAttribute("no-contact-info-in-the-header"))) {
				%>
				<div
					style="clear: both; background: #FFF8C6; color: #333; padding: 10px 0px; opacity: 5">
					<div>
						<label>For any queries please call us at <a href = "tel://4084751189">(408) 475-1189</a> or email us at <a href = "mailto:saikailashyatra@gmail.com">saikailashyatra@gmail.com</a></label>
					</div>
				</div>
				<%
					}
				%>
				<div class="menu">
					<ul id="topnav">
						<li><a href="<%=cp%>">Home</a></li>
						<li><a href="<%=cp%>jsp/html/index.jsp"
							title="Ati Rudra Parayanam at Kailash for 2012">2012 -
								Kailash Yatra</a>
							<ul class="children">
								<li><a href="<%=cp%>jsp/html/register_new_return.jsp">
										Register <span style="font-size: smaller; font-style: italic;">(Closes
											Feb/12/2012)</span>
								</a></li>
								<li><a href="<%=cp%>KM12-Medical-certificate-Overseas.pdf"
									target="_blank">Physical Fitness Form</a></li>
								<li><a href="<%=cp%>jsp/html/itinerary.jsp">Itinerary</a></li>
								<li><a href="<%=cp%>jsp/html/faq.jsp">FAQ</a></li>
								<li><a href="<%=cp%>jsp/html/wip.jsp">Satsang</a></li>
								<li><a href="<%=cp%>jsp/html/wip.jsp">Videos</a></li>
								<li><a href="<%=cp%>jsp/html/wip.jsp">Photos</a></li>
								<li><a href="<%=cp%>jsp/html/wip.jsp">2011 Ati Rudra
										Parayanam</a>
									<ul class="children2">
										<li><a href="<%=cp%>jsp/html/wip.jsp">Satsang</a></li>
										<li><a href="<%=cp%>jsp/html/wip.jsp">Videos</a></li>
										<li><a href="<%=cp%>jsp/html/wip.jsp">Photos</a></li>
									</ul></li>
								<li><a href="<%=cp%>jsp/html/wip.jsp">2010 Ati Rudra
										Parayanam</a>
									<ul class="children2">
										<li><a href="<%=cp%>jsp/html/wip.jsp">Satsang</a></li>
										<li><a href="<%=cp%>jsp/html/wip.jsp">Videos</a></li>
										<li><a href="<%=cp%>jsp/html/wip.jsp">Photos</a></li>
									</ul></li>
								<li><a href="<%=cp%>jsp/html/wip.jsp">Background</a></li>
							</ul></li>
						<li><a href="<%=cp%>jsp/html/wip.jsp">Namakam</a>
							<ul class="children">
								<li><a href="<%=cp%>jsp/html/vedam/namakam/1.jsp">Anuvakam
										1</a></li>
								<li><a href="<%=cp%>jsp/html/vedam/namakam/2.jsp">Anuvakam
										2</a></li>
								<li><a href="<%=cp%>jsp/html/vedam/namakam/3.jsp">Anuvakam
										3</a></li>
								<li><a href="<%=cp%>jsp/html/vedam/namakam/4.jsp">Anuvakam
										4</a></li>
								<li><a href="<%=cp%>jsp/html/vedam/namakam/5.jsp">Anuvakam
										5</a></li>
								<li><a href="<%=cp%>jsp/html/vedam/namakam/6.jsp">Anuvakam
										6</a></li>
								<li><a href="<%=cp%>jsp/html/vedam/namakam/7.jsp">Anuvakam
										7</a></li>
								<li><a href="<%=cp%>jsp/html/vedam/namakam/8.jsp">Anuvakam
										8</a></li>
								<li><a href="<%=cp%>jsp/html/vedam/namakam/9.jsp">Anuvakam
										9</a></li>
								<li><a href="<%=cp%>jsp/html/vedam/namakam/10.jsp">Anuvakam
										10</a></li>
								<li><a href="<%=cp%>jsp/html/vedam/namakam/11.jsp">Anuvakam
										11</a></li>
								<li><a href="<%=cp%>jsp/html/vedam/namakam/complete.jsp">Complete
										Namakam</a></li>
							</ul></li>
						<li><a href="<%=cp%>jsp/html/wip.jsp">Chamakam</a>
							<ul class="children">
								<li><a href="<%=cp%>jsp/html/wip.jsp">Anuvakam 1</a></li>
								<li><a href="<%=cp%>jsp/html/wip.jsp">Anuvakam 2</a></li>
								<li><a href="<%=cp%>jsp/html/wip.jsp">Anuvakam 3</a></li>
								<li><a href="<%=cp%>jsp/html/wip.jsp">Anuvakam 4</a></li>
								<li><a href="<%=cp%>jsp/html/wip.jsp">Anuvakam 5</a></li>
								<li><a href="<%=cp%>jsp/html/wip.jsp">Anuvakam 6</a></li>
								<li><a href="<%=cp%>jsp/html/wip.jsp">Anuvakam 7</a></li>
								<li><a href="<%=cp%>jsp/html/wip.jsp">Anuvakam 8</a></li>
								<li><a href="<%=cp%>jsp/html/wip.jsp">Anuvakam 9</a></li>
								<li><a href="<%=cp%>jsp/html/wip.jsp">Anuvakam 10</a></li>
								<li><a href="<%=cp%>jsp/html/wip.jsp">Anuvakam 11</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- END OF HEADER -->
		<!-- CONTENT -->
		<div id="content_holder" class="fixed">