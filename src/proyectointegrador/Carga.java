/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package proyectointegrador;

public class Carga {
    private String fecha;
    private double costoTotal;
    private double litrosCargados;
    private int idVehiculo;
    private int idEstacion;

    public Carga(String fecha, double costoTotal, double litrosCargados, int idVehiculo, int idEstacion) {
        this.fecha = fecha;
        this.costoTotal = costoTotal;
        this.litrosCargados = litrosCargados;
        this.idVehiculo = idVehiculo;
        this.idEstacion = idEstacion;
    }

    // Getters
    public String getFecha() {
        return fecha;
    }

    public double getCostoTotal() {
        return costoTotal;
    }

    public double getLitrosCargados() {
        return litrosCargados;
    }

    public int getIdVehiculo() {
        return idVehiculo;
    }

    public int getIdEstacion() {
        return idEstacion;
    }

    public void setIdEstacion(int idEstacion) {
    this.idEstacion = idEstacion;
}

}
