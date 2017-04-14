<?php

require "conexion.php";
$usuario = null;
$contrasena = null;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  #Si los datos han sido enviados almacenamos nombre y contrasnia en variables
  $usuario = filter_var(strtolower($_POST['usuario']), FILTER_SANITIZE_STRING);
  $contrasena = filter_var(strtolower($_POST['contrasena']), FILTER_SANITIZE_STRING);
}

$cls_conexion = new Conexion();
$conexion = $cls_conexion->Conexion();
#Preparamos nuestra consulta para alumno
$statement = $conexion->prepare(
  "SELECT persona.idPersona, alumno.idAlumno, persona.nombre, persona.apellido, alumno.User
  FROM alumno INNER JOIN persona ON persona.idPersona = alumno.idPersona
  WHERE alumno.User = :usuario AND alumno.Pass = :contrasena");
#Ejecutamos nuestra consulta
$statement->execute(array(
  ':usuario' => $usuario,
  ':contrasena' => $contrasena
));

$login = $statement->fetch();

if ($login!=false) {
  # Inicia sesion solo si el usuario existe
  session_start();
  # Almacenamos los datos del usuario en la sesion
  $_SESSION['idalumno'] = $login['idalumno'];  # id del alumno
  $_SESSION['usuario']=$usuario ;  # Carnet del alumno
  $_SESSION['nombre'] = $login['nombre'];
  $_SESSION['apellido'] = $login['apellido'];


  header('Location: ../index.php');
}