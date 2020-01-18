<?php
include 'db_connection.php';

if($_POST){    
    $usuario = $_POST['usuario'];
    $senha = $_POST['senha'];    
    select($usuario, $senha);
    //var_dump($select);
}
?>