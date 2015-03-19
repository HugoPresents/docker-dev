<?php
try {
    $pdo = new PDO('mysql:host=mysql', 'root', 'rabbit');
    $sth = $pdo->prepare('SHOW VARIABLES LIKE "%version%"');
    $sth->execute();
    $result = $sth->fetchAll();
    foreach ($result as $row) {
        echo sprintf("%s: %s<br>", $row['Variable_name'], $row['Value']);
    }
} catch (Exception $e) {
    var_dump($e->getMessage());
}