<?php
  // Conectarse a la base de datos
  $host = 'localhost';
  $user = 'naye';
  $password = '';
  $database = 'mydb';
  $conexion = mysqli_connect($host, $user, $password) or die ("No se encuentra el servidor");
  
  // Realizar una consulta
  $nombre = $_POST['nombre'];
  $email = $_POST['email'];
  $contrasena = $_POST['contrasena'];
  $confcontrasena = $_POST['confirmar-contrasena'];
  $direccion = $_POST['direccion'];
  $telefono = $_POST['telefono'];

  if(!$conexion){
    echo'No se pudo';
  }else{
    echo 'Se estableció';
  }

  //confirmar contraseña 
  if($contrasena != $confcontrasena){
    die("Las contraseñas no coinciden <a href='#id03'>Volver</a>");
  }

  $db =mysqli_select_db($conexion, $database); 

  //Mandar datos
  $intruccion_SQL = "INSERT INTO Clientes(idClientes, Nombre, Email, Direccion, Telefono, Contraseña, Roles_IDRoles) 
  VALUES('','$nombre','$email','$direccion','$telefono','$contrasena','') ";

  $resul = mysqli_query($conexion, $intruccion_SQL);
  echo 'Registro completo <br><a href="id02">Iniciar sesión</a';
  // Cerrar la conexión
  mysqli_close($conexion);
?>
