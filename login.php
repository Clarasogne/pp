<?php require("session.php"); 
if(isset($_SESSION["usuario"])){
    header("location: Practica09-26admin.php");
    exit();
}
require_once("conexion.php");
?>
<?php
if(isset($_POST["usuario"])){
    $usuario = trim($_POST["usuario"]);
    $contraseña = sha1(trim($_POST["contraseña"]));
    $asd = new BaseDeDatos();

    $validacion = $asd->compararGeneral($usuario, $contraseña);
    $admin = $asd->compararAdmin($usuario, $contraseña);

    if($validacion){
        if($admin){
            $_SESSION["usuario"] = $_POST["usuario"];
            $_SESSION["contraseña"] = $_POST["contraseña"];
            header("location: admin.php");
            exit();
        }else{
            $_SESSION["usuario"] = $_POST["usuario"];
            $_SESSION["contraseña"] = $_POST["contraseña"];
            header("location: profesor.php");
            exit();
        }

    }else{
        echo "Usuario o contraseña incorrectos.";
    }
}
?>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Practica 9</title>
</head>
<body>
    <form action="Practica09-26login.php" method="post">
        <input type="text" name="usuario">Usuario<br>
        <input type="password" name="contraseña">Contraseña<br>
        <input type="submit" value="Ingresar">
    </form>
</body>
</html>
