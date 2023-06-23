<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/estiloForm1.css">
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

</head>
<body>
    
    <header id="header">
        <!--Sección del logo-->
        <figure id="logo">
            <a href="index.html">
                <img src="CSS/imagenes/logo.png" alt="logo" id="logo-img">
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

                                if (!passIngresada.equals("nopassword")) {

                                    if (!existeUsuario || !existePass) {
    
                                        out.println("<p class='aviso'>El usuario o la contraseña son incorrectos</p>");
    
                                    }

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
                <p class="texto-login">¿Nuevo usuario? <a href="formulario2.jsp" id="link-nuevo-usr">Haz click aquí</a> para registrarte.</p>
            </div>
        </section>
    </main>
</body>
</html>