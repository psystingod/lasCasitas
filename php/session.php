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
  $_SESSION['nombre'] = $login['nombre'] . " " . $login['apellido'];  # Nombre y apellido


  header('Location: ../index.php');
}

#Preparamos nuestra consulta para profesores o administrativos
$statement = $conexion->prepare(
  "SELECT persona.idPersona, profesor.idProfesor, persona.nombre, persona.apellido, profesor.User
   FROM profesor INNER JOIN persona ON persona.idPersona = profesor.idPersona
   WHERE profesor.User = :usuario AND profesor.Pass = :contrasena");
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
  $_SESSION['idprofesor'] = $login['idProfesor'];  # id del alumno
  $_SESSION['usuario']=$usuario ;  # Carnet del alumno
  $_SESSION['nombre'] = $login['nombre'] . " " . $login['apellido'];  # Nombre y apellido

  #  NOTA:  cambiar diretorio al panel de profesores
  header('Location: ../index.php');
}
else {
  $errores .= "Datos incorrectos";
}

print $errores;

?>
