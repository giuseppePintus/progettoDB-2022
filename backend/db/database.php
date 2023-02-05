<?php
class DatabaseHelper
{
    private $db;

    public function __construct($servername, $username, $password, $dbname, $port)
    {
        $this->db = new mysqli($servername, $username, $password, $dbname, $port);
        if ($this->db->connect_error) {
            die("Connection failed: " . $this->db->connect_error);
        }
    }
    public function getRestaurant()
    {
        $stmt = $this->db->prepare("SELECT * 
        FROM RISTORANTE;");
        //$stmt->bind_param('i', $n);
        $stmt->execute();
        $result = $stmt->get_result();

        return $result->fetch_all(MYSQLI_ASSOC);
    }
    public function getOwner()
    {
        $stmt = $this->db->prepare("SELECT * 
        FROM PERSONALE WHERE percentuale != 0;");
        $stmt->execute();
        $result = $stmt->get_result();

        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function register(
        $email,
        $telefono,
        $stipendio,
        $percentuale,
        $IBAN,
        $fine_contratto,
        $nome,
        $cognome,
        $residenza,
        $inizio_contratto,
        $id_ristorante
    )
    {

        $stmt = $this->db->prepare("INSERT INTO `PERSONALE` (`id_personale`, `email`, `telefono`, 
        `stipendio`, `percentuale`, `IBAN`, `fine_contratto`, `nome`, `cognome`, `residenza`, 
        `inizio_contratto`, `id_ristorante`) VALUES (NULL, ?, ?, ?, ?, ?, ?,
         ?, ?, ?, ?, ?);");
        $stmt->bind_param(
            'ssdissssssi',
            $email,
            $telefono,
            $stipendio,
            $percentuale,
            $IBAN,
            $fine_contratto,
            $nome,
            $cognome,
            $residenza,
            $inizio_contratto,
            $id_ristorante
        );
        $stmt->execute();

    }
    public function addTransaction($cost,$data,$id)
    {
        $stmt = $this->db->prepare("INSERT INTO `TRANSAZIONE` (`costo_totale`, `data`, `id_transazione`, `id_ristorante`) 
        VALUES (?, '?', NULL, ?);");
        echo "$cost,$data,$id";
        $stmt->bind_param("dsi",$cost,$data,$id);
        $stmt->execute();

    }
    public function completeForniture($date, $id)
    {
        $stmt = $this->db->prepare("UPDATE `RIFORNIMENTO` SET `data_consegna` = ? 
            WHERE `RIFORNIMENTO`.`id_rifornimento` = ?;");
        echo "$date, $id";
        $stmt->bind_param('si', $date, $id);
        $stmt->execute();
    }

    public function notCompleteForniture()
    {
        $stmt = $this->db->prepare("SELECT rf.id_rifornimento ,f.nome, i.nome as innome, rf.data_richiesta 
        FROM `RIFORNIMENTO` as rf, INGREDIENTE as i , FORNITORI as f,RISTORANTE as rs 
        WHERE  rf.id_ristorante = rs.id_ristorante AND f.id_fornitori = rf.id_fornitori 
        AND i.id_ingrediente = rf.id_ingrediente AND rf.data_consegna is NULL;");
        $stmt->execute();
        $result = $stmt->get_result();

        return $result->fetch_all(MYSQLI_ASSOC);
    }
    public function bestPlateInRestaurant($id)
    {
        $stmt = $this->db->prepare("SELECT PIATTO.nome, SUM(acquisto_piatto.quantita) AS vendite
        FROM RISTORANTE
        JOIN TRANSAZIONE ON RISTORANTE.id_ristorante = TRANSAZIONE.id_ristorante
        JOIN acquisto_piatto ON TRANSAZIONE.id_transazione = acquisto_piatto.id_transazione
        JOIN PIATTO ON acquisto_piatto.id_piatto = PIATTO.id_piatto
        WHERE RISTORANTE.id_ristorante = ?
        GROUP BY acquisto_piatto.id_piatto
        ORDER BY vendite DESC
        LIMIT 1;");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();

        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function monthBalanceInRestaurant($id)
    {
        $stmt = $this->db->prepare("SELECT DATE_FORMAT(TRANSAZIONE.data, '%Y-%m') AS mese, 
        SUM(TRANSAZIONE.costo_totale) - SUM(RIFORNIMENTO.costo) AS bilancio_mese 
        FROM RISTORANTE JOIN TRANSAZIONE ON RISTORANTE.id_ristorante = TRANSAZIONE.id_ristorante 
        LEFT JOIN RIFORNIMENTO ON RISTORANTE.id_ristorante = RIFORNIMENTO.id_ristorante 
        AND DATE_FORMAT(RIFORNIMENTO.data_consegna, '%Y-%m') = DATE_FORMAT(TRANSAZIONE.data, '%Y-%m') 
        WHERE RISTORANTE.id_ristorante = ? GROUP BY mese ORDER BY mese;");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();

        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function earnByFranchisee($id)
    {
        
        $stmt = $this->db->prepare("SELECT DATE_FORMAT(TRANSAZIONE.data, '%Y-%m') AS mese, 
        (SUM(TRANSAZIONE.costo_totale) - SUM(RIFORNIMENTO.costo)) * (PERSONALE.percentuale / 100) AS ricavo 
        FROM RISTORANTE JOIN TRANSAZIONE ON RISTORANTE.id_ristorante = TRANSAZIONE.id_ristorante 
        LEFT JOIN RIFORNIMENTO ON RISTORANTE.id_ristorante = RIFORNIMENTO.id_ristorante 
        AND DATE_FORMAT(RIFORNIMENTO.data_richiesta, '%Y-%m') = DATE_FORMAT(TRANSAZIONE.data, '%Y-%m') 
        JOIN PERSONALE ON PERSONALE.id_personale = ? GROUP BY mese ORDER BY mese;");

        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();

        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function moreCostlyRestaurant()
    {
        $stmt = $this->db->prepare("SELECT 
        RISTORANTE.locazione AS nome, 
        AVG(TRANSAZIONE.costo_totale) AS media_transazione
      FROM RISTORANTE
      JOIN TRANSAZIONE ON RISTORANTE.id_ristorante = TRANSAZIONE.id_ristorante
      GROUP BY RISTORANTE.id_ristorante
      ORDER BY media_transazione DESC
      LIMIT 1;");
        $stmt->execute();
        $result = $stmt->get_result();

        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function best5Plate()
    {
        $stmt = $this->db->prepare("SELECT 
        PIATTO.nome AS nome_piatto, 
        SUM(acquisto_piatto.quantita) AS vendite_settimanali
      FROM acquisto_piatto
      JOIN PIATTO ON acquisto_piatto.id_piatto = PIATTO.id_piatto
      JOIN TRANSAZIONE ON acquisto_piatto.id_transazione = TRANSAZIONE.id_transazione
      WHERE TRANSAZIONE.data >= DATE_SUB(CURRENT_DATE, INTERVAL 7 DAY)
      GROUP BY acquisto_piatto.id_piatto
      ORDER BY vendite_settimanali DESC
      LIMIT 5;");
        $stmt->execute();
        $result = $stmt->get_result();

        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function bestFood()
    {
        $stmt = $this->db->prepare("SELECT PIATTO.nome AS nome, SUM(acquisto_piatto.quantita) AS vendite_mensili 
        FROM acquisto_piatto JOIN PIATTO ON acquisto_piatto.id_piatto = PIATTO.id_piatto 
        JOIN TRANSAZIONE ON acquisto_piatto.id_transazione = TRANSAZIONE.id_transazione 
        WHERE TRANSAZIONE.data >= DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY) 
        GROUP BY acquisto_piatto.id_piatto 
        ORDER BY vendite_mensili DESC LIMIT 1;");
        $stmt->execute();
        $result = $stmt->get_result();

        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function totalBalance()
    {
        $stmt = $this->db->prepare("SELECT 
        SUM(TRANSAZIONE.costo_totale) - SUM(RIFORNIMENTO.costo) AS bilancio
      FROM TRANSAZIONE
      JOIN RISTORANTE ON TRANSAZIONE.id_ristorante = RISTORANTE.id_ristorante
      LEFT JOIN RIFORNIMENTO ON RISTORANTE.id_ristorante = RIFORNIMENTO.id_ristorante;");
        $stmt->execute();
        $result = $stmt->get_result();

        return $result->fetch_all(MYSQLI_ASSOC);
    }
}