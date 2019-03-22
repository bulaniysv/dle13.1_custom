<style>
.redirect-text {
	text-align: center;
	font-size: 20px;
	margin: 20px 0;
}
.timer-box {
	margin-top: 20px;
	display: inline-block;
}
.loading {
	margin-bottom: 10px;
	color: #ccc;
	font-size: 14px;
}
.file-title {
	font-weight: 600;
	font-style: normal;
}
.loading img {width: 40px;}
.redirect_page .fs-table {margin: 0;}
.redirect-banner {margin-bottom: 20px;}
.redirect-banner img:hover {border: 2px solid transparent;}
.redirect-banner img {border: 2px solid #efefef;}
.redirect-header {margin-bottom: 2em;}
#timer {font-weight: 600;}
</style>

<div class="col-lg-12">
	<div class="redirect-header">
		<h1>{title}</h1>
	</div>
</div>
<div class="col-sm-4">
	<div class="poster-box">
			[not-empty_icon]
				<svg class="{icon}-fill"><use xlink:href="#{icon}"></use></svg>
			[/not-empty_icon]
			[not-empty_logo]
				<img src="{logo}" alt="{title}">
			[/not-empty_logo]
		</div>
</div>
<div class="col-md-8 col-sm-12">
	<div class="fs-table">
		<meta itemprop="applicationCategory" content="Software" />
		<div class="row no-gutters">

			[not-empty_file-name]
			<div class="col-6">File name:</div>
			<div class="col-6">{file-name}</div>
			[/not-empty_file-name]

			[not-empty_size]
			<div class="col-6">Size:</div>
			<div class="col-6">{size}</div>
			[/not-empty_size]

			<div class="col-6">Distribution type:</div>
			<div class="col-6">Free</div>

			[not-empty_os]
			<div class="col-6">Operating system:</div>
			<div class="col-6" itemprop="operatingSystem">{os}</div>
			[/not-empty_os]

			[not-empty_dev]
			<div class="col-6">Developer:</div>
			<div class="col-6"><a href="[xfvalue_dev-url]" target="_blank" rel="nofollow">{dev}</a></div>
			[/not-empty_dev]

		</div>
	</div>
</div>
<div class="col-lg-12">
	<div class="redirect-text">
		<!--[banner_redirect]
		<div class="redirect-banner">
			{banner_redirect}
		</div>
		[/banner_redirect]-->
		<div class="loading"><img src="/uploads/loading.gif" alt=""></div>
		Dear guest, please don't leave the page,<br>
		<div><em class="file-title">{title}</em> will start downloading in</div>
		<div class="timer-box">
			<i class="fa fa-clock-o" aria-hidden="true"></i> <span id="timer">{timeout}</span>
			<span class="seconds">seconds</span>
		</div>
	</div>
</div>
<script>
	var timer = document.getElementById("timer");
	var delay = {timeout};
	var interval = setInterval(function () {
		if(delay)
		{
			delay--;
		}

		timer.innerHTML = delay;
		if(delay <= 0)
		{
			clearInterval(interval);
			$(".loading").html('<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> The download of the file will start automatically ...');
			$(".loading img").remove();
			$("#timer").html("Готово!");
			$(".timer .seconds").remove();
			document.location.href = 
			ADBLOCKER_DETECTED
			? "{url}"
			: "{url}";
		}
	}, 1000);

	time();
	var s = parseInt($('#timer').text());
	var ms = s * 1000;
	var p = 0;
	setInterval(function () {
		if (p<=100) $('.block_44').text( p++ + '%' );
	}, ms/100);

</script>