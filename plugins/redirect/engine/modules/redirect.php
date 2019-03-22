<?php
if( ! defined( 'DATALIFEENGINE' ) ) {
	die( "Hacking attempt!" );
}
       
$e = explode("hash=",$_SERVER['REQUEST_URI']);
if(!empty($e[1])) {
	$_GET['hash'] = $e[1];
}

$_GET["hash"] = str_replace(" ","+",$_GET["hash"]); 
$hash = base64_decode(($_GET["hash"])); 

$ex = explode("%%%", $hash); 
//print_r($ex);


$redirect_config = @unserialize(@file_get_contents('redirect_config.cfg'));    

if($redirect_config['off']) {
  header('HTTP/1.0 404 Not Found');
  die('<meta http-equiv="refresh" content="0;/">');
}

if(!$redirect_config['ubar'] && strpos($ex[0], '?in=') !== false) {
  $ex[0] = str_replace('file-download=', '', $ex[3]);
} 

if(!empty($ex[2])){
	$tpl->load_template( $ex[2] );
}
else{
	$tpl->load_template( 'redirect.tpl' );
}

if( $config['allow_banner'] ) include_once ENGINE_DIR . '/modules/banners.php';

if( $config['allow_banner'] AND count( $banners ) ) {
	
	foreach ( $banners as $name => $value ) {
		$tpl->copy_template = str_replace( "{banner_" . $name . "}", $value, $tpl->copy_template );

		if ( $value ) {
			$tpl->copy_template = str_replace ( "[banner_" . $name . "]", "", $tpl->copy_template );
			$tpl->copy_template = str_replace ( "[/banner_" . $name . "]", "", $tpl->copy_template );
		}
	}
}

$tpl->set_block( "'{banner_(.*?)}'si", "" );
$tpl->set_block ( "'\\[banner_(.*?)\\](.*?)\\[/banner_(.*?)\\]'si", "" );

if( strpos( $tpl->copy_template, "[catlist=" ) !== false ) {
	$tpl->copy_template = preg_replace_callback ( "#\\[(catlist)=(.+?)\\](.*?)\\[/catlist\\]#is", "check_category", $tpl->copy_template );
}
						
if( strpos( $tpl->copy_template, "[not-catlist=" ) !== false ) {
	$tpl->copy_template = preg_replace_callback ( "#\\[(not-catlist)=(.+?)\\](.*?)\\[/not-catlist\\]#is", "check_category", $tpl->copy_template );
}

$_config = unserialize(file_get_contents("redirect_config.cfg")); 

if (!isset($_GET["hash"]) || empty($_GET["hash"])) {
	 echo "internal error"; die(); 
} 

//print_r($ex);

$url = $ex[0]; 
$title = $ex[1];

$url = html_entity_decode($url, ENT_QUOTES, 'UTF-8');
$url = preg_replace('/https?:\/\/(https?:\/\/)/isu', '\1', $url);

$timeout = $_config["timeout"];

$tpl->set('{url}',$url);
$tpl->set('{title}',$title);
$tpl->set('{timeout}',$timeout);

$data = array();
$c = count($ex);
for($i = 3; $i < $c; $i++){
	$ex[$i] = explode('=',$ex[$i]);
	$data[$ex[$i][0]] = $ex[$i][1];
}
            
foreach($data as $key => $val){
	if(empty($val)){
		$tpl->copy_template = preg_replace( "#\[not-empty_{$key}\](.*?)\[/not-empty_{$key}\]#is", "", $tpl->copy_template );
	}
	else{
		$tpl->copy_template = str_replace( "[not-empty_{$key}]", "", $tpl->copy_template );
		$tpl->copy_template = str_replace( "[/not-empty_{$key}]", "", $tpl->copy_template );
	}
}

foreach($data as $key => $val){
	$tpl->set('{'.$key.'}',$val);
}

$metatags['title'] = $title." || ".$metatags['title'];

$tpl->compile( 'content' );

$tpl->clear();

