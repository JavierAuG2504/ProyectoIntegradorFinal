/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyectointegrador;

import javax.swing.JOptionPane;

public class HiloGuardarCarga extends Thread {

    private Carga carga;

    public HiloGuardarCarga(Carga carga) {
        this.carga = carga;
    }

    @Override
    public void run() {
        CargaBD cargaBD = new CargaBD();
        boolean exito = cargaBD.guardarCarga(carga);

        if (exito) {
            JOptionPane.showMessageDialog(null, "Carga guardada exitosamente.");
        } else {
            JOptionPane.showMessageDialog(null, "Error al guardar la carga.");
        }
    }
}
