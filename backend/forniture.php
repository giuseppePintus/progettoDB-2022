<?php
    require_once 'utils/bootstrap.php';


$dbh->completeForniture($_GET["consegna"],$_GET["formIDfor"]);
    header("Location: index.php");


    ?>