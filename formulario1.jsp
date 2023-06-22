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

    } catch (Exception e) {

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

    } catch (Exception e) {

    }

    %>
    <!--//////////////////////////////////////////////////////FIN DE SCRIPLET//////////////////////////-->

    
    <style>
        * {
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            margin: 0px;
            height:100%;
            overflow-x: hidden;
            overflow: hidden;
        }

        /*Header*/
        #header {
            margin: 0;
            background-color: #3287d1;
            position: fixed;
            width: 100%;
            height: 120px;
            display: block;
            z-index: 100;
        }

        #logo {
            float: left;
            margin-right: 0px;
        }

        #logo-img {
            width: 100px;
            border-radius: 5px;
        }

        #link-otros {
            display: inline-block;
        }

        #lista-links {
            width: 90%;
            margin-top: 50px;
            margin-left: 15%;
        }

        .links-de-interes {
            display: inline-block;
            margin: 0 5%;
            
        }

        .links-superiores {
            text-decoration: none;
            color: white;
            font-size: 20px;
        }

        /*Fondo*/
        #fondo {
            position: relative;
            top: 120px;
            background-image: url(imagenes/banner.jpg);
            background-size:cover;
            width: 100%;
            height: 100%;
            padding: 20px;
        }

        #fondo-gris {
            position: relative;
            left: 5%;
            background-color:#1717178b;
            padding: 50px;
            margin: 50px 0px;
            margin-top: 5px;
            width: 80%;
            height: 80%;
        }

        /*Login*/
        .texto-login {
            color: #fff;
            text-align: center;
        }

        #titulo-login {
            font-size: 35px;
        }

        #parrafo-login {
            font-size: 25px;
        }

        .celdas-input {
            padding-top: 10px;
        }

        #tabla-inputs {
            position: relative;
            width: 50%;
            left: 25%;
            text-align: center;
        }

        .input-label {
            color: #ffffff;
            font-size: 25px;
        }

        .input {
            color: white;
            border: solid 2px #636363;
            background-color: rgba(0, 0, 0, 0.14);
            font-size: 20px;
        }

        .input:hover {
            color: white;
            border: solid 2px #a4a4a4;
            background-color: rgb(0, 0, 0);
        }

        #login-button {
            margin: 10px;
            margin-top: 50px;
            padding: 10px;
            background-color: rgba(0, 0, 0, 0.14);
            color: white;
            border: solid 2px #636363;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 25px;
        }

        #login-button:hover {
            margin: 10px;
            margin-top: 50px;
            padding: 10px;
            background-color: rgb(0, 0, 0);
            color: white;
            border: solid 2px #a4a4a4;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 25px;
        }

        #link-nuevo-usr {
            color: #3287d1;
        }

        #link-nuevo-usr:hover {
            color: #236dc2;
        }

        /*Aviso de inexistencia*/
        .aviso {
            color: rgb(237, 86, 22);
            text-align: center;
        }
    </style>
</head>
<body>
    
    <header id="header">
        <!--Sección del logo-->
        <figure id="logo">
            <a href="index.html">
                <img src="imagenes/logo.png" alt="logo" id="logo-img">
            </a>
        </figure>

        <!--Encabezado de página con links a otras páginas de interés-->
        <nav id="links-otros">
            <ul id="lista-links">
                <li class="links-de-interes"><a href="formulario1.jsp" class="links-superiores">Iniciar Sesión</a></li>
                <li class="links-de-interes"><a href="#" class="links-superiores">Quiénes somos</a></li>
                <li class="links-de-interes"><a href="#" class="links-superiores">Contacto</a></li>
                <li class="links-de-interes"><a href="#" class="links-superiores">Catálogo</a></li>
            </ul>
        </nav>
    </header>
    
    <!--Decoración-->
    <main id="fondo">
        <section id="fondo-gris">
            <div id="contenedor-login">
                <h2 id="titulo-login" class="texto-login">Inicio de sesión</h2>
                <p id="parrafo-login" class="texto-login">Por favor ingrese su usario y contraseña</p>
                
                <!--Inicio de sesión-->
                <form action="formulario1.jsp" method="post">

                    <table id="tabla-inputs">
                        <tr>
                            <td class="celdas-input">
                                <label for="username" class="input-label">Usuario</label>
                            </td>
                            <td class="celdas-input">
                                <input type="text" name="username" id="username" class="input">
                            </td>
                        </tr>
                        <tr>
                            <td class="celdas-input">
                                <label for="password" class="input-label">Contraseña</label>
                            </td>
                            <td class="celdas-input">
                                <input type="password" name="password" id="password" class="input">
                            </td>
                        </tr>

                        <%
                            //Avisar si existe el usuario

                            /*
                            out.println("<p class='aviso'>" + usuarioIngresado + "</p>");
                            out.println("<p class='aviso'>" + passIngresada + "</p>");
                            */

                            if (!usuarioIngresado.equals("nouser")) {

                                if (!existeUsuario && !existePass) {

                                    out.println("<p class='aviso'>El usuario o la contraseña son incorrectos</p>");

                                }

                            }
                        %>

                        <tr>
                            <td colspan="2" class="celdas-input">
                                <input type="submit" value="Iniciar sesión" id="login-button">
                            </td>
                        </tr>
                    </table>
                </form>

                
                <!--Registro de usuario nuevo-->
                <p class="texto-login">¿Nuevo usuario? <a href="#" id="link-nuevo-usr">Haz click aquí</a> para registrarte.</p>
            </div>
        </section>
    </main>
</body>
</html>