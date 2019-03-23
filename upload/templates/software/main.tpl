<!DOCTYPE html>
<html lang="en">
<head>
	{headers}
	<meta name="HandheldFriendly" content="true">
	<meta name="format-detection" content="telephone=no">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="default">
	<link rel="shortcut icon" href="{THEME}/assets/images/favicon.png">
	<link rel="stylesheet"  href="{THEME}/assets/libs/bootstrap/bootstrap-grid.min.css">
	<link  rel="stylesheet" href="{THEME}/assets/css/main.css">
	<link  rel="stylesheet" href="{THEME}/assets/css/media.css">
    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({
          google_ad_client: "ca-pub-9764971761641225",
          enable_page_level_ads: true
     });
</script>
</head>
<body>
	{AJAX}
	<div class="wrap">
		<div class="container">
			<div class="row">
				<div class="column-main col-md-9 order-md-2">
					<header class="header d-sm-flex d-block">
						<div class="logo">
							<a href="/">
								<img src="{THEME}/assets/images/logo.png" alt="AppstoTalk">
							</a>
						</div>
						<nav class="main-menu">
							<ul>
								<li><i data-href="/software/">Software</i></li>
								<li><a href="/faq/">FAQ</a></li>
								<li><i data-href="/about-us.html" rel="nofollow" >About us</i></li>
							</ul>
						</nav>
						{*
							<div class="social-icons ml-auto">
								<a href="#"><svg><use xlink:href="#icon-fb"></use></svg></a>
								<a href="#"><svg><use xlink:href="#icon-tw"></use></svg></a>
							</div>
							*}
						</header>

						[not-aviable=main]{speedbar}[/not-aviable]

						[aviable=cat][not-category=2-40]
						<div class="category-title">
							<h1>FAQ</h1>
							{*
								<div class="filter">
									<span>Filter:</span>
									<a href="/faq/"[category=1] class="active"[/category]>All</a>
									<a href="/xfsearch/telegram"[request="xf=telegram"] class="active"[/request]>Telegram</a>
									<a href="/xfsearch/whatsapp"[request="xf=whatsapp"] class="active"[/request]>Whatsapp</a>
									<a href="/xfsearch/viber"[request="xf=viber"] class="active"[/request]>Viber</a>
									<a href="/xfsearch/skype"[request="xf=skype"] class="active"[/request]>Skype</a>
									<a href="/xfsearch/hangouts"[request="xf=hangouts"] class="active"[/request]>Hangouts</a>
									<a href="/xfsearch/line"[request="xf=line"] class="active"[/request]>Line</a>
                                    <a href="/xfsearch/bbm"[request="xf=bbm"] class="active"[/request]>BBM</a>
								</div>
								*}
							</div>
							[/not-category][/aviable]

							{info}
							{content}

							[aviable=main]
							<div class="category-title">
								<h1>AppstoTalk — free messaging clients</h1>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-6">
									<div class="main-short main-short--telegram">
										<div class="main-short__icon">
											<img src="#" alt="">
										</div>
										<div class="short-body">
											<div class="short-title short-title--main">
												<a href="/telegram/">Telegram</a>
											</div>
											<i data-href="/telegram/" data-class="short-btn"><svg class="short-btn__icon"><use xlink:href="#icon-download"></use></svg> Download</i>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="main-short main-short--whatsapp">
										<div class="main-short__icon">
											<img src="#" alt="">
										</div>
										<div class="short-body">
											<div class="short-title short-title--main">
												<a href="/whatsapp/">Whatsapp</a>
											</div>
											<i data-href="/whatsapp/" data-class="short-btn"><svg class="short-btn__icon"><use xlink:href="#icon-download"></use></svg> Download</i>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="main-short main-short--viber">
										<div class="main-short__icon">
											<img src="#" alt="">
										</div>
										<div class="short-body">
											<div class="short-title short-title--main">
												<a href="/viber/">Viber</a>
											</div>
											<i data-href="/viber/" data-class="short-btn"><svg class="short-btn__icon"><use xlink:href="#icon-download"></use></svg> Download</i>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="main-short main-short--skype">
										<div class="main-short__icon">
											<img src="#" alt="">
										</div>
										<div class="short-body">
											<div class="short-title short-title--main">
												<a href="/skype/">Skype</a>
											</div>
											<i data-href="/skype/" data-class="short-btn"><svg class="short-btn__icon"><use xlink:href="#icon-download"></use></svg> Download</i>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="main-short main-short--hangouts">
										<div class="main-short__icon">
											<img src="#" alt="">
										</div>
										<div class="short-body">
											<div class="short-title short-title--main">
												<a href="/hangouts/">Hangouts</a>
											</div>
											<i data-href="/hangouts/" data-class="short-btn"><svg class="short-btn__icon"><use xlink:href="#icon-download"></use></svg> Download</i>
										</div>
									</div>
								</div>
                               <div class="col-lg-4 col-md-6">
									<div class="main-short main-short--bbm">
										<div class="main-short__icon">
											<img src="#" alt="">
										</div>
										<div class="short-body">
											<div class="short-title short-title--main">
												<a href="/bbm/">BBM</a>
											</div>
											<i data-href="/bbm/" data-class="short-btn"><svg class="short-btn__icon"><use xlink:href="#icon-download"></use></svg> Download</i>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="main-short main-short--line">
										<div class="main-short__icon">
											<img src="#" alt="">
										</div>
										<div class="short-body">
											<div class="short-title short-title--main">
												<a href="/line/">Line</a>
											</div>
											<i data-href="/line/" data-class="short-btn"><svg class="short-btn__icon"><use xlink:href="#icon-download"></use></svg> Download</i>
										</div>
									</div>
								</div>

							</div>
							[/aviable]

							[aviable=cat][not-category=1,2,3,7,8,9,10]
							<div class="cat-title">Additional software for {category-title}</div>
							<div class="row">{custom category="2," sort="reads" template="inc/short-software" xfields="{category-title}"}</div>
							[/not-category][/aviable]

							[not-aviable=showfull|static]
							{include file="engine/modules/catface.php"}
							[/not-aviable]
						</div>
						<div class="column-aside col-md-3 order-md-1">
							{include file="inc/sidebar.tpl"}
						</div>
					</div>
					<div class="row">
						<footer class="footer d-flex justify-content-center flex-column flex-sm-row">
							<div class="copyright">
								&copy; {year} AppstoTalk.Copying of the content without reference is prohibited
							</div>
							<div class="foot-links">
								<a href="/privacy-policy.html" rel="nofollow">Privacy Policy</a>
								<a href="#" data-uf-open="/engine/ajax/uniform/uniform.php" data-uf-settings='{"formConfig": "feedback"}'>Feedback</a>
							</div>
						</footer>
					</div>
				</div>
			</div>
			<div class="scrollup">
				<svg><use xlink:href="#icon-up"></use></svg>
			</div>
			<div class="cookies_policy">
				<div class="container">
					<div class="cookies_desc">
						AppstoTalk uses "cookies" to optimize the content and speed up the website. By continuing the session, you agree to use "cookies".
						<div class="cookies_btn">
							<a class="cookies_ok" href="#" rel="nofollow">I agree</a>
							<a href="/privacy-policy.html" target="_blank" rel="nofollow">More info</a>
						</div>
						<span class="custom_close"></span>
					</div>
				</div>
			</div>
			{include file="inc/icons.tpl"}

			<link rel="stylesheet" href="{THEME}/assets/css/engine.css">
			<script src="{THEME}/assets/js/common.js"></script>
			<script src="{THEME}/assets/js/fad.js"></script>
			<!-- DLE UniForm -->
			<link rel="stylesheet" href="/engine/classes/min/index.php?charset=utf-8&f={THEME}/uniform/css/uniform.css&114" />
			<script src="/engine/classes/min/index.php?charset=utf-8&f={THEME}/uniform/js/jquery.magnificpopup.min.js,{THEME}/uniform/js/jquery.ladda.min.js,{THEME}/uniform/js/jquery.form.min.js,{THEME}/uniform/js/uniform.js&114"></script>
			<!-- /DLE UniForm -->
            <script src="/engine/modules/rotator/index.php"></script>
                <script>
                ITENSE_FS_BANNER_ROTATOR.writeBanners([
                    {id: 'as1', name: 'banner1'},
                    {id: 'as2', name: 'banner2'},
                    {id: 'as3', name: 'banner3'},
                    {id: 'as4', name: 'banner4'},
                ]);
            </script>
			{include file="inc/counters.tpl"}
		</body>
		</html>