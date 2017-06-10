<?php

  require("conexion.php");

  class StudentInfo extends Conexion
  {
    public function UserInfo()
    {
      parent::__construct ();
    }
    public function show()
    {
      $sql = "SELECT alumno.NombreAlumno, alumno.ApellidoAlumno, alumno.GeneroAlumno, alumno.Carnet from alumno"; // Guardamos la consulta en una variable para mayor manejo
      $stmt = $this->conexion_db->prepare($sql);
      $stmt->execute(array());

      $result = $stmt->fetchAll(PDO::FETCH_ASSOC); // La consulta es guardada en un array asociativo
      $stmt->closeCursor(); // Cerramos el cursor del array que se ejecuta

      return $result;

      $this->conexion_db = null;
    }
  }

?>