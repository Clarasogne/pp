<?php
class BaseDeDatos{
    private static $servidor = "localhost:3307";
    private static $usuario = "root";
    private static $contraseña = "";
    private static $bd = "escuela";
    protected $conexion;
    protected $sql;

    protected function openConnection(){
        $this->conexion = new mysqli(self::$servidor, self::$usuario, self::$contraseña, self::$bd);
    }

    protected function closeConnection(){
        $this->conexion->close();
    }

    public function compararGeneral($usuario="", $contraseña=""){
        $this->openConnection();
        
        $sql = "SELECT *
        FROM usuarios
        WHERE username = '$usuario'
        AND password = '$contraseña'";

        $resultado = mysqli_query($this->conexion, $sql);

        $this->closeConnection();

        if(mysqli_num_rows($resultado) > 0){
            return true;
        }else{
            return false;
        }
    }

    public function compararAdmin($usuario="", $contraseña=""){
        $this->openConnection();
        
        $sql = "SELECT permisos
        FROM usuarios
        WHERE username = '$usuario'
        AND password = '$contraseña'";

        $resultado = mysqli_query($this->conexion, $sql);

        $this->closeConnection();

        if(mysqli_num_rows($resultado) > 0){
            $fila = mysqli_fetch_assoc($resultado);
            $permisos = $fila['permisos'];
        }
        
        if($permisos == 1){
            return true;
        }else{
            return false;
        }
    }
    
    public function usuarioRepetido($usuario){
        $this->openConnection();
        
        $sql = "SELECT *
        FROM usuarios
        WHERE username = '$usuario'";

        $resultado = mysqli_query($this->conexion, $sql);

        if(mysqli_num_rows($resultado) > 0){
            return true;
        }else{
            return false;
        }

        $this->closeConnection(); 
    }
    
    public function registrarUsuario($usuario, $contraseña){
        $this->openConnection();
        
        $sql = "INSERT INTO usuarios (username, password, permisos)
        VALUES ('$usuario', '$contraseña', 0)";

        $resultado = mysqli_query($this->conexion, $sql);

        $this->closeConnection();
    }
}
?>