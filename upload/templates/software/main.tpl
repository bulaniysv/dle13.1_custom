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
								<img src="{THEME}/assets/images/logo.png" alt="">
							</a>
						</div>
						<nav class="main-menu">
							<ul>
								<li><a href="/software">Software</a></li>
								<li><a href="/faq">FAQ</a></li>
								<li><a href="/about-us.html">About us</a></li>
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

					[aviable=cat|xfsearch][not-category=2-40]
					<div class="category-title">
						<h1>FAQ</h1>
						<div class="filter">
							<span>Filter:</span>
							<a href="/faq"[category=1] class="active"[/category]>All</a>
							<a href="/xfsearch/whatsapp"[request="xf=whatsapp"] class="active"[/request]>WhatsApp</a>
							<a href="/xfsearch/viber"[request="xf=viber"] class="active"[/request]>Viber</a>
							<a href="/xfsearch/telegram"[request="xf=telegram"] class="active"[/request]>Telegram</a>
						</div>
					</div>
					[/not-category][/aviable]

					{info}
					{content}

					[aviable=main]
					<div class="row">
						<div class="col-lg-4 col-md-6">
							<div class="main-short main-short--whatsapp">
								<div class="main-short__icon">
									<svg><use xlink:href="#whatsapp"></use></svg>
								</div>
								<div class="short-body">
									<a href="/whatsapp" class="short-title">Whatsapp</a>
									<i data-href="/whatsapp" data-class="short-btn"><svg class="short-btn__icon"><use xlink:href="#icon-download"></use></svg> Download</i>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="main-short main-short--viber">
								<div class="main-short__icon">
									<svg><use xlink:href="#viber"></use></svg>
								</div>
								<div class="short-body">
									<a href="/viber" class="short-title">Viber</a>
									<i data-href="/viber" data-class="short-btn"><svg class="short-btn__icon"><use xlink:href="#icon-download"></use></svg> Download</i>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="main-short main-short--skype">
								<div class="main-short__icon">
									<svg><use xlink:href="#skype"></use></svg>
								</div>
								<div class="short-body">
									<a href="#" class="short-title">Skype</a>
									<i data-href="#" data-class="short-btn"><svg class="short-btn__icon"><use xlink:href="#icon-download"></use></svg> Download</i>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="main-short main-short--telegram">
								<div class="main-short__icon">
									<svg><use xlink:href="#telegram"></use></svg>
								</div>
								<div class="short-body">
									<a href="#" class="short-title">Telegram</a>
									<i data-href="#" data-class="short-btn"><svg class="short-btn__icon"><use xlink:href="#icon-download"></use></svg> Download</i>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="main-short main-short--messenger">
								<div class="main-short__icon">
									<svg><use xlink:href="#messenger"></use></svg>
								</div>
								<div class="short-body">
									<a href="#" class="short-title">Messenger</a>
									<i data-href="#" data-class="short-btn"><svg class="short-btn__icon"><use xlink:href="#icon-download"></use></svg> Download</i>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="main-short main-short--hangouts">
								<div class="main-short__icon">
									<svg><use xlink:href="#hangouts"></use></svg>
								</div>
								<div class="short-body">
									<a href="#" class="short-title">Hangouts</a>
									<i data-href="#" data-class="short-btn"><svg class="short-btn__icon"><use xlink:href="#icon-download"></use></svg> Download</i>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="main-short main-short--line">
								<div class="main-short__icon">
									<svg><use xlink:href="#line"></use></svg>
								</div>
								<div class="short-body">
									<a href="#" class="short-title">Line</a>
									<i data-href="#" data-class="short-btn"><svg class="short-btn__icon"><use xlink:href="#icon-download"></use></svg> Download</i>
								</div>
							</div>
						</div>
					</div>
					[/aviable]

					[aviable=cat][not-category=1]
						<div class="cat-title">Дополнительный софт для работы с {category-title}</div>
					[/not-category][/aviable]

					[aviable=cat][not-category=1]
						<div class="row">{custom category="2" sort="reads" template="inc/short-software" xfields="{category-title}"}</div>
					[/not-category][/aviable]

					[not-aviable=showfull|static]
					<article class="bottom-text">
						{include file="engine/modules/catface.php"}
					</article>
					[/not-aviable]
				</div>
				<div class="column-aside col-md-3 order-md-1">
					{include file="inc/sidebar.tpl"}
				</div>
			</div>
			<div class="row">
				<footer class="footer d-flex justify-content-center flex-column flex-sm-row">
					<div class="copyright">
						Copyright &copy; {year} Appstotalk.com. All rights reserved.
					</div>

					<div class="foot-links">
						<a href="#">Privacy Policy</a>
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
				ITENSE uses cookies to improve its site. By continuing to use our site you agree to our use of cookies.
				<div class="cookies_btn">
					<a class="cookies_ok" href="#" rel="nofollow">I agree</a>
					<a href="/privacy-policy.html" target="_blank" rel="nofollow">Learn more</a>
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

	{include file="inc/counters.tpl"}
</body>
</html>