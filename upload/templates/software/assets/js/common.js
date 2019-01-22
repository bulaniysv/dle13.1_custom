	$('i[data-href]').each(function(){
		var url	 = $(this).attr("data-href"),
		text = $(this).html();
		var target = $(this).data("target") ? $(this).data("target") : '_self';
		var cls = $(this).data("class") ? $(this).data("class") : '';
		$(this).replaceWith("<a class='" + cls + "' target='" + target + "' href='" + url + "'>" + text + "</a>");
	});

	$(document).ready(function() {

		$(window).scroll(function(){
			if ($(this).scrollTop() > 300) {
				$('.scrollup').fadeIn();
			} else {
				$('.scrollup').fadeOut();
			}
		});

		$('.scrollup').click(function(){
			$("html, body").animate({ scrollTop: 0 }, 600);
			return false;
		});

		$('.tabs').delegate('li:not(.current)', 'click', function() {
			$(this).addClass('current').siblings().removeClass('current')
			.parents('.tab-contain').find('.tab-contain__box').hide().eq($(this).index()).fadeIn(200);
		})

		if (getCookie('cookies_policy') == '1') {
			$('.cookies_policy').remove();
		} else {
			$('.cookies_policy').slideDown();
		}

		$('.cookies_ok').on('click', function(event) {
			event.preventDefault();
			$('.cookies_policy').slideUp();
			setCookie('cookies_policy', 1, { expires: 3600*24*31 });
		});

		$('.cookies_policy .custom_close').on('click', function(event) {
			event.preventDefault();
			$('.cookies_policy').slideUp('fast');
		});

		$('h2, h3, h4, h5').each(function(index, value){
			$(value).attr("id", "a" + index);
			if ($(value).text()) {
				var hText = $("#a" + index).text();
				$('.anchor-links').append('<div class="anchor-links__item"><a class="anchor" href="#a' + index + '">' + hText + '</a></div>');
			}
		});

		$(".anchor-links").on('click', 'a', function (event) {
			event.preventDefault();
			var id  = $(this).attr('href'),
			top = $(id).offset().top;
			$('body,html').animate({scrollTop: top}, 1000);
		});

	});

	function setCookie(name, value, options) {
		options = options || {};
		var expires = options.expires;

		if (typeof expires == "number" && expires) {
			var d = new Date();
			d.setTime(d.getTime() + expires * 1000);
			expires = options.expires = d;
		}
		if (expires && expires.toUTCString) {
			options.expires = expires.toUTCString();
		}

		value = encodeURIComponent(value); 
		var data = name + "=" + value;

		for (var propName in options) {
			data += "; " + propName;
			var propValue = options[propName];
			if (propValue !== true) {
				data += "=" + propValue;
			}
		}

		document.cookie = data;
	}

	function getCookie(name) {
		var matches = document.cookie.match(new RegExp(
			"(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
			));
		return matches ? decodeURIComponent(matches[1]) : undefined;
	}