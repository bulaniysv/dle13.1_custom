<?php
	if (!defined('DATALIFEENGINE') || !defined('LOGGED_IN')) {
		die('Hacking attempt!');
	}
?>

<div class="panel">

	<div class="panel-header">
		<ul class="nav nav-tabs nav-tabs-left">
			<li class="active"><a href="#tabmain" data-toggle="tab">Документация</a></li>
		</ul>
	</div>

	<div class="panel-content">
		<div class="tab-content">

			<div class="tab-pane active" id="tabmain">
				<div class="panel-body">
					<?php include MODULE_DIR . '/admin/documentation.php'; ?>
				</div>
			</div>

		</div>
	</div>

</div>