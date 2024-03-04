<?php header('Access-Control-Allow-Origin: *');
// Conexión a la base de datos
$host = "localhost";
$user = "root";
$password = "";
$database = "mydb";
$con = new mysqli($host, $user, $password, $database);

// Comprobación de la conexión
if($con->connect_error) {
    die("La conexión ha fallado: \n" . $con->connect_error);
}else{
   // echo "Conexión exitosa \n";
}

// Recuperar los datos del formulario
$email = $_POST['emaiLogin'];
$contrasena = $_POST['passwordLogin'];

// Recuperar el email y constraseña de la base de datos
$sql = "SELECT * FROM Clientes";
$datos = mysqli_query($con, $sql);
$arrayDatos = array();
while($row = mysqli_fetch_array($datos)){
  $arrayDatos[] = $row;
}

//Verificar que el usuario y contraseña introducidos son los correctos
foreach ($arrayDatos as $fila) {
    foreach ($fila as $valor) {
        if($valor == $email){
            $emailcorrec = true; 
        }
        if($valor == $contrasena){
            $contrasenacorrec = true;
        }
    }
}
if($contrasenacorrec==true && $emailcorrec==true){
    header("Location: http://localhost/Empory/components/usuario.html");
    exit();
}else{
    echo'<script type="text/javascript"> alert("Contraseña o usuario incorrecto"); window.location.href="http://localhost/Empory/components/index.html";</script>';
    exit();
}

?>
