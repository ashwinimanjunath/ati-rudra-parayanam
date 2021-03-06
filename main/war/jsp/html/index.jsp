<%@include file="/WEB-INF/jsp/common/header.jsp"%>
<div class="inner">
    <div id="content">
        <div class="box featured-box">
            <div class="box-content">
                <ul id="myRoundabout">
                    <li>
                        <div class="prod_holder">
                            <a href="#">
                                <img src="<%= cp %>image/himalayas.jpg"  />
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="prod_holder">
                            <a href="#">
                                <img src="<%= cp %>image/lake_manas_sarovar.jpg"  />
                            </a>
                            <h3>Manasa Sarovar</h3>
                        </div>
                    </li>
                    <li>
                        <div class="prod_holder">
                            <a href="#">
                                <img src="<%= cp %>image/snow-clad-himalayas-wallpapers.jpg"  />
                            </a>
                            <h3>The Himalayas</h3>
                        </div>
                    </li>
                    <li>
                        <div class="prod_holder">
                            <a href="#">
                                <img src="<%= cp %>image/kailash_lingam.jpg"  />
                            </a>
                            <h3>Kailasha Lingam</h3>
                        </div>
                    </li>
                    <li>
                        <div class="prod_holder">
                            <a href="#">
                                <img src="<%= cp %>image/shiva.png"  />
                            </a>
                        </div>
                    </li>
                </ul>
                <a href="#" class="previous_round">Previous</a>
                <a href="#" class="next_round">Next</a>
            </div>
        </div>
        <div class="box">
            <h2 class="heading-title">
                <span>Welcome to Ati Rudra Parayanam - 2012</span>
            </h2>
            <div class="box-content">
                <p>
                    By the Divine Lord's Loving Grace we are being blessed with an oppurtunity to conduct the Ati Rudra
                    Parayanam for the year 2012 on the Himalayas facing Mount Kailash. Please
                    <a href="<%=cp%>jsp/html/register_new_return.jsp">register</a>
                    for further updates.
                </p>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		var interval = 0;
		$('ul#myRoundabout').roundabout({
			'btnNext' : '.next_round',
			'btnPrev' : '.previous_round'
		}).hover(function() {
			clearInterval(interval);
		}, function() {
			interval = startAutoPlay();
		});
		interval = startAutoPlay();
	});
	function startAutoPlay() {
		return setInterval(function() {
			$('ul#myRoundabout').roundabout_animateToPreviousChild();
		}, 3000);
	}
</script>
<%@include file="/WEB-INF/jsp/common/footer.jsp"%>
