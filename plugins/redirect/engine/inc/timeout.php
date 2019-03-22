<?PHP
/*
=====================================================
 DataLife Engine - by SoftNews Media Group
-----------------------------------------------------
 http://dle-news.ru/
-----------------------------------------------------
 Copyright (c) 2004,2015 SoftNews Media Group
=====================================================
 Данный код защищен авторскими правами
=====================================================
 Файл: help.php
-----------------------------------------------------
 Назначение: помощь
=====================================================
*/
if (!defined('DATALIFEENGINE')) {
    die("Hacking attempt!");
}

echoheader("REDIRECT TIMEOUT", "Redirect with timeout");
$protocol = !empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off' ? 'https://' : 'http://';

$fileexec = '<?php $config = unserialize(file_get_contents("redirect_config.cfg")); if (!isset($_GET["hash"]) || empty($_GET["hash"])) { echo "internal error"; die(); } $_GET["hash"] = str_replace(" ","+",$_GET["hash"]); $hash = base64_decode(($_GET["hash"])); $ex = explode("%%%", $hash); $url = $ex[0]; $title = $ex[1]; $timeout = $config["timeout"] ?>';
$module_config = unserialize(file_get_contents('redirect_config.cfg'));
$module_config['filecontent'] = @file_get_contents($module_config['filename']);
$module_config['filecontent'] = preg_replace('/<\?php \$config(.*?)\?>/','',$module_config['filecontent']);
if(isset($_POST['save'])) {
    foreach($_POST['fields'] as $field) {
        $fields[$field]['value'] = true;
    }
	  foreach($_POST['transmit'] as $field) {
        $fields[$field]['transmit'] = true;
    }
    $_config['fields'] = $fields;
    $_config['attach'] = $_POST['attach'];
    $_config['timeout'] = $_POST['timeout'];
    $_config['filename'] = $_POST['filename'];
    $_config['off'] = $_POST['off'];
    $_config['modal_time'] = (int)$_POST['modal_time'];
    $_config['modal'] = $_POST['modal'];
	$_config['ubar'] = $_POST['ubar'];
	$_config['ubarId'] = $_POST['ubarId'];
	$_config['ubarImg'] = $_POST['ubarImg'];
    $_config['url'] = $config['http_home_url'].$_POST['url'];
    if($module_config['filename']!=$_POST['filename'] || !file_exists($_POST['filename'])) {
        @unlink($module_config['filename']);
    }
    file_put_contents($_POST['filename'],$fileexec."".$_POST['filecontent']);
    file_put_contents('redirect_config.cfg',serialize($_config));
    header("Location: ".$_SERVER['REQUEST_URI']);
}

echo '
<script>
	<!--
		function ChangeOption(obj, selectedOption) {

			$("#navbar-filter li").removeClass("active");
			$(obj).parent().addClass("active");
			document.getElementById("general").style.display = "none";
			document.getElementById("docs").style.display = "none";
			document.getElementById(selectedOption).style.display = "";

			return false;

		}
//-->
</script>

<div class="navbar navbar-default navbar-component navbar-xs systemsettings">
	<ul class="nav navbar-nav visible-xs-block">
		<li class="full-width text-center">
			<a data-toggle="collapse" data-target="#navbar-filter" class="legitRipple"><i class="fa fa-bars"></i></a>
		</li>
	</ul>
	<div class="navbar-collapse collapse" id="navbar-filter">
		<ul class="nav navbar-nav">
			<li class="active"><a onclick="ChangeOption(this, \'general\');" class="tip legitRipple" title="" data-original-title="Общие настройки"><i class="fa fa-cog"></i> Общие настройки</a></li>
			<li><a onclick="ChangeOption(this, \'docs\');" class="tip legitRipple" title="" data-original-title="Справочная информация"><i class="fa fa-file-text-o"></i> Справочная информация</a></li>
		</ul>
	</div>
</div>

<div id="general">
<form action="'.$protocol.str_replace('//', '/', $_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI']).'" method="POST">
        <div class="panel panel-default systemsettings">
          <div class="panel-heading">Настройка модуля Redirect with timeout</div>
<table class="table table-striped">
<tr>
<td class="col-xs-6"><h6 class="media-heading text-semibold">Отключить редирект:</h6></td>
<td class="col-xs-6">
    <input class="switch" type="checkbox" name="off" value="1" style="display: none;" '.($module_config['off'] ? 'checked' : '').'>
</td>
</tr>
<tr>
<td class="col-xs-6"><h6 class="media-heading text-semibold">Использовать uBar:</h6></td>
<td class="col-xs-6">
    <input class="switch" type="checkbox" name="ubar" value="1" style="display: none;" '.($module_config['ubar'] ? 'checked' : '').'>
</td>
</tr>
<tr>
<td class="col-xs-6"><h6 class="media-heading text-semibold">Показывать модал соц. сетей:</h6></td>
<td class="col-xs-6">
    <input class="switch" type="checkbox" name="modal" value="1" style="display: none;" '.($module_config['modal'] ? 'checked' : '').'>
</td>
</tr>
<tr>
<td class="col-xs-6"><h6 class="media-heading text-semibold">Время ожидания в модале:</h6></td>
<td class="col-xs-6">
    <input type="number" min="1" name="modal_time" value="'.($module_config['modal_time'] ? $module_config['modal_time'] : 10).'" >
</td>
</tr>
<tr>
<td class="col-xs-6">
    <h6 class="media-heading text-semibold">ID для uBar:</h6>
    <span class="text-muted text-size-small">Заполнять в том случае, если используется uBar</span>
</td>
<td class="col-xs-6">
    <input type="text" class="form-control" name="ubarId" value="'.$module_config['ubarId'].'">
