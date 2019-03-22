<?php
function getIp() {
    $ip = '0.0.0.0';
    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    } else if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    } else {
        $ip = $_SERVER['REMOTE_ADDR'];
    }
    $ip = explode(',', $ip);
    return $ip[0];
}

function IsMobile() {          
    return !empty($_SERVER['HTTP_USER_AGENT']) && (preg_match('/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i', $_SERVER['HTTP_USER_AGENT']) || preg_match('/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i', substr($_SERVER['HTTP_USER_AGENT'], 0, 4)));
}

function getRegionInfo() {
  $result = array('city' => '', 'region' => '', 'country' => '');
  ob_start();
  try {    
    $details = json_decode(file_get_contents("http://ipinfo.io/".getIp()));
    if(empty($details) || $details->country == '') {
      $details = json_decode(file_get_contents("https://www.iplocate.io/api/lookup/".getIp()));
      if(empty($details) || $details->country_code == '') {
        $details = json_decode(file_get_contents("http://www.geoplugin.net/json.gp?ip=".getIp()));
        if(empty($details) || $details->geoplugin_countryCode == '') {
          if(!function_exists('getCountryFromIP') && file_exists(__DIR__.'/geoiploc.php')) {
            include __DIR__.'/geoiploc.php';
          }
          $result['country'] = getCountryFromIP(getIp());
        } else {
          $result['city'] = str_replace("'", '', $details->geoplugin_city);
          $result['region'] = str_replace("'", '', $details->geoplugin_region);
          $result['country'] = str_replace("'", '', $details->geoplugin_countryCode);
        }
      } else {
        $result['city'] = str_replace("'", '', $details->city);
        $result['country'] = str_replace("'", '', $details->country_code);
      }
    } else {
      $result['city'] = str_replace("'", '', $details->city);
      $result['region'] = str_replace("'", '', $details->region);
      $result['country'] = str_replace("'", '', $details->country);
    }
       
  } catch (Exception $e) { }
  ob_get_clean();
  return $result;	
}

function rotator_clear_cache($timelife = 1200) {
    $files = scandir(PATH_CACHE);
    $idx = 0; $all = true;
    //echo '//'.count($files)."\n";
    foreach($files as $f) {
        if($f == '.' || $f == '..') {
            continue;
        }
        if(filemtime(PATH_CACHE.$f) + $timelife < time()) {
            unlink(PATH_CACHE.$f);
            //echo '//'.PATH_CACHE.$f."\n";
        }
        if(++$idx > 1000) {
            $all = false;
            break;
        }
    }
    return $all;
}

function get_cache($file, $limit = 3600) {
  if(file_exists($file) && filemtime($file) > time() - $limit) {
    return file_get_contents($file);
  }
  return null;
}

function set_cache($file, $content) {
  file_put_contents($file, $content);
}

function doLog($message) {
  if(!is_dir(__DIR__.'/../logs/')) mkdir(__DIR__.'/../logs/', 0755);
  $f = fopen(__DIR__.'/../logs/'.date('Ymd').'.log', 'a+');
  fwrite($f, date('H:i:s').': '.$message."\n");
  fclose($f);
}

function getLog($date = null) {
  if($date === null) $date = date('Ymd');
  $file = __DIR__.'/../logs/'.$date.'.log';
  return file_exists($file) ? file_get_contents($file) : '';
}

function getOs() {
    $os = "";
    if(empty($_SERVER['HTTP_USER_AGENT'])) return $os;
    $osArray = array(
  		'/windows nt 10/i'     =>  'Windows 10',
  		'/windows nt 6.3/i'     =>  'Windows 8.1',
  		'/windows nt 6.2/i'     =>  'Windows 8',
  		'/windows nt 6.1/i'     =>  'Windows 7',
  		'/windows nt 6.0/i'     =>  'Windows Vista',
  		'/windows nt 5.2/i'     =>  'Windows Server 2003/XP x64',
  		'/windows nt 5.1/i'     =>  'Windows XP',
  		'/windows xp/i'         =>  'Windows XP',
  		'/windows nt 5.0/i'     =>  'Windows 2000',
  		'/windows me/i'         =>  'Windows ME',
  		'/win98/i'              =>  'Windows 98',
  		'/win95/i'              =>  'Windows 95',
  		'/win16/i'              =>  'Windows 3.11',
  		'/macintosh|mac os x/i' =>  'Mac OS X',
  		'/mac_powerpc/i'        =>  'Mac OS 9',
  		'/linux/i'              =>  'Linux',
  		'/ubuntu/i'             =>  'Ubuntu',
  		'/iphone/i'             =>  'iPhone',
  		'/ipod/i'               =>  'iPod',
  		'/ipad/i'               =>  'iPad',
  		'/android/i'            =>  'Android',
  		'/blackberry/i'         =>  'BlackBerry',
  		'/webos/i'              =>  'Mobile'
  );
  foreach ($osArray as $regex => $value) { 
      if (preg_match($regex, $_SERVER['HTTP_USER_AGENT'])) {
          return $value;
      }
  }   
  return $os;
}

function base64Links($str) {     
  if(!is_array($str)) {
    $str = array($str);
  }
  foreach($str as $j => $s) {
    if(preg_match_all('/\{\{BASE\((.+?)\)\}\}/isu', $s, $m)) {  
      for($i = 0; $i < count($m[0]); ++$i) {
        $str[$j] = str_replace($m[0][$i], 1 ? base64_encode($m[1][$i]) : $m[1][$i], $s);
      }
    }
  }
  return $str;
}