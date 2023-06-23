<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alta de clientes</title>
    <link rel="stylesheet" href="CSS/estiloFormo2.css">

    <!--Clase conexión a BD-->
    <%

    class ConexionBD {

        //Here lies consultarUsr
    
        public int registrarUsr(String ide_cli, String nom_cli, String dir_cli, String ciu_cli, String est_cli,
        int cop_cli, int tel_cli, Double ldc_cli, String com_cli) {
            
            try {
                
                Class.forName(driver);

                cx = DriverManager.getConnection(url, user, password);

                System.out.println("Conexion establecida");

                st = cx.createStatement();

                System.out.println("SQL update: INSERT INTO `mclientes`(`ide_cli`, `nom_cli`, `dir_cli`, `ciu_cli`, `est_cli`, `cop_cli`, `tel_cli`, `ldc_cli`, `com_cli`) VALUES ('" + ide_cli + "', '" + nom_cli + "', '" + dir_cli + "', '" + ciu_cli + "', '" + est_cli +  "', '" + cop_cli + "', '" + tel_cli + "', '" + ldc_cli + "',  '" + com_cli + "');");

                st.executeUpdate("INSERT INTO `mclientes`(`ide_cli`, `nom_cli`, `dir_cli`, `ciu_cli`, `est_cli`, `cop_cli`, `tel_cli`, `ldc_cli`, `com_cli`) VALUES ('" + ide_cli + "', '" + nom_cli + "', '" + dir_cli + "', '" + ciu_cli + "', '" + est_cli +  "', '" + cop_cli + "', '" + tel_cli + "', '" + ldc_cli + "',  '" + com_cli + "');");

                cx.close();

                return 1;

            } catch (SQLException e) {
                // TODO: handle exception
                System.out.println(e.getMessage());
                System.out.println("SQLExeption al registrar cliente");

            } catch (ClassNotFoundException e) {

                System.out.println("ClassNotFoundException al registrar cliente");

            }

            return -1;
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

    %>

    <!--Declarar variables y retomar valores-->
    <%

    String 
    ide_cli = "",
    nom_cli = "",
    dir_cli = "",
    ciu_cli = "",
    est_cli = "",
    com_cli = "";

    int
    cop_cli = 0,
    tel_cli = 0;

    Double 
    ldc_cli = 0.0;

    //Recabar datos

    try {

        nom_cli = request.getParameter("nom_cli");
        dir_cli = request.getParameter("dir_cli");
        ciu_cli = request.getParameter("ciu_cli");
        est_cli = request.getParameter("est_cli");
        cop_cli = Integer.parseInt(request.getParameter("cop_cli"));
        tel_cli = Integer.parseInt(request.getParameter("tel_cli"));
        ldc_cli = Double.parseDouble(request.getParameter("ldc_cli"));
        com_cli = request.getParameter("com_cli");
        
        ide_cli = request.getParameter("ide_cli");

    } catch (Exception e) {

        ide_cli = "noid";

    }

    %>

    <!--Actualización a BD-->
    <%

    String aviso = "<p class='aviso'>Los datos no se enviaron correctamente</p>";
    int result = -1;

    if (!ide_cli.equals("noid")) {

        try {

            ConexionBD cx = new ConexionBD();
            result = cx.registrarUsr(ide_cli, nom_cli, dir_cli, ciu_cli, est_cli, cop_cli, tel_cli, ldc_cli, com_cli);

        } catch (Exception e) {

        }

    } else {

        result = -1;

    }

    %>

    <script>

        //Función para comrpobar el teléfono
        const comprobarTelefono = () => {

            const campo = document.getElementById("tel_cli");

            const expresion = /\D/;

            console.log("Se ejecuta");

            if (expresion.test(campo.value)) {

                campo.setCustomValidity("Este campo sólo acepta números");
                console.warn("Se ha insertado algo que no es un número");

            } else {

                campo.setCustomValidity("");

            }

        }

        //Función para el límite de crédito

        //Función para los campos obligatorios

    </script>
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
                            <td class="celdas-input"><input type="number" class="input" name="ldc_cli" id="ldc_cli" step="any"></td>
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

                <%

                if (result != 1) {

                    out.println(aviso);

                }

                %>
            </div>
        </section>
    </main>

    <script>

        window.onload = () => {

            document.getElementById("tel_cli").oninput = comprobarTelefono;

        }

        comprobarTelefono();
    </script>

</body>
</html>