</td>
</tr>
<tr>
<td class="col-xs-6">
<h6 class="media-heading text-semibold">Картинка для uBar:</h6>
<span class="text-muted text-size-small">Заполнять в том случае, если используется uBar</span>
</td>
<td class="col-xs-6">
<input type="text" class="form-control" name="ubarImg" value="'.$module_config['ubarImg'].'">
</td>
</tr>
<table class="table table-striped">
<tr>
<td class="col-xs-6">
<h6 class="media-heading text-semibold">Редирект:</h6>
<span class="text-muted text-size-small">Дополнительное поле, содержащее ссылку на которую производится перенаправление</span>
</td>
<td class="col-xs-6">
<script>
$(document).ready(function() {
    $(".fields-list").chosen({no_results_text: "Oops, nothing found!"});
});
</script>
<select data-placeholder="Выберите поля" multiple class="fields-list" name="fields[]">';
$xfields = xfieldsload();
$transmit = '';
foreach($xfields as $xf) {
  $transmit .= '<input type="checkbox" name="transmit[]" value="'.$xf[0].'" checked style="display:none" />';
	echo '<option value="'.$xf[0].'" '.($module_config['fields'][$xf[0]]['value'] ? 'selected' : '').'>'.$xf[0].'</option>';
}
echo '</select>'.$transmit.'</td></tr></table>

<table class="table table-striped">
<tr>
<td class="col-xs-6">
<h6 class="media-heading text-semibold">Задержка редиректа:</h6>
<span class="text-muted text-size-small">Через сколько секунд пользователю отдавать файл</span>
</td>
<td class="col-xs-6">
 <input type="text" class="form-control" name="timeout" value="'.$module_config['timeout'].'" />
</td>
</tr>
<tr>
<td class="col-xs-6">
<h6 class="media-heading text-semibold">URL редиректа:</h6>
<span class="text-muted text-size-small">По умолчанию <strong>redirect.html</strong></span>
</td>
<td class="col-xs-6">
 <input type="text" class="form-control" name="url" value="'.str_replace($config['http_home_url'], '', $module_config['url']).'" />
</td>
</tr>
<!--Страница редиректа: <input type="text" name="filename" value="'.$module_config['filename'].'" />-->
<!--<textarea name="filecontent" style="height:300px;width: 100%;">'.$module_config['filecontent'].'</textarea>-->
</table>
</div>
<div class="clearfix">
<div style="margin-bottom:30px;">
<button type="submit" name="save" class="btn bg-teal btn-raised position-left legitRipple"><i class="fa fa-floppy-o position-left"></i> Сохранить</button>
</div>
</div>
</form>

	<div class="alert alert-warning alert-styled-left alert-arrow-left alert-component">
		<b style="margin-bottom:10px;">Внимание:</b><br>
		<p>Для корректной работы модуля необходимо добавить изменениe в корневой файл <b>.htaccess</b></p>
		<p>Найти:</p>
<pre>RewriteRule ^statistics.html$ index.php?do=stats [L]</pre>
		<p>После добавить:</p>
<pre>RewriteRule ^redirect.html$ index.php?do=redirect [L]</pre>
	</div>
</div>
<div id="docs" style="display: none;">
	<div class="panel panel-flat">
<div class="panel-body">
	<div class="row">
		<div class="col-md-12">
			<h3>Теги для полной новости </h3>
			<p>
				В любом случае подставляет ссылку на uBar. <br>
				К ссылке можно добавить @tmp=имя_шаблона.tpl. Дописывать @tmp=... не обязательно. <br>
				По умолчанию используется шаблон redirect.tpl
			</p>
<pre>[ubar-link-http://download.com@tmp=new-redirect.tpl]</pre>
			<p>
				подставляется ссылка на скачивание (ubar/прямая). Зависит от настройки на странице модуля. <br>
				К ссылке можно добавить @tmp=имя_шаблона.tpl. Дописывать @tmp=... не обязательно. <br>
				По умолчанию используется шаблон redirect.tpl 
			</p>
<pre>[redirect-link-http://download.com@tmp=new-redirect.tpl]</pre>
			<p>
				подставляется ссылка на скачивание (ubar/прямая). Зависит от настройки на странице модуля. Ссылка храниться в доп. поле.<br>
				К ссылке можно добавить @tmp=имя_шаблона.tpl. Дописывать @tmp=... не обязательно. <br>
				По умолчанию используется шаблон redirect.tpl 
			</p>
<pre>[xfvalue_имя_дополнительного_поля@tmp=new-redirect.tpl]</pre>
		</div>
		<div class="col-md-12">
			<h3>Шаблон страницы редиректа</h3>
			<p>Добавлена поддержка родного тега. Разметка будет показана только для категорий 1,2,3</p>
<pre>[catlist=1,2,3]
разметка
[/catlist]</pre>
			<p>Разметка будет показана для всех категорий кроме 1,2,3</p>
<pre>[not-catlist=1,2,3]
разметка
[/not-catlist]</pre>
<p>Подстановка данных</p>
<pre>{url} - ссыла на скачивание
{title} - заголовок
{timeout} - стартовое значение таймера
{имя_доп_поля} - подставить значение доп. поля в шаблон (пример - {fname}). Список доп. полей для передачи на редирект составляеться в админке. 
</pre>
			<p>Новый тег. Работает только для доп. полей. Разметка внутри тега не будет показана, если доп. поле пусто.</p>
<pre>[not-empty-имя-доп-поля]
разметка
[/not-empty_имя-доп-поля]
пример:
[not-empty_name]
разметка для {name}
[/not-empty_name]</pre>
		</div>
	</div>              
</div>
</div>
</div>

';

echofooter();

?>