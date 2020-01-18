<?php
	function select($usuario, $senha) {
		$host="localhost";
		$port=3306;
		$socket="";
		$user="root";
		$password="";
		$dbname="aulasql";
		$con = new mysqli($host, $user, $password, $dbname, $port, $socket)
		or die ('Could not connect to the database server' . mysqli_connect_error());   
		$query = "select usuario from login where usuario = '$usuario' and senha = '$senha'";
		echo $query."<br><br><br><br>";
        $stmt = $con->prepare("select usuario from login where usuario = '$usuario' and senha = '$senha'");
        $stmt->execute();
		$stmt->bind_result($usuario);
        while ($stmt->fetch()) {
			printf("%s, %s\n<br>", $usuario, " logado!");
			return;
		};
		$stmt->close();
        echo "acesso negado!";
    };
?>