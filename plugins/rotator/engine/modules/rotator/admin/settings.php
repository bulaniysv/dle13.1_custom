<?php
if (!defined('DATALIFEENGINE')) {
  die("Hacking attempt!");
}

define('PATH_CACHE', MODULE_DIR.'/cache/');
define('TRIGGER_DO_LOGS', MODULE_DIR.'/do.logs');
define('FILE_LOCKED', MODULE_DIR.'/locked');
define('FILE_STOP_WORDS', MODULE_DIR.'/stop.words');

$file = MODULE_DIR.'/settings.php';
include MODULE_DIR.'/includes/functions.php';
if($_POST) {
  $wasLocked = file_exists(FILE_LOCKED);
  if(isset($_POST['lock'])) {
    if(!$wasLocked) $_POST['clear-cache'] = 1;
    file_put_contents(FILE_LOCKED, '');
  } else if($wasLocked) {
    $_POST['clear-cache'] = 1;
    unlink(FILE_LOCKED);
  }
  if(!empty($_POST['code'])) {
    file_put_contents($file, $_POST['code']);
  }
  if(!empty($_POST['clear-cache'])) {
    while(!rotator_clear_cache(0)) { }  
  }
  $sw = explode(',', $_POST['stop-words']);
  $swr = array();
  foreach($sw as $w) {
    $w = trim($w);
    if(!empty($w)) {
      $swr[] = $w;  
    }
  }
  file_put_contents(FILE_STOP_WORDS, implode(',', $swr));
if(isset($_POST['logs'])) {
  file_put_contents(TRIGGER_DO_LOGS, '');
} else {
  if(file_exists(TRIGGER_DO_LOGS)) unlink(TRIGGER_DO_LOGS);
}
} 
$protocol = !empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off' ? 'https://' : 'http://';
?>
<form method="POST" action="<?php echo $protocol.str_replace('//', '/', $_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI']); ?>">
  <div class="panel panel-default systemsettings">
    <div class="panel-heading">Настройка правил показа блоков</div>
    <table class="table table-striped">
      <tr>
        <td class="col-xs-6"><h6 class="media-heading text-semibold">Отключить:</h6></td>
        <td class="col-xs-6">
          <input class="switch" type="checkbox" name="lock" <?php echo file_exists(FILE_LOCKED) ? 'checked' : ''; ?>>
        </td>
      </tr>
      <tr>
        <td class="col-xs-6"><h6 class="media-heading text-semibold">Очистить кеш после сохранения:</h6></td>
        <td class="col-xs-6">
          <input class="switch" type="checkbox" name="clear-cache">
        </td>
      </tr>
      <tr>
        <td class="col-xs-6"><h6 class="media-heading text-semibold">Вести логи:</h6></td>
        <td class="col-xs-6">
          <input class="switch" type="checkbox" name="logs" <?php echo file_exists(TRIGGER_DO_LOGS) ? 'checked' : ''; ?>>
        </td>
      </tr>
      <tr>
        <td class="col-xs-6"><h6 class="media-heading text-semibold">Стоп слова (через запятую):</h6></td>
        <td class="col-xs-6">
          <textarea name="stop-words" style="width:100%"><?php echo file_get_contents(FILE_STOP_WORDS); ?></textarea>
        </td>
      </tr>
      
    </table>
    <textarea class="classic" style="display: none" id="code-area" name="code"><?php echo file_exists($file) ? file_get_contents($file) : ''; ?></textarea>
    <div style="height:700px" id="code"></div>
    <div>
      <textarea class="classic" id="last-logs" readonly style="min-width:100%;max-width:100%;width:100%;height:300px;display:none"><?php echo getLog(); ?></textarea>
    </div>
  </div>
  <div class="clearfix">
    <input type="button" onclick="var l=document.getElementById('last-logs');l.style.display=l.style.display=='none'?'block':'none';" class="btn bg-teal btn-raised position-left legitRipple" value="Последние логи" />
    <button type="submit" name="save" class="btn bg-teal btn-raised position-left legitRipple"><i class="fa fa-floppy-o position-left"></i> Сохранить</button>
  </div>
</form>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.2/ace.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.2/mode-php.js"></script>  
<style>
  .ace-tm .ace_print-margin {background: transparent;}
</style>
<script>
  var editor = ace.edit("code", {
    mode: "ace/mode/php",
    selectionStyle: "text"
  }), textarea = document.getElementById('code-area');
  editor.getSession().setValue(textarea.value);
  editor.getSession().on('change', function(){
    textarea.value = editor.getSession().getValue();
  });
</script>