<?php
if (!defined('DATALIFEENGINE') || !defined('LOGGED_IN')) {
  die('Hacking attempt!');
}

$db->query('CREATE TABLE IF NOT EXISTS `rotator_stat` (
    `date` DATE NOT NULL,
    `adblock` INT(11) NOT NULL,
    `noadblock` INT(11) NOT NULL,
    PRIMARY KEY (date)
) ENGINE=InnoDB;');
?>

<script>
  <!--
    function ChangeOption(obj, selectedOption) {

      $("#navbar-filter li").removeClass('active');
      $(obj).parent().addClass('active');
      document.getElementById('general').style.display = "none";
      document.getElementById('docs').style.display = "none";
      document.getElementById('stat').style.display = "none";
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
      <li class="active"><a id="tab-general" onclick="ChangeOption(this, 'general');" class="tip legitRipple" title="" data-original-title="Общие настройки"><i class="fa fa-cog"></i> Общие настройки</a></li>
      <li><a id="tab-docs" onclick="ChangeOption(this, 'docs');" class="tip legitRipple" title="" data-original-title="Справочная информация"><i class="fa fa-file-text-o"></i> Справочная информация</a></li>
      <li><a id="tab-stat" onclick="ChangeOption(this, 'stat');" class="tip legitRipple" title="" data-original-title="Статистика"><i class="fa fa-bar-chart"></i> Статистика</a></li>
    </ul>
  </div>
</div>

<div id="general">
  <?php include MODULE_DIR . '/admin/settings.php'; ?>
</div>
<div id="docs" style="display: none;">
  <?php include MODULE_DIR . '/admin/docs.php'; ?>
</div>
<div id="stat" style="display: none;">
  <?php include MODULE_DIR . '/admin/stat.php'; ?>
</div>

<?php if(!empty($_GET['tab'])) { ?>
<script>
var obj = document.getElementById('tab-<?php echo $_GET['tab']; ?>');
if(obj) obj.click();
</script>
<?php } ?>