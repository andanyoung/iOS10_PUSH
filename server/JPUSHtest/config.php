<?php
ini_set("display_errors", "On");
require __DIR__ . '/../autoload.php';

use JPush\Client as JPush;

$app_key = '99b8b1e2a330a3e60892472d';
$master_secret = '14a951758db0786cea57fbf0';
$registration_id = 'registration_id';

$client = new JPush($app_key, $master_secret);
