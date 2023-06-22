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
    
</body>
</html>