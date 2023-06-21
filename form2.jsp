<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.swing.*" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Procesar formulario 2</title>

    <style>
        * {
            font-family: 'Courier New', Courier, monospace;
        }

        h1 {
            text-align: center;
        }

        hr {
            margin: 50px 0;
        }

        p {
            margin: 25px 0;
            width: 75%;
            position: relative;
            left: 12%;
        }

        table {
            position: relative;
            width: 90%;
            left: 5%;
            border: 2px solid rgb(229, 229, 229);
        }

        td {
            width: 11%;
        }

        #coment {
            width: 25%;
        }

        #cabecera {
            font-weight: 600;
            margin-bottom: 50px;
        }

        #titulos {
            font-weight: 600;
        }

        a {
            color: black;
            margin: 75px;
            float: right;
            text-align: right;
        }

    </style>
</head>
<body>
    <h1>
        Resultados formulario de registro de cliente
    </h1>

    <p>A continuación, se muestran los resultados de los datos obtenidos del formulario de registro de nuevo cliente:</p>

    <hr>

    <table>
        <caption id="cabecera">Resultados</caption>
        <thead>
            <tr id="titulos">
                <td>
                    <p>ID Cliente</p>
                </td>
                <td>
                    <p>Nombre</p>
                </td>
                <td>
                    <p>Dirección</p>
                </td>
                <td>
                    <p>Ciudad</p>
                </td>
                <td>
                    <p>Estado</p>
                </td>
                <td>
                    <p>Código Postal</p>
                </td>
                <td>
                    <p>Teléfono</p>
                </td>
                <td>
                    <p>Límite de crédito</p>
                </td>
                <td id="coment">
                    <p>Comentarios</p>
                </td>
            </tr>
        </thead>

        <tbody>

            <%
                String id = request.getParameter("id");
                String nombre = request.getParameter("nombre");
                String direccion = request.getParameter("dir");
                String ciudad = request.getParameter("cid");
                String estado = request.getParameter("est");
                String cp = request.getParameter("cp");
                String telefono = request.getParameter("tel");
                String lc = request.getParameter("lc");
                String com = request.getParameter("com");

            %>

            <tr>
                <td>
                    <p><%out.println(id);%></p>
                </td>
                <td>
                    <p><%out.println(nombre);%></p>
                </td>
                <td>
                    <p><%out.println(direccion);%></p>
                </td>
                <td>
                    <p><%out.println(ciudad);%></p>
                </td>
                <td>
                    <p><%out.println(estado);%></p>
                </td>
                <td>
                    <p><%out.println(cp);%></p>
                </td>
                <td>
                    <p><%out.println(telefono);%></p>
                </td>
                <td>
                    <p><%out.println(lc);%></p>
                </td>
                <td>
                    <p><%out.println(com);%></p>
                </td>
            </tr>
        </tbody>
    </table>

    <a href="index.html">Regresar</a>
</body>
</html>