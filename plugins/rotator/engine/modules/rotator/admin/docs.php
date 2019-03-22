<?php
if (!defined('DATALIFEENGINE') || !defined('LOGGED_IN')) {
	die('Hacking attempt!');
}
?>
<script src="engine/classes/highlight/highlight.code.js" defer=""></script>
<div class="panel panel-flat">
	<div class="panel-body">
		<div class="row">
			<div class="col-md-12">
				<ol>
				<li>Установить плагин через встроенную утилиту DLE (<a href="/admin.php?mod=plugins">Управление плагинами</a>)</li>
				<li>Подключить скрипт в main.tpl:
<pre><code>&lt;script src="/engine/modules/rotator/index.php"&gt;&lt;/script&gt;</code></pre></li>
				<li>В редакторе модуля создать баннера и настроить ГЕО/Устройство/ОС/и т.п</li>
				<li>В main.tpl подключить необходимые баннера:
<pre><code>&lt;script&gt;
	ITENSE_FS_BANNER_ROTATOR.writeBanners([
		{id: 'as1', name: 'banner1'},
		{id: 'as2', name: 'banner2'},
	]);
&lt;/script&gt;</code></pre></li>
			</ol>
<br>
<p>Где ID – выдуманное значение, которое нужно прописать div рекламному блоку, пример:</p>
<pre><code class="xml">&lt;div class="reklama" id="as1"&gt;
&lt;div class="col-lg-5" id="as2"&gt;</code></pre>
<h3>Параметры</h3>
<p><b>VARS</b></p>
<p>1) os - User OS</p>
<pre>Windows 10, Windows 8.1, Windows 8, Windows 7, Windows Vista, Windows Server 2003/XP x64,
Windows XP, Windows 2000, Windows ME, Windows 98, Windows 95, Windows 3.11, Mac OS X,
Mac OS 9, Linux, Ubuntu, iPhone, iPod, iPad, Android, BlackBerry, Mobile</pre>
<br>
<p>2) country - User country Alpha-2 ISO 3166-1</p>
<pre>ru, ua, us, en ....</pre>
<br>
<p>3) device - User device</p>
<pre>desktop, mobile, tablet</pre>
<br>
<p>4) browser - User web browser</p>
<pre>unknown, Opera, Opera Mini, WebTV, Internet Explorer, Pocket Internet Explorer, Konqueror,
iCab, OmniWeb, Firebird, Firefox, Iceweasel, Shiretoko, Mozilla, Amaya, Lynx,
Safari, iPhone, iPod, iPad, Chrome, Android, GoogleBot, Yahoo! Slurp, W3C Validator,
BlackBerry, IceCat, Nokia S60 OSS Browser, Nokia Browser, MSN Browser, MSN Bot, 
Yandex

SYNTAX. (!value => NOT VALUE)
var1=value1[,value2,...];var2=!value1
</code></pre>
<br>
<p>Пример заполнения:</p>
<pre><code class="php">$settings = array(
'banner1' => array(
'os=windows xp,windows vista,windows 7,windows 8,windows 8.1,windows 10;country=ru,by,uz,md,cz,am,kg,kz,tj,az,ge,ua' => array(
'Баннер реклама><!--/noindex-->', // Вывод рекламного блока пользователям у которых НЕТ Адблока.
'Баннер реклама2><!--/noindex-->', // Вывод рекламного блока пользователям у которых есть Адблок.
),
'' => 'здесь рекламный код' // вывод рекламного блока, который не подошел под все другие описанные параметры.</code></pre>

			</div>
		</div>
	</div>
</div>

<script>
	jQuery(document).ready(function($) {
		hljs.initHighlightingOnLoad();
	});
</script>