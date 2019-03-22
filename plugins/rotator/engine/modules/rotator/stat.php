<?php
error_reporting(E_ALL);

define('DATALIFEENGINE', true);
include  __DIR__.'/../../classes/mysql.php';
include __DIR__.'/../../data/dbconfig.php';

$adblock = empty($_REQUEST['adblock']) ? 0 : 1;

//$db->query('DROP TABLE `rotator_stat`');

$db->query('CREATE TABLE IF NOT EXISTS `rotator_stat` (
    `date` DATE NOT NULL,
    `adblock` INT(11) NOT NULL,
    `noadblock` INT(11) NOT NULL,
    PRIMARY KEY (date)
) ENGINE=InnoDB;');

$db->query('INSERT INTO rotator_stat (date, adblock, noadblock) VALUES 
  ("'.date('Y-m-d').'", "'.($adblock ? 1 : 0).'", "'.($adblock ? 0 : 1).'")
  ON DUPLICATE KEY UPDATE 
    adblock = adblock + '.($adblock ? 1 : 0).', 
    noadblock = noadblock + '.($adblock ? 0 : 1)
);

$db->close();  
//$test = $db->super_query('SELECT * FROM rotator_stat');
//print_r($test);