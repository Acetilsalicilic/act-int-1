<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de sesión</title>

    <style>
        * {
            font-family: Arial, Helvetica, sans-serif;
            margin: 0;
        }
        
        body {
            background-color: #fffaedaa;
        }
        
        header {
            width: 500px;
            padding: 10px;
            background: linear-gradient(90deg,rgba(127, 229, 229, 1) 0%,rgba(172, 220, 233, 1) 100%);
            background-size: cover;
        }
        
        #logo {
            display: inline-block;
            width: 70px;
            height: 85px;
        }
        
        h1 {
            display: inline-block;
            position: absolute;
            top: 35px;
            left: 140px;
            font-size: 26px;
            font-weight: 600;
            color: #e64c31;
            margin: 0 15px;
        }
        
        div p {
            font-weight: 700;
            position: relative;
            left: 20px;
            bottom: 10px;
            margin-top: 10px;
        }
        
        #fieldContainer {
            display: block;
            width: 500px;
            height: 150px;
        }
        
        .inputLabel {
            display: inline-block;
            position: absolute;
            left: 50px;
            margin-top: 30px;
        }
        
        .input {
            display: inline-block;
            position: relative;
            left: 150px;
            margin-top: 30px;
        }
        
        /*
        .inputLabel {
            float: left;
            margin: 10px 10px;
        }
        
        .input {
            float: left;
            margin: 10px 10px;
        }
        
        #passwordLabel {
            clear: left;
        }
        */
        
        .buttons {
            display: inline-block;
            margin: 20px 70px;
            margin-top: 0;
            width: 100px;
        }
        
        #registerChunk {
            margin: 20px;
            position: absolute;
            left: 40px;
        }

        .aviso {
            width: 520px;
            background: linear-gradient(90deg,rgba(127, 229, 229, 1) 0%,rgba(172, 220, 233, 1) 100%);
        }
        </style>
</head>
<body>

    <!--/////////////////////////////////////////////////////////////////CONSULTA A BD//////////////////////////////////-->
    <%

    //---------------------DECLARACIÓN DE CLASE DE CONSULTA-------------
    class ConexionBD {
    
        //Here lies _registrarUsr_
    
        public ResultSet consultarUsr() {
    
            try {
                
                Class.forName(driver);
    
                cx = DriverManager.getConnection(url, user, password);
    
                System.out.println("Coneccion establecida");
    
                st = cx.createStatement();
    
                System.out.println("SQL Query: SELECT * FROM `musuarios` WHERE 1;");
    
                ResultSet result = st.executeQuery("SELECT * FROM `musuarios` WHERE 1;");
    
                return result;
    
            } catch (SQLException e) {
                
                System.out.println(e.getMessage());
                System.out.println("SQL EXCEPTION");
    
            } catch (ClassNotFoundException e) {
    
                System.out.println("CLASE NO ENCONTRADA");
    
            }
    
            return null;
    
        }
    
        public void cerrar() {
    
            try {
                
                cx.close();
    
            } catch (SQLException e) {
                // TODO: handle exception
                System.out.println("ERROR AL CERRAR");
    
            }
        }
    
        private String 
        driver = "com.mysql.cj.jdbc.Driver", 
        bd = "reg@losdb", 
        password = "", 
        user = "root", 
        url = "jdbc:mysql://localhost:3306/reg@losdb";
        private Connection cx;
        private Statement st;
    }

    //---------------------------------COMPROBACIÓN DE DATOS DE INICIO---------------*****************************************

    ConexionBD con = new ConexionBD();

    boolean existeUsuario = false;
    boolean existePass = false;
    String usuarioIngresado = request.getParameter("username");
    String passIngresada = request.getParameter("password");

    if (usuarioIngresado == null) {
        usuarioIngresado="nouser";
    }
    if (passIngresada == null) {
        passIngresada="nopassword";
    }

    //Obtener los usuarios y comparar

    try {

        ResultSet datos = con.consultarUsr();

        while(datos.next() && existeUsuario == false) {

            if (usuarioIngresado.equals(datos.getString(2))) {
                
                existeUsuario = true;

            }

        }

        con.cerrar();

    } catch (SQLException e) {

    }

    //Avisar si existe el usuario

    if (!usuarioIngresado.equals("nouser")) {
        if (!existeUsuario) {

            out.println("<p class='aviso'>El usuario ingresado NO existe</p>");
    
        } else {
    
            out.println("<p class='aviso'>El usuario ingresado existe</p>");
    
        }
    }


    //Hacer lo propio con la contraseña

    try {

        ResultSet datos = con.consultarUsr();

        while(datos.next() && existePass == false) {

            if (passIngresada.equals(datos.getString(3))) {
                
                existePass = true;

            }

        }

        con.cerrar();

    } catch (SQLException e) {

    }

    //Avisar si existe la contraseña

    if (!passIngresada.equals("nopassword")) {
        if (!existePass) {

            out.println("<p class='aviso'>La contraseña ingresada NO existe</p>");
    
        } else {
    
            out.println("<p class='aviso'>La contraseña ingresada existe</p>");
    
        }
    }


    %>
    <!--//////////////////////////////////////////////////////FIN DE SCRIPLET//////////////////////////-->

    <header id="topChunk">
        <div id="title">
            <img src="Logo_IPN.png" alt="Logo" id="logo">
            <h1 id="title2">Inicio de sesión</h1>
            <p>Por favor ingrese su nombre de usuario y contraseña:</p>
        </div>
    </header>


    <main id="formChunk">
        <form action="formulario1.jsp" method="post">
            <div id="fieldContainer">
                <label for="username" class="inputLabel">Usuario</label>
                <input type="text" name="username" id="username" required class="input">
                <br>
                <label for="password" class="inputLabel" id="passwordLabel">contraseña</label>
                <input type="password" name="password" id="password" required class="input">
            </div>

            <input type="submit" value="Enviar" class="buttons">
            <input type="reset" value="Limpiar" class="buttons">
        </form>
    </main>

    <footer id="registerChunk">
        <p>Si es usuario nuevo <a href="AltaClientesVerificado.jsp">Dar CLICK</a> aquí para Registrarse</p>
    </footer>
</body>
</html>