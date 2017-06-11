<?php

  require("conexion.php");

  class NotasInsert extends Conexion
  {
    public function NotasInsert()
    {
      parent::__construct ();
      $id = $_GET["Id"];
    }
    public function setNotas($id)
    {
      $sql = "INSERT INTO notas.N1 WHERE alumno.idAlumno = :id"; // Guardamos la consulta en una variable para mayor manejo
      $stmt = $this->conexion_db->prepare($sql);
      $stmt->execute(array(':id' => $id));

      //$result = $stmt->fetchAll(PDO::FETCH_ASSOC); // La consulta es guardada en un array asociativo
      //$stmt->closeCursor(); // Cerramos el cursor del array que se ejecuta

      //return $result;
      $this->conexion_db = null;
      header("Location: ../ingresar_notas.php");
    }
  }

?>