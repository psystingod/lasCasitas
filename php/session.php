<?php #session_start();

require "conexion.php";
$usuario = null;
$contrasena = null;
$errores = "";
#if (isset($_SESSION['usuario'])) {
  #Si el usuario ya cuenta con una sesion redirecionamos al index
  #header("Location: ../index.html");
#}

#Comprobamos si el usuario ya envio los datos de login
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  #Si los datos han sido enviados almacenamos nombre y contrasnia en variables
  $usuario = filter_var(strtolower($_POST['usuario']), FILTER_SANITIZE_STRING);
  $contrasena = filter_var(strtolower($_POST['contrasena']), FILTER_SANITIZE_STRING);
}


$cls_conexion = new Conexion();
$conexion = $cls_conexion->Conexion();
#Preparamos nuestra consulta para alumno
$statement = $conexion->prepare(
  "SELECT * FROM alumno WHERE carnet =:usuario AND pass = :contrasena");
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
  $_SESSION['nombre'] = $login['NombreAlumno'];
  $_SESSION['apellido'] = $login['ApellidoAlumno'];
  $_SESSION['nombre_completo'] = $login['NombreAlumno'] . " " . $login['ApellidoAlumno'];  # Nombre y apellido


  header('Location: ../index.php');
}

#Preparamos nuestra consulta para profesores o administrativos
$statement = $conexion->prepare(
  "SELECT * FROM profesor WHERE user = :usuario AND pass = :contrasena");
$statement->execute(array(
  ':usuario' => $usuario,
  ':contrasena' => $contrasena
));

$login = $statement->fetch();
#Verificamos si el usuario es profesor
if ($login!=false) {
  # Inicia sesion solo si el usuario existe
  session_start();
  # Almacenamos los datos del usuario en la sesion
  $_SESSION['idprofesor'] = $login['idProfesor'];
  $_SESSION['usuario']=$usuario ;
  $_SESSION['nombre'] = $login['NombreProfesor'];
  $_SESSION['apellido'] = $login['ApellidoProfesor'];
  $_SESSION['nombre_completo'] = $login['NombreProfesor'] . " " . $login['ApellidoProfesor'];  # Nombre y apellido

  #  NOTA:  cambiar diretorio al panel de profesores
  header('Location: ../index.php');
}
else {
  $errores .= "Datos incorrectos";
}

print $errores;

?>
