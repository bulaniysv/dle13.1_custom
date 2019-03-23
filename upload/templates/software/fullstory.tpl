<div class="col-12">
	<article itemscope itemtype="http://schema.org/SoftwareApplication">
		<div class="title-box">
			<h1>{title}</h1>
			<div class="label-free">Free</div>
		</div>
		<div class="poster-box d-flex flex-wrap justify-content-between">
			<img src="[xfvalue_image_url_logo]" alt="{title}">
			<div class="as-box as-type-1" id="as1"></div>
		</div>
		<div class="tab-contain">
			<ul class="tabs">
				<li class="current">Description</li>
				[xfgiven_images]
				<li>Interface</li>
				[/xfgiven_images]
			</ul>
			<div class="tab-contain__box visible" itemprop="description">
				{full-story}
			</div>
			[xfgiven_images]
			<div class="tab-contain__box">
				[xfvalue_images]
			</div>
			[/xfgiven_images]
		</div>
		<div class="file-information">
			<div class="row">
				<div class="col-lg-6">
					<div class="as-box as-type-1" id="as2"></div>
				</div>
				<div class="col-lg-6">
					<div class="fs-table">
						<meta itemprop="applicationCategory" content="Software" />
						<div class="row no-gutters">
							[rating]
							<div class="col-6">Rating:</div>
							<div class="col-6">
								<div id="custome-rate">{rating}</div>
							</div>
							[/rating]
                          
                            <div class="col-6">Category:</div>
							<div class="col-6">
								<div id="custome-rate">Software</div>
							</div>
                            <div class="col-6">Type of distribution:</div>
							<div class="col-6">Free</div>
   							[xfgiven_file-name]
							<div class="col-6">Name of the file:</div>
							<div class="col-6">[xfvalue_file-name]</div>
							[/xfgiven_file-name]
                   
							<div class="col-6">Number of downloads:</div>
							<div class="col-6">{views}</div>

							[xfgiven_size]
							<div class="col-6">Size of the file:</div>
							<div class="col-6">[xfvalue_size]</div>
							[/xfgiven_size]

							<div class="col-12" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
								<div class="row no-gutters">
									<meta itemprop="price" content="0"/>
									<meta itemprop="priceCurrency" content="USD"/>
								</div>
							</div>
							[xfgiven_os]
							<div class="col-6">Device:</div>
							<div class="col-6" itemprop="operatingSystem">
								[ifxfvalue os="windows"]Laptop (PC)[/ifxfvalue]
								[ifxfvalue os="macos"]MacBook, iMac[/ifxfvalue]
								[ifxfvalue os="linux"]Laptop (PC)[/ifxfvalue]
								[ifxfvalue os="android"]Mobile phone, tablet[/ifxfvalue]
								[ifxfvalue os="extensions"]Laptop (PC)[/ifxfvalue]
								[ifxfvalue os="tablet_allos"]Tablet[/ifxfvalue]
                                [ifxfvalue os="many_os"]Laptop (PC), iPhone, MacBook, iMac[/ifxfvalue]
                                [ifxfvalue os="winphone"]Phone[/ifxfvalue]
                                [ifxfvalue os="ios"]iPhone, iPad[/ifxfvalue]
							</div>
							[/xfgiven_os]
                            
							[ifxfvalue os="windows"]
							<div class="col-6">OS:</div><div class="col-6" itemprop="operatingSystem">Windows</div>
							[/ifxfvalue]
							
							[ifxfvalue os="macos"]
							<div class="col-6">OS:</div><div class="col-6" itemprop="operatingSystem">macOS</div>
							[/ifxfvalue]
							
							[ifxfvalue os="linux"]
							<div class="col-6">OS:</div><div class="col-6" itemprop="operatingSystem">Linux (Debian, Ubuntu)</div>
							[/ifxfvalue]

							[ifxfvalue os="android"]
							<div class="col-6">OS:</div><div class="col-6" itemprop="operatingSystem">Android</div>
							[/ifxfvalue]

							[ifxfvalue os="winphone"]
							<div class="col-6">OS:</div><div class="col-6" itemprop="operatingSystem">Windows Phone, Windows Mobile</div>
							[/ifxfvalue]

							[ifxfvalue os="ios"]
							<div class="col-6">OS:</div><div class="col-6" itemprop="operatingSystem">iOS</div>
							[/ifxfvalue]

							[xfgiven_dev]
							<div class="col-6">Developer:</div>
							<div class="col-6"><a href="[xfvalue_dev-url]" target="_blank" rel="nofollow">[xfvalue_dev]</a></div>
							[/xfgiven_dev]
							</div>
					</div>
					<div id="social_share" class="sticky-desktop">
						<a class="fb" data-type="fb">Facebook</a>
						<a class="tw" data-type="tw">Twitter</a>
						<a class="pt" data-type="pt">Pinterest</a>
						<a class="tg" data-type="tg">Telegram</a>
						<script async src="https://cdn.itense.group/share/social_share.js"></script>
					</div>
				</div>
			</div>
		</div>
		{include file="inc/download-table.tpl"}
		<div class="download-info">
			<svg class="icon-check"><use xlink:href="#icon-check"></use></svg> <span>{title} is available for free download without registration</span>
		</div>
		{*<div class="related-apps">
			<div class="related-apps__title">
				<svg class="poster-box__[xfvalue_icon limit='20']"><use xlink:href="#[xfvalue_icon limit='20']"></use></svg>Other versions
			</div>
			<div class="related-post">
				<ul>
					{include file='engine/modules/linkenso.php?post_id={news-id}&date=old&ring=yes&scan=same_cat&anchor=name&title=title&image=os'}
				</ul>
			</div>
		</div>*}
		<div id="disqus_thread"></div>
		<script async>
			(function() {
				var d = document, s = d.createElement('script');
				s.src = 'https://appstotalk-com.disqus.com/embed.js';
				s.setAttribute('data-timestamp', +new Date());
				(d.head || d.body).appendChild(s);
			})();
		</script>
		<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
	</article>
</div>