<?php
error_reporting(E_ALL);

define('PATH_CACHE', __DIR__.'/cache/');
define('TRIGGER_DO_LOGS', __DIR__.'/do.logs');
define('FILE_LOCKED', __DIR__.'/locked');

header('Content-type: application/javascript;charset=utf-8;');
include __DIR__.'/includes/functions.php';
include __DIR__.'/includes/browser.php';
include __DIR__.'/includes/mobileDetect.php';

if(!is_dir(PATH_CACHE)) mkdir(PATH_CACHE, 0755);

$mobile = new Mobile_Detect();
$region = getRegionInfo();
$ip = getIp();
$os = getOs();
$device = $mobile->IsTablet() ? 'tablet' : ($mobile->IsMobile() ? 'mobile' : 'desktop');
$browser = new Browser();

define('DEBUG', '188.162.52.227' == $ip);
include __DIR__.'/settings.php';
//echo $ip; exit;

$inputData = array(
  'os' => $os,
  'device' => $device,
  'country' => $region['country'],
  'browser' => $browser->getBrowser(),
  'ip' => $ip,
  '_request' => $_REQUEST
);

$cacheName = '';
foreach($inputData as $k => $v) {
  $cacheName = md5($cacheName.$k.'='.(is_array($v) ? print_r($v, true) : $v)); 
}

if(!empty($_GET['clear_cache'])) rotator_clear_cache();

if(!DEBUG && $c = get_cache(PATH_CACHE.$cacheName)) {
  die($c);
}

//if(date('i') % 30 == 0) clear_cache();

ob_start();

$banners = array();
if(!file_exists(FILE_LOCKED)) foreach($settings as $bannerName => $rules) {
  $banners[$bannerName] = '';
  foreach($rules as $rule => $code) {
    if($rule == '') {
      $banners[$bannerName] = $code;
    }   
    $ruleLines = explode(';', strtolower($rule));
    foreach($ruleLines as $part) {
      $part = trim($part);
      if(empty($part)) continue;
      list($var, $val) = explode('=', $part);
      $var = trim($var);
      $vals = explode(',', $val);
      $isValidRule = false;
      foreach($vals as $val) {
        $val = trim($val);
        if(!isset($inputData[$var])) {
          continue;
        }
        if( ($val != '' && $val[0] == '!' && strtolower($inputData[$var]) == substr($val, 1))
          || strtolower($inputData[$var]) != $val) {
          //echo $bannerName.' '.$rule.' => fail '.$inputData[$var].' = '.$val."\n";
        } else {
          $isValidRule = true;
          break;
        }
      }
      if(!$isValidRule) {
        continue 2;
      }
    }
    if(!is_array($code)) {
      $code = array($code);
    }
    for($ci = 0, $cic = count($code); $ci < $cic; ++$ci) {
      if(preg_match_all('/\{([a-z0-9]+)\}/isu', $code[$ci], $vars)) {
        for($i = 0, $c = count($vars[0]); $i < $c; ++$i) {
        	$val = !empty($_REQUEST[$vars[1][$i]]) ? $_REQUEST[$vars[1][$i]] : '';
        	/*if($vars[0][$i] == '{name}') {
        		$val = str_replace('Microsoft', '', $val);
        	}*/
        	$val = trim($val);
          $code[$ci] = str_replace($vars[0][$i], empty($val) ? '' : $vars[1][$i].'='.$val, $code[$ci]);  
        }
      }
      $code[$ci] = str_replace('&&', '&', $code[$ci]);
    }
    $banners[$bannerName] = base64Links($code);
    break;
  }
}

//print_r($banners); exit;

if(file_exists(TRIGGER_DO_LOGS)) {
  doLog('IP: '.$ip.', OS: '.$os.', DEVICE: '.$device.', COUNTRY: '.$region['country'].', BROWSER: '.$browser->getBrowser());
  doLog(print_r($banners, true));
}
          
?>
"use strict";

