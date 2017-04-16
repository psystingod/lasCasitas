<?php

  require("conexion.php");

  // Valores capturados

  $names = $_POST['names'];
  $lastname = $_POST['lastname'];
  $yearsOld = intval(date("Y")) - intval($_POST['year']);
  $grade = $_POST['grade'];
  $gender = $_POST['gender'];
  $carnet = $_POST['carnet'];

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
        $sql = "INSERT INTO 'alumno' (alumno.NombreAlumno, alumno.ApellidoAlumno, alumno.EdadAlumno, alumno.GeneroAlumno, alumno.Carnet)
                VALUES ($names, $lastname, $yearsOld, $gender, $carnet)"; // Datos a insertar
        $stmt = $this->conexion_db->prepare($sql);
        $stmt->execute();
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
