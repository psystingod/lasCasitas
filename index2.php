<?php
    session_start();
    require("php/user_info.php");
    $user_info = new UserInfo();
    $array_user_info = $user_info->show($_SESSION['idalumno']);
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
              <li class="active"><a href="#"><i class="fa fa-home" aria-hidden="true"></i><span class="sr-only">(current)</span><br>Inicio</a></li>
              <li><a href="#" data-toggle = "modal" data-target = "#ingresarNota"><i class="fa fa-address-card" aria-hidden="true"></i><br>Ingresar notas</a></li>
              <li><a href="registrar_alumno.php"><i class="fa fa-user-plus" aria-hidden="true"></i><br>Registrar alumno</a></li>
              <li><a href="#"><i class="fa fa-question" aria-hidden="true"></i><br>Pendiente</a></li>
              <li><a href="#"><i class="fa fa-question" aria-hidden="true"></i><br>Pendiente</a></li>
            </ul>

          </div><!-- /.navbar-collapse -->
        </div>
      </nav>
    </div>

    <!---------------------------------------------------------------------->

    <div class="container-fluid">
      <div class="row">
          <div class="col-md-4 left">
              <div class="heading">
                  <h1><i class="fa fa-exclamation-circle" aria-hidden="true"></i>&nbsp;&nbsp;Indicaciones</h1>
              </div>
              <div class="information">
                  <p>A continuación se le muestra una breve descripción de cada una de las opciones del menú superior.</p>
                  <p>Por favor lea cuidadosamente cada una de las indicaciones que se le presentan:</p>
              </div>
          </div>
          <div class="col-md-8 right">
              <div class="heading">
                  <h1><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;Datos personales</h1>
              </div>
              <div class="information">
                  <table class="table table-striped">
                      <tr>
                          <th>Nombre</th>
                          <th>Apellido</th>
                      </tr>
                      <?php
                          foreach ($array_user_info as $key) {
                            echo "<tr><td>";
                            echo $key["NombreAlumno"] . "</td><td>";
                            echo $key["ApellidoAlumno"] . "</td><td>";
                          }
                        ?>
                  </table>
              </div>
          </div>
          </div>
          <!-- VENTANA INGRESAR NOTAS -->
          <div class="modal fade" id="ingresarNota" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="exampleModalLabel">Selecione el grado y la materia en la que desea ingresar notas</h4>
                </div>
                <div class="modal-body">
                  <form>
                    <div class="form-group">
                        <label for="grado" class="control-label">Seleccione un grado:</label>
                        <select class="form-control" id="grado" name="grado">
                          <option value ="">---Grado---</option>
                          <option value ="1">Séptimo</option>
                          <option value ="2">Noveno</option>
                        </select>
                    </div>
                    <div class="form-group">
                      <label for="grado" class="control-label">Seleccione una materia:</label>
                      <select class="form-control" id="materia" name="materia">
                        <option value ="">---Materia---</option>
                        <option value ="1">Informática</option>
                        <option value ="2">Lenguaje</option>
                      </select>
                    </div>
                  </form>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                  <button type="button" class="btn btn-primary">Aceptar</button>
                </div>
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
