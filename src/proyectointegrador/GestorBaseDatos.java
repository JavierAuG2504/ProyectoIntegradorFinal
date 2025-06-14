/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyectointegrador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GestorBaseDatos {
    private static final String URL = "jdbc:mysql://localhost:3306/Proyecto";
    private static final String USUARIO = "root";
    private static final String CONTRASENA = "Barcelona1"; // 

    public static Connection conectar() {
        try {
            Connection conexion = DriverManager.getConnection(URL, USUARIO, CONTRASENA);
            System.out.println("Conexión exitosa a la base de datos.");
            return conexion;
        } catch (SQLException e) {
            System.out.println(" Error al conectar: " + e.getMessage());
            return null;
        }
    }
}
