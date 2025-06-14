/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyectointegrador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CargaBD {
    private final String URL = "jdbc:mysql://localhost:3306/proyecto";
    private final String USER = "root";
    private final String PASSWORD = "Barcelona1";

    private Connection conectar() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // CREATE
    public boolean guardarCarga(Carga carga) {
        String sql = "INSERT INTO Carga (Fecha, Costo_Total, Litros_Cargados, Id_Vehiculo, Id_Estacion) " +
                     "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, carga.getFecha());
            stmt.setDouble(2, carga.getCostoTotal());
            stmt.setDouble(3, carga.getLitrosCargados());
            stmt.setInt(4, carga.getIdVehiculo());
            stmt.setInt(5, carga.getIdEstacion());

            int filasAfectadas = stmt.executeUpdate();
            return filasAfectadas > 0;

        } catch (SQLException e) {
            System.out.println("Error al guardar la carga: " + e.getMessage());
            return false;
        }
    }

    // READ
    public List<Carga> obtenerCargas() {
        List<Carga> lista = new ArrayList<>();
        String sql = "SELECT * FROM Carga";

        try (Connection conn = conectar();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("Id_Carga");
                String fecha = rs.getString("Fecha");
                double litros = rs.getDouble("Litros_Cargados");
                double costo = rs.getDouble("Costo_Total");
                int idVehiculo = rs.getInt("Id_Vehiculo");
                int idEstacion = rs.getInt("Id_Estacion");

                Carga carga = new Carga(fecha, litros, costo, idVehiculo, idEstacion);
                carga.setIdEstacion(id); // Necesitas este setter en tu clase Carga
                lista.add(carga);
            }

        } catch (SQLException e) {
            System.out.println("Error al obtener las cargas: " + e.getMessage());
        }

        return lista;
    }
}
