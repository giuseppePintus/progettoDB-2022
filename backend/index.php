<?php

    require_once 'utils/bootstrap.php';
    
    //use Base template
    $templateParams["pagetitle"] = "MCdonald - Home";
    $templateParams["pagename"] = "Home";
    $templateParams["usericon"] = UPLOAD_DIR . "icon.png";
    $templateParams["ristorante"]= $dbh->getRestaurant();
    $templateParams["owner"]= $dbh->getOwner();
    $templateParams["forniture"]= $dbh->notCompleteForniture();


    $templateParams["js"] = array("https://unpkg.com/axios/dist/axios.min.js","js/interaction.js");
    require 'template/base.php';
?>