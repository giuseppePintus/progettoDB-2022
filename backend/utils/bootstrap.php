<?php
require_once("db/database.php");

define("UPLOAD_DIR", "./upload/");

$dbh = new DatabaseHelper("localhost", "root", "", "DB", 3306);

?>