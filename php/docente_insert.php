<?php

  require("conexion.php");
  // Los valores capturados estaban aqui"
    class DocenteInsert extends Conexion
    {
      public function DocenteInsert()
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
          $specialty = $_POST['specialty'];
          $gender = $_POST['gender'];
          $dui = $_POST['dui'];
          $phone = $_POST['phone'];

          $user = strtolower($_POST['user']);
          //Encriptamos contrasenias con el algoritmo sha512
          $pass1 = hash('sha512', strtolower($_POST['pass1']));
          $pass2 = hash('sha512', strtolower($_POST['pass2']));

          if ($pass1 == $pass2) {
/*	          echo $pass1 . "<br>";

	          var_dump($_POST);*/
	                
	          $sql = "INSERT INTO profesor (NombreProfesor, ApellidoProfesor, EdadProfesor, GeneroProfesor, DUIProfesor, Especialidad, User, Pass, Estado) VALUES (:NombreProfesor, :ApellidoProfesor, :EdadProfesor, :GeneroProfesor, :DUIProfesor, :Especialidad, :User, :Pass, :Estado)"; // Datos a insertar
	  
	          $stmt = $this->conexion_db->prepare($sql);
	          $stmt->execute(array(
	            ':NombreProfesor' => $names,
	            ':ApellidoProfesor' => $lastname,
	            ':EdadProfesor' => $yearsOld,
	            ':GeneroProfesor' => $gender,
	            ':DUIProfesor' => $dui,
	            ':Especialidad'=> $specialty,
	            ':User' => $user,
	            ':Pass' => $pass1,
	            ':Estado' => 'activo'
	            ));

	          echo "Datos Registrados!!";
          }else{
          	echo "Las contraseñas no coinciden";
          }

        }
  

      //$result = $stmt->fetchAll(PDO::FETCH_ASSOC); // La consulta es guardada en un array asociativo
      //$stmt->closeCursor(); // Cerramos el cursor del array que se ejecuta

      //return $result;

      //$this->conexion_db = null;
    }
  }

  $insert = new DocenteInsert();
  $insert->insert();

?> 