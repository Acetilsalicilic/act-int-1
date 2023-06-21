<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alta de clientes</title>
    <link rel="stylesheet" href="estiloForm2.css">
</head>
<body>
    <header>
        <div><img src="Logo_IPN.png" alt="Logo"></div>
        <h1>Alta de Clientes</h1>
        <p>Por favor ingrese los datos del cliente a dar de alta:</p>
    </header>

    <main>
        <form action="AltaClientesVerificado.jsp" method="post">
            <table>
                <tbody>
                    <tr>
                        <td class="cell"><label for="IDClienteInput" class="inputLabel">ID Cliente</label></td>
                        <td class="cell"><input type="text" name="id" id="IDClienteInput" class="textarea" required></td>
                    </tr>
                    <tr>
                        <td class="cell"><label for="NombreInput" class="inputLabel">Nombre</label></td>
                        <td class="cell"><input type="text" name="nombre" id="NombreInput" class="textarea" required></td>
                    </tr>
                    <tr>
                        <td class="cell"><label for="DireccionInput" class="inputLabel">Dirección</label></td>
                        <td class="cell"><input type="text" name="dir" id="DireccionInput" class="textarea" required></td>
                    </tr>
                    <tr>
                        <td class="cell"><label for="CiudadInput" class="inputLabel">Ciudad</label></td>
                        <td class="cell"><input type="text" name="cid" id="CiudadInput" class="textarea"></td>
                    </tr>
                    <tr>
                        <td class="cell"><label for="EstadoInput" class="inputLabel">Estado</label></td>
                        <td class="cell"><input type="text" name="est" id="EstadoInput" class="textarea"></td>
                    </tr>
                    <tr>
                        <td class="cell"><label for="CPInput" class="inputLabel">Código postal</label></td>
                        <td class="cell"><input type="text" name="cp" id="CPInput" class="textarea"></td>
                    </tr>
                    <tr>
                        <td class="cell"><label for="TelInput" class="inputLabel">Teléfono</label></td>
                        <td class="cell"><input type="text" name="tel" id="TelInput" class="textarea" pattern="\d+" required></td>
                    </tr>
                    <tr>
                        <td class="cell"><label for="LdCInput" class="inputLabel" >Límite de crédito</label></td>
                        <td class="cell"><input type="text" name="lc" id="LdCInput" class="textarea"></td>
                    </tr>
                    <tr>
                        <td class="cell"><label for="ComInput" class="inputLabel">Comentarios</label></td>
                        <td class="cell"><input type="text" name="com" id="ComInput" class="textarea"></td>
                    </tr>
                </tbody>
            </table>

            <a href="index.html"><input type="button" value="Cancelar" id="cancelButton" class="buttons"></a>
            <input type="submit" value="Dar de Alta" id="submitButton" class="buttons">
        </form>

        <script>

            //En éste código se verifica que el valor del límite de crédito sea, de hecho, un número decimal, utilizando una expresión regular

            const credito = document.getElementById("LdCInput");

            const regex = new RegExp("\D");

            credito.addEventListener('input', function (event) {

                if (regex.test(credito.value.toString())) {

                    console.log("Mensaje de test");
                    credito.setCustomValidity("Solo se aceptan números decimales");

                } else if (!regex.test(credito.value.toString())) {

                    credito.setCustomValidity();

                }
            })

        </script>
    </main>

    <!--//////////////////////////////////////////////////////////UPDATE A BD////////////////////////////////////////-->

    <%
        //CÓDIGO PARA EL UPDATE

        //---------------------DECLARACIÓN DE CLASE DE CONSULTA-------------
        class ConexionBD {
            
                    public int registrarUsr(String ide_cli, String nom_cli, String dir_cli, String ciu_cli, String est_cli,
            String cop_cli, String tel_cli, String ldc_cli, String com_cli) {
                
                try {
                    
                    Class.forName(driver);

                    cx = DriverManager.getConnection(url, user, password);

                    System.out.println("Conexion establecida");

                    st = cx.createStatement();

                    System.out.println("SQL update: INSERT INTO `mclientes`(`ide_cli`, `nom_cli`, `dir_cli`, `ciu_cli`, `est_cli`, `cop_cli`, `tel_cli`, `ldc_cli`, `com_cli`) VALUES ('" + ide_cli + "', '" + nom_cli + "', '" + dir_cli + "', '" + ciu_cli + "', '" + est_cli +  "', '" + cop_cli + "', '" + tel_cli + "', '" + ldc_cli + "',  '" + com_cli + "');");

                    st.executeLargeUpdate("INSERT INTO `mclientes`(`ide_cli`, `nom_cli`, `dir_cli`, `ciu_cli`, `est_cli`, `cop_cli`, `tel_cli`, `ldc_cli`, `com_cli`) VALUES ('" + ide_cli + "', '" + nom_cli + "', '" + dir_cli + "', '" + ciu_cli + "', '" + est_cli +  "', '" + cop_cli + "', '" + tel_cli + "', '" + ldc_cli + "',  '" + com_cli + "');");

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

        //---------------------------------UPDATE A BD---------------*****************************************

        ConexionBD con = new ConexionBD();

        String 
        ide_cli = request.getParameter("id"),
        nom_cli = request.getParameter("nombre"),
        dir_cli = request.getParameter("dir"),
        ciu_cli = request.getParameter("cid"),
        est_cli = request.getParameter("est"),
        tel_cli = request.getParameter("tel"),
        cop_cli = request.getParameter("cp"),
        ldc_cli = request.getParameter("lc"),
        com_cli = request.getParameter("com");

        /*out.println("<p>" + ide_cli + "</p>");
        out.println("<p>" + nom_cli + "</p>");
        out.println("<p>" + dir_cli + "</p>");
        out.println("<p>" + ciu_cli + "</p>");
        out.println("<p>" + est_cli + "</p>");
        out.println("<p>" + tel_cli + "</p>");
        out.println("<p>" + cop_cli + "</p>");
        out.println("<p>" + ldc_cli + "</p>");
        out.println("<p>" + com_cli + "</p>");*/

        /*System.out.println(ide_cli);
        System.out.println(nom_cli);
        System.out.println(dir_cli);
        System.out.println(ciu_cli);
        System.out.println(est_cli);
        System.out.println(tel_cli);
        System.out.println(cop_cli);
        System.out.println(ldc_cli);
        System.out.println(com_cli);*/
        
        try {

            if (!ide_cli.equals(null)) {
    
                int result = con.registrarUsr(ide_cli, nom_cli, dir_cli, ciu_cli, est_cli, cop_cli, tel_cli, ldc_cli, com_cli);
                out.println("<p>El resultado es de " + result + "</p>");
                //response.sendRedirect("form2.jsp?id="+ ide_cli + "&nombre=" + nom_cli);
    
            }
        } catch (Exception e) {

        }

    %>

</body>
</html>