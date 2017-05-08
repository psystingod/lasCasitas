<?php

  require("conexion.php");
  // Los valores capturados estaban aqui"
    class ParentInsert extends Conexion
    {
      public function ParentInsert()
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
          $yearsOld = $_POST['year'].'-'.$_POST['month'].'-'.$_POST['day'];
          $relation = $_POST['relation'];
          $gender = $_POST['gender'];
          $dui = $_POST['dui'];
          $phone = $_POST['phone'];

          //print_r($_POST);
                
          $sql = "INSERT INTO encargado (NombreEncargado, ApellidoEncargado, EdadEncargado, GeneroEncargado, DUIEncargado, Parentesco, Telefono) VALUES (:NombreEncargado, :ApellidoEncargado, :EdadEncargado, :GeneroEncargado, :DUIEncargado, :Parentesco, :Telefono)"; // Datos a insertar
  
          $stmt = $this->conexion_db->prepare($sql);
          $stmt->execute(array(
            ':NombreEncargado' => $names,
            ':ApellidoEncargado' => $lastname,
            ':EdadEncargado' => $yearsOld,
            ':GeneroEncargado' => $gender,
            ':DUIEncargado' => $dui,
            ':Parentesco'=> $relation,
            ':Telefono' => $phone
            ));

          echo "Datos Registrados!!";
        }
  

      //$result = $stmt->fetchAll(PDO::FETCH_ASSOC); // La consulta es guardada en un array asociativo
      //$stmt->closeCursor(); // Cerramos el cursor del array que se ejecuta

      //return $result;

      //$this->conexion_db = null;
    }
  }

  $insert = new ParentInsert();
  $insert->insert();

?>