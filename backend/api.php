<?php
require_once("utils/bootstrap.php");

$rawData = file_get_contents('php://input');
$data = json_decode($rawData, true);
$idrest = $data["ristoranteID"];
$owner = $data["owner"];
header('Content-Type: application/json');
switch ($data["query"]) {
    case 8:
        $result = $dbh->bestPlateInRestaurant($idrest);
        echo $result[0]["nome"]."  ".$result[0]["vendite"];
        break;
    case 3:
        $result = $dbh->monthBalanceInRestaurant($idrest);
        foreach ($result as $month):
            echo "mese " . $month["mese"] . "<br> bilancio :" . $month["bilancio_mese"];
        endforeach;
        break;
    case 5:
        $result = $dbh->earnByFranchisee($owner);
        foreach ($result as $month):
            echo "mese " . $month["mese"] . "<br>ricavo :" . $month["ricavo"];
        endforeach;
        break;
    case 1:
        $result = $dbh->moreCostlyRestaurant();
        echo $result[0]["nome"] . " " . $result[0]["media_transazione"];
        break;
    case 7:
        $result = $dbh->best5Plate();
        foreach ($result as $plate):
            echo $plate["nome_piatto"]." ".$plate["vendite_settimanali"]."<br>" ;
        endforeach;
        break;
    case 9:
        $result = $dbh->bestFood();
        echo "".$result[0]["nome"]." n° vendite  ".$result[0]["vendite_mensili"];
        break;
    case 10:
        $result = $dbh->totalBalance();
        echo "bilancio annuale  ".$result[0]["bilancio"];
        break;
}

?>