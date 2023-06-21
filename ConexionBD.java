import java.sql.*;

public class ConexionBD {

    public static void main(String[] args) {
        
        //---------------------------------REGISTRO DE USUARIO
        
        ConexionBD con = new ConexionBD();
    
        int result = con.registrarUsr("id", "nombre", "direccion", "ciudad", "estado", "80029", "0123456789", "limite", "comentario");

        System.out.println("El resultado fué " + result);

        
    }

    public int registrarUsr(String ide_cli, String nom_cli, String dir_cli, String ciu_cli, String est_cli,
    String cop_cli, String tel_cli, String ldc_cli, String com_cli) {
        
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