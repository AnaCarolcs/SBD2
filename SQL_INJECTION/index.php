<?php
if($_SERVER['REQUEST_METHOD'] == 'POST') {
  mysql_connect('127.0.0.1', 'admin', 'admin');
	mysql_select_db('injection');
	$usuario = $_POST['usuario'];
	$senha = $_POST['senha'];
	$query = "select usuario, senha from usuario where usuario='$usuario' and senha='$senha';";
	$result = mysqli_query($query);
	$rows = mysql_fetch_array($result);

  if($rows){
		echo "Logado com sucesso";
	}
	else {
		echo "Não logou. Tente novamente.";
	}
}
?>

<!DOCTYPE html>
<html>
<head>
	<title>Demonstrando Injeção de SQL</title>
</head>
<body>
<form action="index.php" method="POST">
  <h2>Demonstrando Injeção de SQL</h2><br>
  Usuário:<br>
  <input type="text" name="usuario"><br><br>
  Senha:<br>
  <input type="text" name="senha"><br><br>
  <input type="submit" value="entrar">
</form>
</body>
</html>
