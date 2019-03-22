<?php

if (!defined('DATALIFEENGINE') || !defined('LOGGED_IN')) {
  die('Hacking attempt!');
}
/**
 * @global $member_id
 */

define('MODULE_DIR', ENGINE_DIR . '/modules/rotator');

echoheader('Ротатор баннеров', 'Модуль позволяет создавать рекламный блоки, и запускать рекламу по указанным параметрам');

include MODULE_DIR . '/admin/main.php';

echofooter();
