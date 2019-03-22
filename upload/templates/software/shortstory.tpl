[not-aviable=xfsearch|search]
<div class="col-lg-4 col-md-6">
	<div class="main-short main-short--[xfvalue_icon limit='20']">
		<div class="main-short__os">
			<svg><use xlink:href="#icon-[xfvalue_os]"></use></svg>
		</div>
		<div class="main-short__icon">
			<svg><use xlink:href="#[xfvalue_icon limit='20']"></use></svg>
		</div>
		<div class="short-body">
			<div class="short-title">
				<a href="{full-link}">{title}</a>
			</div>
			<i data-href="{full-link}" data-class="short-btn"><svg class="short-btn__icon"><use xlink:href="#icon-download"></use></svg> Download</i>
		</div>
	</div>
</div>
[/not-aviable]

[aviable=xfsearch]
<div class="col-12">
	<div class="faq-short d-flex">
		<div class="faq-short__icon">
			[xfgiven_icon]<svg><use xlink:href="#[xfvalue_icon limit='20']"></use></svg>[/xfgiven_icon]
			[xfgiven_logo][xfvalue_logo][/xfgiven_logo]
		</div>
		<div class="faq-short__body">
			<a href="{full-link}" class="faq-short__title">{title}</a>
			<div class="faq-short__text">{short-story limit="180"} ...</div>
		</div>
	</div>
</div>
[/aviable]

[aviable=search]
<div class="col-12">
	<div class="faq-short d-flex">
		<div class="faq-short__body">
			<a href="{full-link}" class="faq-short__title">{title}</a>
			<div class="faq-short__category">{link-category}</div>
			<div class="faq-short__text">{short-story limit="180"} ...</div>
		</div>
	</div>
</div>
[/aviable]