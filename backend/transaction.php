<?php
    require_once 'utils/bootstrap.php';



$dbh->addTransaction($_GET["costo"],$_GET["data"],$_GET["formIDtra"]);
//header("Location: index.php");


    ?>