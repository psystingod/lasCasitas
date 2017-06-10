<?php

  require("conexion.php");
  // Los valores capturados estaban aqui"
    class StudentInsert extends Conexion
    {
      public function StudentInsert()
      {
        parent::__construct ();
      }
      public function insert()
      {
        if ( !empty($_POST['submit']) ) 
        {
  
           // Valores capturados
          $names = $_POST['names'];
          $lastname = $_POST['lastname'];
          // $yearsOld = intval(date("Y")) - intval($_POST['year']);
          $yearsOld = $_POST['year'].'-'.$_POST['month'].'-'.$_POST['day'];
          $grade = $_POST['grade'];
          $gender = $_POST['gender'];
          $carnet = strtolower($_POST['carnet']);

          // Inicialmente la contrasenia sera el carnet luego el alumno podra cambiarla
          // De igualmanera la contrasenia esta encriptada con sha512
          $pass = hash('sha512', strtolower($carnet));
                
          $sql = "INSERT INTO alumno (NombreAlumno, ApellidoAlumno, EdadAlumno, GeneroAlumno, Carnet, idGrado, Pass, Estado, idEncargado) VALUES (:NombreAlumno, :ApellidoAlumno, :EdadAlumno, :GeneroAlumno, :Carnet, :idGrado , :Pass, :Estado, '1')"; // Datos a insertar
  
          $stmt = $this->conexion_db->prepare($sql);
          $stmt->execute(array(
            ':NombreAlumno' => $names,
            ':ApellidoAlumno' => $lastname,
            ':EdadAlumno' => $yearsOld,
            ':GeneroAlumno' => $gender,
            ':Carnet' => $carnet,
            ':idGrado'=> $grade,
            ':Pass' => $pass,
            ':Estado' => 'activo'
            ));
          header('Location: ../registrar_alumno.php');
          //echo "Datos registrados!!";
        }

      //$result = $stmt->fetchAll(PDO::FETCH_ASSOC); // La consulta es guardada en un array asociativo
      //$stmt->closeCursor(); // Cerramos el cursor del array que se ejecuta

      //return $result;

      //$this->conexion_db = null;
    }
  }

  $insert = new StudentInsert();
  $insert->insert();

?>
