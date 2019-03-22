
 <?php
/*
 * Custom Engine — кастомизация исходников CMS DLE
 *
 */

if (!defined('DATALIFEENGINE') || !defined('LOGGED_IN')) {
	die('Hacking attempt!');
}
/**
 * @global $member_id
 */

define('MODULE_DIR', ENGINE_DIR . '/modules/customen');

echoheader('Custom Engine', 'Custom Engine — кастомизация исходных файлов CMS DLE');

include MODULE_DIR . '/admin/main.php';

echofooter();