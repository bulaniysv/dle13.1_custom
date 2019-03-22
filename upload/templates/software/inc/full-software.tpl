<div class="col-12">
	<article itemscope itemtype="http://schema.org/SoftwareApplication">
		<div class="title-box">
			<h1>{title}</h1>
			<div class="label-free">Free</div>
		</div>
		<div class="poster-box d-flex flex-wrap justify-content-between align-items-start">
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
                           	<div class="col-12" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
								<div class="row no-gutters">
									<meta itemprop="price" content="0"/>
									<meta itemprop="priceCurrency" content="USD"/>
									<div class="col-6">Distribution type:</div>
									<div class="col-6">Free</div>
							</div>
							</div> 
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

							<div class="col-6">Operating system:</div>
							<div class="col-6" itemprop="operatingSystem">
								[xfgiven_for-win]Windows[/xfgiven_for-win][xfgiven_for-mac], [/xfgiven_for-mac]
								[xfgiven_for-mac]macOS[/xfgiven_for-mac][xfgiven_for-linux], [/xfgiven_for-linux]
								[xfgiven_for-linux]Linux[/xfgiven_for-linux][xfgiven_for-android], [/xfgiven_for-android]
								[xfgiven_for-android]Android[/xfgiven_for-android][xfgiven_for-ios], [/xfgiven_for-ios]
								[xfgiven_for-ios]iOS[/xfgiven_for-ios][xfgiven_for-winphone], [/xfgiven_for-winphone]
								[xfgiven_for-winphone]Windows Mobile[/xfgiven_for-winphone]
							</div>
                            
							[xfgiven_dev]
							<div class="col-6">Developer:</div>
							<div class="col-6"><a href="[xfvalue_dev-url]" target="_blank" rel="nofollow">[xfvalue_dev]</a></div>
							[/xfgiven_dev]
                            
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
						<td><strong>Architecture</strong></td>
						<td><strong>Format</strong></td>
						<td><strong>Link</strong></td>
					</tr>
				</thead>
				<tbody>
					[xfgiven_for-win]
					<tr>
						<td>{title} for Windows</td>
                        <td>x-32 bit, x-64 bit</td>
                        <td>.exe</td>
                        <td>
							<a href="[xfvalue_for-win]" target="_blank" rel="nofollow" class="download-color"><svg class="download-btn"><use xlink:href="#icon-download"></use></svg> <span>Download</span></a>
						</td>
					</tr>
					[/xfgiven_for-win]
					[xfgiven_for-mac]
					<tr>
						<td>{title} for Mac</td>
                        <td>64-bit</td>
                        <td>.dmg</td>
						<td>
							<a href="[xfvalue_for-mac]" target="_blank" rel="nofollow" class="download-color"><svg class="download-btn"><use xlink:href="#icon-download"></use></svg> <span>Download</span></a>
						</td>
					</tr>
					[/xfgiven_for-mac]
					[xfgiven_for-linux]
					<tr>
						<td>{title} for Linux</td>
                        <td>x-32 bit, x-64 bit</td>
                        <td>.deb</td>
						<td>
							<a href="[xfvalue_for-linux]" target="_blank" rel="nofollow" class="download-color"><svg class="download-btn"><use xlink:href="#icon-download"></use></svg> <span>Download</span></a>
						</td>
					</tr>
					[/xfgiven_for-linux]
					[xfgiven_for-android]
					<tr>
						<td>{title} for Android</td>
                        <td>Varies with device</td>
                        <td>.apk</td>
						<td>
							<a href="[xfvalue_for-android]" target="_blank" rel="nofollow" class="download-color"><svg class="download-btn"><use xlink:href="#icon-download"></use></svg> <span>Download</span></a>
						</td>
					</tr>
					[/xfgiven_for-android]
					[xfgiven_for-ios]
					<tr>
						<td>{title} for iOS</td>
						<td>Requires iOS 8.0 or later</td>
                        <td>.ipa</td>
						<td>
							<a href="[xfvalue_for-ios]" target="_blank" rel="nofollow" class="download-color"><svg class="download-btn"><use xlink:href="#icon-download"></use></svg> <span>Download</span></a>
						</td>
					</tr>
					[/xfgiven_for-ios]
					[xfgiven_for-winphone]
					<tr>
						<td>{title} for Windows Phone</td>
                        <td>x86, x64, ARM, ARM64</td>
                        <td>.xap</td>
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