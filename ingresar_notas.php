<?php
    session_start();
    require("php/student_info.php");
    $student_info = new StudentInfo();
    $array_student_info = $student_info->show();
?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Centro Escolar</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-responsive.css">
    <link rel="stylesheet" href="fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/custom.css">
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Roboto">
    <script src="js/bootstrap.min.js"></script>
  </head>
  <body>
    <?php
      // session_start();
      if(!isset($_SESSION["usuario"])) {
        header('Location: login.php');
      }
     ?>
    <div class="nav-header">
      <nav class="top-nav">
        <div class="container-fluid">

          <nav class="navbar navbar-default">
              <!-- Nombre de la escuela -->
              <div class="navbar-header">
                <a class="navbar-brand" href="#">Centro Escolar Cantón Las Casitas</a>
              </div>
              <!-- Nombre del alumno logeado -->
              <ul class="nav navbar-nav pull-right">
                <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user-circle-o" aria-hidden="true"></i> <?php echo $_SESSION["nombre"]; ?> <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="php/logout.php">Salir</a></li>
                </ul>
              </li>
              </ul>
          </nav>
        </div>
      </nav>
      <nav class="navbar navbar-default bottom-nav">
        <div class="container-fluid">
          <!-- Menú a ser mostrado en Moviles -->
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menuPrincipal" aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>

          <!-- Menú principal -->
          <div class="collapse navbar-collapse" id="menuPrincipal">
            <ul class="nav navbar-nav">
              <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i><span class="sr-only">(current)</span><br>Inicio</a></li>
              <li class="active"><a href="#" data-toggle = "modal" data-target = "#ingresarNota"><i class="fa fa-address-card" aria-hidden="true"></i><br>Ingresar notas</a></li>
              <li><a href="registrar_alumno.php"><i class="fa fa-user-plus" aria-hidden="true"></i><br>Registrar alumno</a></li>
              <li><a href="#"><i class="fa fa-question" aria-hidden="true"></i><br>Pendiente</a></li>
              <li><a href="#"><i class="fa fa-question" aria-hidden="true"></i><br>Pendiente</a></li>
            </ul>

          </div><!-- /.navbar-collapse -->
        </div>
      </nav>
    </div>

    <!-------------------------------------------------------------------- -->

    <div class="container-fluid">
      <div class="row">
          <div class="col-md-12">
              <div class="heading">
                  <h1><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;Listado de alumnos de x grado que cursan x</h1>
              </div>
              <div class="information">
                  <table class="table">
                    <form action="">
                        <tr>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Género</th>
                            <th>Carnet</th>
                            <th>Ponderación</th>
                              <th><select class="form-control" name="numeroDeNota" id="numeroDeNota">
                                <option value="1">Nota 1 primer período</option>
                                <option value="2">Nota 2 primer período</option>
                                <option value="3">Nota 3 primer período</option>
                                <option value="4">Nota 1 segundo período</option>
                                <option value="5">Nota 2 segundo período</option>
                                <option value="6">Nota 3 segundo período</option>
                                <option value="7">Nota 1 tercer período</option>
                                <option value="8">Nota 2 tercer período</option>
                                <option value="9">Nota 3 tercer período</option>
                                <option value="10">Nota 1 cuarto período</option>
                                <option value="11">Nota 2 cuarto período</option>
                                <option value="12">Nota 3 cuarto período</option>
                              </select></th>
                        </tr>
                        <?php
                            foreach ($array_student_info as $key) {
                              echo "<tr><td>";
                              echo $key["NombreAlumno"] . "</td><td>";
                              echo $key["ApellidoAlumno"] . "</td><td>";
                              echo $key["GeneroAlumno"] . "</td><td>";
                              echo $key["Carnet"] . "</td><td>";
                              echo "<input type='input' class='form-control' id='lastname' name='lastname' placeholder='%'>" . "</td><td>";
                              echo "<input type='input' class='form-control' id='lastname' name='lastname' placeholder='Nota'>" . "</td><td>";
                            } 
                          ?>
                      
                    </form>
                  </table>
              </div>
          </div>
          </div>
          <!----------------------------------------------------------------------------------------- -->
      </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>