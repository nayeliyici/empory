<?php header('Access-Control-Allow-Origin: *');
// Conexión a la base de datos
$host = "localhost";
$user = "root";
$password = "";
$database = "mydb";
$con = new mysqli($host, $user, $password, $database);

/*
//Comprobación de la conexión
if($con->connect_error) {
    die("La conexión ha fallado: \n" . $con->connect_error);
}else{
    echo "Conexión exitosa \n";
}
*/

// Recuperar los datos del formulario
$nombre = $_POST['nombre'];
$email = $_POST['email'];
$contrasena = $_POST['contrasena'];
$confirmarcontrasena = $_POST['confirmar-contrasena'];
$direccion = $_POST['direccion'];
$telefono= $_POST['telefono'];

if ($contrasena == $confirmarcontrasena){
    // Insertar los datos en la tabla
    $sql = "INSERT INTO Clientes(idClientes,Nombre,Email,Direccion,Telefono,Contraseña,Roles_IDRoles) VALUES ('2','$nombre', '$email', '$direccion', '$telefono', '$contrasena', '1')";
    $query = mysqli_query($con, $sql);
    header("Location: http://localhost/Empory/components/index.html");
    exit();
}


?>
