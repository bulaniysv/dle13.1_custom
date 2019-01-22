<div class="col-12">
	<article itemscope itemtype="http://schema.org/SoftwareApplication">
		<div class="title-box">
			<h1>{title}</h1>
			<div class="label-free">Free</div>
		</div>
		<div class="poster-box">
			<img src="[xfvalue_image_url_logo]" alt="{title}">
		</div>
		<div class="tab-contain">
			<ul class="tabs">
				<li class="current">Description</li>
				[xfgiven_images]
				<li>Images</li>
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
				<div class="col-lg-5">
				</div>
				<div class="col-lg-7">
					<div class="fs-table">
						<meta itemprop="applicationCategory" content="Software" />
						<div class="row no-gutters">

							[rating]
							<div class="col-6">Rating:</div>
							<div class="col-6">
								<div id="custome-rate">{rating}</div>
							</div>
							[/rating]

							[xfgiven_file-name]
							<div class="col-6">File name:</div>
							<div class="col-6">[xfvalue_file-name]</div>
							[/xfgiven_file-name]

							<div class="col-6">Number of downloads:</div>
							<div class="col-6">{views}</div>

							[xfgiven_size]
							<div class="col-6">Size:</div>
							<div class="col-6">[xfvalue_size]</div>
							[/xfgiven_size]

							<div class="col-12" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
								<div class="row no-gutters">
									<meta itemprop="price" content="0"/>
									<meta itemprop="priceCurrency" content="USD"/>
									<div class="col-6">Distribution type:</div>
									<div class="col-6">Free</div>
								</div>
							</div>

							[xfgiven_dev]
							<div class="col-6">Developer:</div>
							<div class="col-6"><a href="[xfvalue_dev-url]" target="_blank" rel="nofollow">[xfvalue_dev]</a></div>
							[/xfgiven_dev]

							<div class="col-6">Operating system:</div>
							<div class="col-6" itemprop="operatingSystem">
								<div>[xfgiven_for-win]Windows[xfgiven_for-win]</div>
								<div>[xfgiven_for-mac]macOS[xfgiven_for-mac]</div>
								<div>[xfgiven_for-linux]Linux[xfgiven_for-linux]</div>
								<div>[xfgiven_for-android]Android[xfgiven_for-android]</div>
								<div>[xfgiven_for-ios]iOS[xfgiven_for-ios]</div>
								<div>[xfgiven_for-winphone]Windwows Phone[xfgiven_for-winphone]</div>
							</div>

						</div>
					</div>
					<div id="social_share" class="sticky-desktop">
						<a class="fb" data-type="fb">Facebook</a>
						<a class="tw" data-type="tw">Twitter</a>
						<a class="gg" data-type="gg">Google+</a>
						<a class="pt" data-type="pt">Pinterest</a>
						<a class="tg" data-type="tg">Telegram</a>
						<script async src="https://cdn.itense.group/share/social_share.js"></script>
					</div>
				</div>
			</div>
		</div>
		<div class="download-table">
			<table>
				<thead>
					<tr class="w2">
						<td><strong>Name</strong></td>
						<td><strong>Bit</strong></td>
						<td><strong>Format</strong></td>
						<td><strong>Download</strong></td>
					</tr>
				</thead>
				<tbody>
					[xfgiven_for-win]
					<tr>
						<td>{title} for Windows</td>
						<td>32Bit / 64Bit</td>
						<td>.exe</td>
						<td>
							<a href="[xfvalue_for-win]" target="_blank" rel="nofollow" class="download-color"><svg class="download-btn"><use xlink:href="#icon-download"></use></svg> <span>Download</span></a>
						</td>
					</tr>
					[/xfgiven_for-win]
					[xfgiven_for-mac]
					<tr>
						<td>{title} for Mac</td>
						<td>32Bit / 64Bit</td>
						<td>.exe</td>
						<td>
							<a href="[xfvalue_for-mac]" target="_blank" rel="nofollow" class="download-color"><svg class="download-btn"><use xlink:href="#icon-download"></use></svg> <span>Download</span></a>
						</td>
					</tr>
					[/xfgiven_for-mac]
					[xfgiven_for-linux]
					<tr>
						<td>{title} for Linux</td>
						<td>32Bit / 64Bit</td>
						<td>.exe</td>
						<td>
							<a href="[xfvalue_for-linux]" target="_blank" rel="nofollow" class="download-color"><svg class="download-btn"><use xlink:href="#icon-download"></use></svg> <span>Download</span></a>
						</td>
					</tr>
					[/xfgiven_for-linux]
					[xfgiven_for-android]
					<tr>
						<td>{title} for Android</td>
						<td>32Bit / 64Bit</td>
						<td>.exe</td>
						<td>
							<a href="[xfvalue_for-android]" target="_blank" rel="nofollow" class="download-color"><svg class="download-btn"><use xlink:href="#icon-download"></use></svg> <span>Download</span></a>
						</td>
					</tr>
					[/xfgiven_for-android]
					[xfgiven_for-ios]
					<tr>
						<td>{title} for iOS</td>
						<td>32Bit / 64Bit</td>
						<td>.exe</td>
						<td>
							<a href="[xfvalue_for-ios]" target="_blank" rel="nofollow" class="download-color"><svg class="download-btn"><use xlink:href="#icon-download"></use></svg> <span>Download</span></a>
						</td>
					</tr>
					[/xfgiven_for-ios]
					[xfgiven_for-winphone]
					<tr>
						<td>{title} for Windows Phone</td>
						<td>32Bit / 64Bit</td>
						<td>.exe</td>
						<td>
							<a href="[xfvalue_for-winphone]" target="_blank" rel="nofollow" class="download-color"><svg class="download-btn"><use xlink:href="#icon-download"></use></svg> <span>Download</span></a>
						</td>
					</tr>
					[/xfgiven_for-winphone]
				</tbody>
			</table>
		</div>
		<div class="download-info">
			<svg class="icon-check"><use xlink:href="#icon-check"></use></svg> <span>{title} is available for download free of charge and without registration.</span>
		</div>
		<div id="disqus_thread"></div>
		<script>
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