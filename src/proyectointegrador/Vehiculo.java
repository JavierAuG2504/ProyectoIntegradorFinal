package proyectointegrador;


public class Vehiculo {
    private int idVehiculo;             
    private String marca;
    private String modelo;
    private int anio;
    private String placa;
    private double capTanque;
    
    public Vehiculo() {
   //para la bd
}

    
    
    public Vehiculo(String marca, String modelo, int anio, String placa, double capTanque) {
        this.marca = marca;
        this.modelo = modelo;
        this.anio = anio;
        this.placa = placa;
        this.capTanque = capTanque;
    }

    // Getters y setters
    public int getIdVehiculo() {
        return idVehiculo;
    }

    public void setIdVehiculo(int idVehiculo) {
        this.idVehiculo = idVehiculo;
    }

    public String getMarca() {
        return marca;
    }

    public String getModelo() {
        return modelo;
    }

    public int getAnio() {
        return anio;
    }

    public String getPlaca() {
        return placa;
    }

    public double getCapTanque() {
        return capTanque;
    }
    
    public void setMarca(String marca) {
    this.marca = marca;
}

    public void setModelo(String modelo) {
    this.modelo = modelo;
}

    public void setAnio(int anio) {
    this.anio = anio;
}

    public void setPlaca(String placa) {
    this.placa = placa;
}

    public void setCapTanque(double capTanque) {
    this.capTanque = capTanque;
}

}
