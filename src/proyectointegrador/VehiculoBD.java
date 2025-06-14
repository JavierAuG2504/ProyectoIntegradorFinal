/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyectointegrador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;


public class VehiculoBD {
    private final String URL = "jdbc:mysql://localhost:3306/proyecto";  
    private final String USER = "root";
    private final String PASSWORD = "Barcelona1";

    private Connection conectar() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public void guardarVehiculo(Vehiculo vehiculo) {
        String sql = "INSERT INTO Vehiculo (Marca, Modelo, Anio, Placa, Cap_Tanque) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, vehiculo.getMarca());
            stmt.setString(2, vehiculo.getModelo());
            stmt.setInt(3, vehiculo.getAnio());
            stmt.setString(4, vehiculo.getPlaca());
            stmt.setDouble(5, vehiculo.getCapTanque());

            stmt.executeUpdate();
            System.out.println("Vehículo guardado correctamente en la base de datos.");
        } catch (SQLException e) {
            System.out.println("Error al guardar vehículo: " + e.getMessage());
        }
    }


    public List<Vehiculo> obtenerVehiculos() {
        List<Vehiculo> lista = new ArrayList<>();
        String sql = "SELECT * FROM Vehiculo";

        try (Connection conn = conectar();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Vehiculo vehiculo = new Vehiculo();//constructor en vehiculo, para la bd 
                vehiculo.setIdVehiculo(rs.getInt("Id_Vehiculo"));
                vehiculo.setMarca(rs.getString("Marca"));
                vehiculo.setModelo(rs.getString("Modelo"));
                vehiculo.setAnio(rs.getInt("Anio"));
                vehiculo.setPlaca(rs.getString("Placa"));
                vehiculo.setCapTanque(rs.getDouble("Cap_Tanque"));
                lista.add(vehiculo);
            }

        } catch (SQLException e) {
            System.out.println("Error al obtener vehículos: " + e.getMessage());
        }

        return lista;
    }
}

