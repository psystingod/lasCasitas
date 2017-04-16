<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Oswald">

  </head>
  <body>
    
  <!-- Verificamos si el usuario ya inicio secion -->
  <?php
    session_start();
    // Si el usuario ya inicio secion redirigimos al index
    if (isset($_SESSION['usuario'])) {
      header('Location: index.php');
    }
   ?>

    <div class="container1">
      <div class="row-fluid">
        <div class="login">
          <form action="php/session.php" method="POST">
            <div class="form-group has-feedback">
              <label for="usuario">Usuario</label>
              <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Escriba su usuario">
              <i class="glyphicon glyphicon-user form-control-feedback"></i>
            </div>
            <div class="form-group has-feedback">
              <label for="contrasena">Contraseña</label>
              <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="Escriba su Contraseña">
              <i class="glyphicon glyphicon-lock form-control-feedback"></i>
            </div>
            <div class="checkbox">
              <label>
                <input type="checkbox"> Recuerdame
              </label>
            </div>
            <button type="submit" class="btn btn-block btn-primary ">Ingresar</button>
          </form>
        </div>
      </div>
      <div class="row-fluid">
        <div class="top_login"><h2>Centro Escolar Cantón Las Casitas</h2></div>
      </div>
      <div class="row-fluid">
        <div class="bottom_login"></div>
      </div>
    </div>
  </body>
</html>
