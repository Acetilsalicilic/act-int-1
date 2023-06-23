<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alta de clientes</title>
    <link rel="stylesheet" href="CSS/estiloForm2.css">
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
                <li class="links-de-interes"><a href="formulario2.jsp" class="links-superiores">Quiénes somos</a></li>
                <li class="links-de-interes"><a href="#" class="links-superiores">Contacto</a></li>
                <li class="links-de-interes"><a href="#" class="links-superiores">Catálogo</a></li>
            </ul>
        </nav>
    </header>

    <main id="fondo">
        <section id="fondo-gris">
            <div id="contenedor-login">
                <h2 id="titulo-login" class="texto-login">Registro de clientes</h2>
                <p id="parrafo-login" class="texto-login">Por favor ingrese los datos solicitados</p>
                
                <!--Inicio de sesión-->
                <form action="formulario2.jsp" method="post">
                    
                    <table id="tabla-inputs">
                        <tr>
                            <td class="celdas-input"><label for="ide_cli" class="input-label">ID Cliente</label></td>
                            <td class="celdas-input"><input type="text" name="ide_cli" id="ide_cli" class="input"></td>
                        </tr>
                        <tr>
                            <td class="celdas-input"><label for="nom_cli" class="input-label">Nombre</label></td>
                            <td class="celdas-input"><input type="text" class="input" name="nom_cli" id="nom_cli"></td>
                        </tr>
                        <tr>
                            <td class="celdas-input"><label for="dir_cli" class="input-label">Dirección</label></td>
                            <td class="celdas-input"><input type="text" class="input" name="dir_cli" id="dir_cli"></td>
                        </tr>
                        <tr>
                            <td class="celdas-input"><label for="ciu_cli" class="input-label">Ciudad</label></td>
                            <td class="celdas-input"><input type="text" class="input" name="ciu_cli" id="ciu_cli"></td>
                        </tr>
                        <tr>
                            <td class="celdas-input"><label for="est_cli" class="input-label">Estado</label></td>
                            <td class="celdas-input"><input type="text" class="input" name="est_cli" id="est_cli"></td>
                        </tr>
                        <tr>
                            <td class="celdas-input"><label for="cop_cli" class="input-label">Código Postal</label></td>
                            <td class="celdas-input"><input type="number" class="input" name="cop_cli" id="cop_cli"></td>
                        </tr>
                        <tr>
                            <td class="celdas-input"><label for="tel_cli" class="input-label">Teléfono</label></td>
                            <td class="celdas-input"><input type="tel" class="input" name="tel_cli" id="tel_cli"></td>
                        </tr>
                        <tr>
                            <td class="celdas-input"><label for="ldc_cli" class="input-label">Límite de crédito</label></td>
                            <td class="celdas-input"><input type="number" class="input" name="ldc_cli" id="ldc_cli"></td>
                        </tr>
                        <tr>
                            <td class="celdas-input"><label for="com_cli" class="input-label">Comentarios</label></td>
                            <td class="celdas-input"><input type="text" class="input" name="com_cli" id="com_cli"></td>
                        </tr>

                        <tr>
                            <td colspan="2" class="celdas-input">
                                <input type="submit" value="Registrar" id="reg-button">
                            </td>
                        </tr>
                    </table>

                </form>
            </div>
        </section>
    </main>
</body>
</html>