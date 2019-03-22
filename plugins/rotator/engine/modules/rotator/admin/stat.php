<?php
if (!defined('DATALIFEENGINE')) {
  die("Hacking attempt!");
}

$from = empty($_GET['from']) ? date('Y-m-d', strtotime('-1 week')) : $_GET['from'];
$till = empty($_GET['till']) ? date('Y-m-d') : $_GET['till'];

$from = explode(' ', $from); $from = $from[0];
$till = explode(' ', $till); $till = $till[0];

function getPct($total, $value) {
  return round($value / $total * 100);
}

?>

<form method="get" action="/admin.php">
  <input type="hidden" name="mod" value="rotator" />
  <input type="hidden" name="tab" value="stat" />
  <div class="panel panel-default systemsettings">
    <div class="panel-heading">Фильтр</div>
    <table class="table table-striped">
      <tr>
        <td class="col-xs-3"><h6 class="media-heading text-semibold">Дата с</h6></td>
        <td class="col-xs-3">
          <input type="text" data-rel="calendar" name="from" value="<?php echo $from; ?>">
        </td>
        <td class="col-xs-3"><h6 class="media-heading text-semibold">Дата по</h6></td>
        <td class="col-xs-3">
          <input type="text" data-rel="calendar" name="till" value="<?php echo $till; ?>">
        </td>
      </tr>
    </table>
  </div>
  <div class="clearfix">
    <button type="submit" name="save" class="btn bg-teal btn-raised position-left legitRipple"><i class="fa fa-floppy-o position-left"></i> Показать</button>
  </div>
</form>

<div class="panel panel-default systemsettings" style="margin-top: 30px">
  <table class="table table-striped">
    <tr>
      <th class="col-xs-4">Дата</th>
      <th class="col-xs-4">С адблоком</th>
      <th class="col-xs-4">Без адлока</th>
    </tr>
  <?php
  $db->query('SELECT * FROM rotator_stat WHERE date BETWEEN "'.$from.'" AND "'.$till.'"');
  $total = array('adblock' => 0, 'noadblock' => 0);
  while($row = $db->get_row()) {
    foreach($row as $k => $v) {
      if(isset($total[$k])) {
        $total[$k] += $v;
      }
    }
    $pctAdblock = getPct($row['adblock'] + $row['noadblock'], $row['adblock']);
    echo '<tr>
      <td class="col-xs-4">'.$row['date'].'</td>
      <td class="col-xs-4">'.$row['adblock'].' ('.$pctAdblock.'%)</td>
      <td class="col-xs-4">'.$row['noadblock'].' ('.(100 - $pctAdblock).'%)</td>
      </tr>';
  }
  $pctAdblock = getPct($total['adblock'] + $total['noadblock'], $total['adblock']);
  ?>  
  <tr>
      <th class="col-xs-4">Итого</th>
      <th class="col-xs-4"><?php echo $total['adblock']; ?> (<?php echo $pctAdblock; ?>%)</th>
      <th class="col-xs-4"><?php echo $total['noadblock']; ?> (<?php echo 100 - $pctAdblock; ?>%)</th>
    </tr>
  </table>
  
</div>

  <section class="stat-chart">
    <h1>Итого</h1>
    <div class="static-pie-chart"><?php echo $pctAdblock; ?></div>
    <div class="stats">
        <ul>
            <li data-name="notadblock">Без адлока (<?php echo 100 - $pctAdblock; ?>%)</li>
            <li data-name="adblock">С адблоком (<?php echo $pctAdblock; ?>%)</li>
        </ul>
    </div>
</section>

<script>
  $(function() {
  $('.static-pie-chart').each(function() {
    var p = $(this).text();
    p = p.replace('%', '');
    $(this).css('animationDelay', '-' + p + 's');
  });
});
</script>

<style>
@-webkit-keyframes spin {
  to {
    transform: rotate(0.5turn);
  }
}
@-moz-keyframes spin {
  to {
    transform: rotate(0.5turn);
  }
}
@-ms-keyframes spin {
  to {
    transform: rotate(0.5turn);
  }
}
@keyframes spin {
  to {
    transform: rotate(0.5turn);
  }
}
@-webkit-keyframes bg {
  50% {
    background: #655;
  }
}
@-moz-keyframes bg {
  50% {
    background: #655;
  }
}
@-ms-keyframes bg {
  50% {
    background: #655;
  }
}
@keyframes bg {
  50% {
    background: #655;
  }
}

.static-pie-chart {
  display: inline-block;
  margin-right: 20px;
}

.static-pie-chart {
  background: #02b160;
  background-image: linear-gradient(to right, transparent 50%, #dc3838 0);
  border-radius: 50%;
  color: transparent;
  display: inline-block;
  line-height: 100px;
  position: relative;
  text-align: center;
  width: 100px;
}

.static-pie-chart:before {
  animation: spin 50s linear infinite, bg 100s step-end infinite;
  animation-delay: inherit;
  animation-play-state: paused;
  background-color: inherit;
  border-radius: 0 100% 100% 0 / 50%;
  content: '';
  height: 100%;
  left: 50%;
  position: absolute;
  transform-origin: left;
  top: 0;
  width: 50%;
}

.stats {
  display: inline-block;
}

.stat-chart ul {
   list-style: none;
}

.stat-chart li{
    position: relative;
    margin: 10px 0;
}

.stat-chart li::before {
    content: "";
    position: absolute;
    top: 2px;
    left: -25px;
    width: 15px;
    height: 15px;
    background-color: #aaaaaa;
}

.stat-chart li:first-child::before {
    background-color: #02b160;
}

.stat-chart li:nth-child(2)::before {
    background-color: #dc3838;
}
</style>