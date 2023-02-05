<?php
    require_once 'utils/bootstrap.php';
    

     
    $dbh->register($_GET["email"] ,$_GET["telefono"] ,$_GET["stipendio"] , 0 ,$_GET["iban"] ,
    $_GET["fine_contratto"] ,$_GET["nome"] ,$_GET["cognome"] ,$_GET["residenza"] 
    ,$_GET["inizio_contratto"] ,$_GET["formIDris"] );

    header("Location: index.php");


?>