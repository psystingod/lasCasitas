<?php session_start();

require "conexion.php";

if (isset($_SESSION['usuario'])) {
  #Si el usuario ya cuenta con una sesion redirecionamos al index
  header("Location: index.html");
}

#Comprobamos si el usuario ya envio los datos de login
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  #Si los datos han sido enviados almacenamos nombre y contrasnia en variables
  $usuario = filter_var(strtolower($_POST['usuario']), FILTER_SANITIZE_STRING);
  $contrasena = filter_var(strtolower($_POST['contrasena']), FILTER_SANITIZE_STRING);
}


$cls_conexion = new Conexion();
$conexion = $cls_conexion->Conexion();
#Preparamos nuestra consulta
$statement = $conexion->prepare("SELECT * FROM profesor WHERE user = :usuario AND pass = :contrasena");
#Ejecutamos nuestra consulta
$statement->execute(array(
  ':usuario' => $usuario,
  ':contrasena' => $contrasena
));

$login = $statement->fetch();

if ($login!=false) {
  $_SESSION['usuario']=$usuario ;
  header('Location: ../index.html');
}


?>
