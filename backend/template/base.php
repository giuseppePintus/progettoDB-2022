<!DOCTYPE html>
<html lang="en" xml:lang="en">

<head>
    <meta content="width=device-width, initial-scale=1.0">
    <title>
        <?php echo $templateParams["pagetitle"]; ?>
    </title>
    <link rel="icon" href="./upload/logo.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="./css/style.css" />

</head>

<body>
    <main>
        <div>
            <select id="ristorante">
                <?php
                if (isset($templateParams["ristorante"])):
                    foreach ($templateParams["ristorante"] as $ristorante):
                        ?>
                        <option value="<?php echo $ristorante["id_ristorante"]; ?>">
                            <?php echo $ristorante["locazione"]; ?>
                        </option>
                    <?php
                    endforeach;
                endif;
                ?>
            </select>
        </div>
        <button id="8">piatto maggiormente venduto in un determinato ristorante</button>
        <button id="3">controlla il bilancio mensile di un determinato ristorante</button>
        <div>
            select franchisee
            <select id="owner">
                <?php
                if (isset($templateParams["owner"])): foreach ($templateParams["owner"] as $owner):
                        ?>
                        <option value="<?php echo $owner["id_personale"]; ?>">
                            <?php echo $owner["nome"] . "  " . $owner["cognome"]; ?>
                        </option>
                    <?php
                    endforeach;
                endif;
                ?>
            </select>
        </div>
        <button id="5">ricavo mensile ottenuto da un determinato franchisee</button>
        <button id="1">controlla il ristorante con la transazione media più costosa</button>
        <button id="7">lista settimanale dei 5 piatti maggiormente venduti</button>
        <button id="9">piatto maggiormente venduto  in tutto il mondo</button>
        <button id="10">stima del bilancio di tutta l’azienda </button>
        <div class="result" >
        result
    </div>
    </main>
    <aside>
        <div>
            <form action="transaction.php" method="get">
            <label for="ristorante">seleziona il ristorante:</label>
            <select id="formIDtra" name="formIDtra">
                <?php
                if (isset($templateParams["ristorante"])):
                    foreach ($templateParams["ristorante"] as $ristorante):
                        ?>
                        <option value="<?php echo $ristorante["id_ristorante"]; ?>">
                            <?php echo $ristorante["locazione"]; ?>
                        </option>
                    <?php
                    endforeach;
                endif;
                ?>
                </select><br>
                <label for="data">data:</label>
                <input type="date" id="data" name="data"><br>
                <label for="costo">costo:</label>
                <input type="number" id="costo" name="costo">
                <button id="4">aggiungi transazione</button>
            </form>
        </div>
        <div>
            <form action="register.php" method="GET">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email">
                <br>
                <label for="telefono">telefono:</label>
                <input type="tel" id="telefono" name="telefono">
                <br>
                <label for="stipendio">stipendio:</label>
                <input type="number" id="stipendio" name="stipendio">
                <br>
                <label for="iban">IBAN:</label>
                <input type="text" id="iban" name="iban">

                <br>
                <label for="nome">nome:</label>
                <input type="text" id="nome" name="nome">
                <br>
                <label for="cognome">cognome:</label>
                <input type="text" id="cognome" name="cognome">
                <br>
                <label for="residenza">residenza:</label>
                <input type="text" id="residenza" name="residenza">
                <br>
                <label for="inizio_contratto">inizio Contratto:</label>
                <input type="date" id="inizio_contratto" name="inizio_contratto">
                <br>
                <label for="fine_contratto">fine contratto:</label>
                <input type="date" id="fine_contratto" name="fine_contratto">
                <br>
            
                <label for="ristorante">seleziona il ristorante:</label>
                <select id="formIDris" name="formIDris">
                    <?php
                    if (isset($templateParams["ristorante"])): foreach ($templateParams["ristorante"] as $ristorante):
                            ?>
                            <option value="<?php echo $ristorante["id_ristorante"]; ?>">
                                <?php echo $ristorante["locazione"]; ?>
                            </option>
                        <?php
                        endforeach;
                    endif;
                    ?>
                </select>
                <br>
                <button id="2" disable>registra un nuovo dipendente</button>
            </form>
        </div>
        <div>
            <form action="forniture.php" method="get">
                <select id="formIDfor" name="formIDfor">
                    <?php
                    if (isset($templateParams["forniture"])): foreach ($templateParams["forniture"] as $forniture):
                            ?>
                            <option value="<?php echo $forniture["id_rifornimento"]; ?>">
                                <?php echo $forniture["nome"] . "  " . $forniture["innome"] . "  " . $forniture["data_richiesta"]; ?>
                            </option>
                        <?php
                        endforeach;
                    endif;
                    ?>
                </select><br>
                <label for="consegna">data consegna:</label>
                <input type="date" id="consegna" name="consegna"><br>
                <button id="6">registra la fornitura completata.</button>
            </form>
        </div>
        <div>
    </aside>
    
</body>

<?php
if (isset($templateParams["js"])): foreach ($templateParams["js"] as $script):
        ?>
        <script src="<?php echo $script; ?>"></script>
    <?php
    endforeach;
endif;
?>

</html>