function fsAjaxRequest(type, url, params, success, err) {
  type = type.toUpperCase();
  success = success || function() {};
  err = err || function() {};
  params = params || '';
  var xhr = new XMLHttpRequest();
  xhr.open(type, url, true);
  if(type == 'POST') {
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
  }
  xhr.send(params); 
  xhr.onreadystatechange = function() { 
    if (xhr.readyState != 4) return;
    if (xhr.status != 200) {
      err(xhr);
    } else {
      success(xhr.responseText, xhr);
    }
  };
}

function fsSetCookie(name, value, options) {
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

function fsGetCookie(name) {
  var matches = document.cookie.match(new RegExp(
    "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
  ));
  return matches ? decodeURIComponent(matches[1]) : undefined;
}

function insertAndExecute(obj, text) {
    if(!obj) return;
    obj.innerHTML = text;
    var scripts = Array.prototype.slice.call(obj.getElementsByTagName("script"));
    for (var i = 0; i < scripts.length; i++) {
        if (scripts[i].src != "") {
            var tag = document.createElement("script");
            tag.src = scripts[i].src;
            document.getElementsByTagName("head")[0].appendChild(tag);
        } else {
            eval(scripts[i].innerHTML);
        }
    }
}

var ITENSE_FS_BANNER_ROTATOR = {
  adblock: -1, //comment for disable
  os: '<?php echo $os; ?>',
  device: '<?php echo $device; ?>',
  ip: '<?php echo $ip; ?>',
  browser: '<?php echo $browser->getBrowser(); ?>',
  country: '<?php echo $region['country'] ?>',
  banners: <?php echo json_encode($banners); ?>,
  writeBanner: function(id, name) {
    if(ITENSE_FS_BANNER_ROTATOR.banners[name]) {
      var i = setInterval(function() {
        if(typeof(window.ITENSE_FS_BANNER_ROTATOR.adblock) == 'undefined') {
          window.ITENSE_FS_BANNER_ROTATOR.adblock = 0;
        }
        if(window.ITENSE_FS_BANNER_ROTATOR.adblock < 0) {
          return;  
        }
        var o = document.getElementById(id), html = ITENSE_FS_BANNER_ROTATOR.banners[name][ITENSE_FS_BANNER_ROTATOR.adblock]
          ? ITENSE_FS_BANNER_ROTATOR.banners[name][ITENSE_FS_BANNER_ROTATOR.adblock]
          : ITENSE_FS_BANNER_ROTATOR.banners[name][0];
        insertAndExecute(o, html);
        /*if(o) o.innerHTML = ITENSE_FS_BANNER_ROTATOR.banners[name][ITENSE_FS_BANNER_ROTATOR.adblock]
          ? ITENSE_FS_BANNER_ROTATOR.banners[name][ITENSE_FS_BANNER_ROTATOR.adblock]
          : ITENSE_FS_BANNER_ROTATOR.banners[name][0];*/
          
        if(!fsGetCookie('rotator-stat')) {
          fsAjaxRequest('POST', '/engine/modules/rotator/stat.php', 'adblock=' + ITENSE_FS_BANNER_ROTATOR.adblock); 
          fsSetCookie('rotator-stat', 1, { path: '/', expires: 86400*365 }); 
        }
        clearInterval(i);
      }, 100);
    }
  },
  writeBanners: function(data) {
    for(var i = 0; i < data.length; ++i) {
      ITENSE_FS_BANNER_ROTATOR.writeBanner(data[i].id, data[i].name);
    }
  }                      
};

ITENSE_FS_BANNER_ROTATOR.isMobile = ITENSE_FS_BANNER_ROTATOR.device != 'desktop';   

var fad = document.createElement('script');
fad.src = '/engine/modules/rotator/js/fad.js';
fad.onload = function() {
    
}
document.getElementsByTagName('head')[0].appendChild(fad);

<?php
$js = ob_get_clean();  

if(preg_match('/(notice|warning|error)/isu', $js)) {
  mail(NOTIFY_EMAIL, 'Rotator error '.$_SERVER['SERVER_NAME'], $js, "From: robot@".$_SERVER['SERVER_NAME']."\r\n");
}

include __DIR__.'/includes/js.php';
$js = JsMinifier::minify($js);
//$packer = new JavaScriptPacker($js, 'Normal', true, false);
//$js = $packer->pack();

set_cache(PATH_CACHE.$cacheName, $js);

echo $js;  