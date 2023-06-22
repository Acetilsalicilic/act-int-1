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

    </style>
</head>
<body>
    
    <header id="header">
        <!--Sección del logo-->
        <figure id="logo">
            <img src="imagenes/logo.png" alt="logo" id="logo-img">
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
                <form action="#" method="post">

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