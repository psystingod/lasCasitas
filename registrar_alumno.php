<?php
    session_start();
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
    <link rel="stylesheet" href="pure/pure.css">
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
              <li><a href="#"><i class="fa fa-file-text" aria-hidden="true"></i><br>Notas</a></li>
              <li><a href="#"><i class="fa fa-bar-chart" aria-hidden="true"></i><br>Promedio</a></li>
              <li><a href="#"><i class="fa fa-check" aria-hidden="true"></i><br>Conducta</a></li>
              <li><a href="#"><i class="fa fa-pencil" aria-hidden="true"></i><br>Evaluaciones</a></li>
            </ul>

          </div><!-- /.navbar-collapse -->
        </div>
      </nav>
    </div>

    <!---------------------------------------------------------------------->

    <div class="container-fluid">
      <div class="row">
          <div class="col-md-5 left">
              <div class="heading">
                  <h1><i class="fa fa-exclamation-circle" aria-hidden="true"></i>&nbsp;&nbsp;Indicaciones</h1>
              </div>
              <div class="information">
                  <p class="alert alert-info">En el formulario del lado derecho puede registrar un nuevo alumno que será añadido a la base de datos.</p>
                  <p class="alert alert-info">La contraseña del alumno sera inicialmente su carnet, luego el podrá cambiarla si asi lo decea.</p>
                  <p class="alert alert-info">Por favor Rellene todos los campos cuidadosamente verificando que los nombres y apellidos han sido escritos correctamente, así como todos los demás datos.</p>
              </div>
          </div>
          <div class="col-md-7 right">
              <div class="heading">
                  <h1><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;Datos personales</h1>
              </div>
              <div class="information">
                <!--Inicio del form-->
                  <form action="php/student_insert.php" method="post">
                    <div class="form-group">
                      <label for="names">Nombres</label>
                      <input type="input" class="form-control" id="names" name="names" placeholder="Nombre completo">
                    </div>
                    <div class="form-group">
                      <label for="lastname">Apellidos</label>
                      <input type="input" class="form-control" id="lastname" name="lastname" placeholder="Apellidos">
                    </div>
                    <div class="form-group">
                      <label for="birth">Fecha de nacimiento</label>
                      <div class="row">
                        <div class="col-xs-5">
                          <select class="form-control" id="month" name="month">
                            <option value ="">Mes</option>
                            <option value ="1">Enero</option>
                            <option value ="2">Febrero</option>
                            <option value ="3">Marzo</option>
                            <option value ="4">Abril</option>
                            <option value ="5">Mayo</option>
                            <option value ="6">Junio</option>
                            <option value ="7">Julio</option>
                            <option value ="8">Agosto</option>
                            <option value ="9">Septiembre</option>
                            <option value ="10">Octubre</option>
                            <option value ="11">Noviembre</option>
                            <option value ="12">Diciembre</option>
                          </select>
                        </div>
                        <div class="col-xs-3">
                          <select class="form-control" id="day" name="day">
                            <option>Día</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>
                            <option value="31">31</option>
                          </select>
                        </div>
                        <div class="col-xs-4">
                          <input type="input" class="form-control" id="year" name="year" placeholder="Año">
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="grade">Grado</label>
                      <div class="row">
                        <div class="col-xs-4">
                          <select class="form-control" id="grade" name="grade">
                            <option>Seleccione el grado</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                        <label class="vertical-radio">
                        <input type="radio" name="gender" id="inlineRadio1" value="Maculino"> Masculino
                    </div>
                    <div class="form-group">
                        </label>
                        <label class="vertical-radio">
                          <input type="radio" name="gender" id="inlineRadio2" value="Femenino"> Femenino
                        </label>
                    </div>

                    <div class="row">
                    <div class="form-group">
                        <div class="col-xs-4">
                          <label for="carnet">Carnet</label>
                          <input type="input" class="form-control" id="carnet" name="carnet" placeholder="Carnet de estudiante">
                        </div>
                    </div>
                  </div>

                  <!-- Se necesita incertar un buscador en tiempo real para asignar el encargado -->
                  <br>
                   
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Faltaba name y value $_POST['submit'] no estaba seteado no tenia valor por lo que no podia entrar en la centencia if ( !empty($_POST['submit']) )  -->
                            <button type="submit" name="submit" value="submit" class="btn btn-block btn-lg btn-success">Registrar</button>
                        </div>
                    </div>
                 
                  </form>
              </div>
          </div>
          </div>
      </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>