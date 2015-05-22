/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SE;

import jess.ConsolePanel;
import jess.Rete;
import net.sourceforge.jFuzzyLogic.FIS;

/**
 * Test parsing an FCL file
 * @author pcingola@users.sourceforge.net
 */
public class LogicaDifusa {

    public static void main(String[] args) throws Exception {
                
        //Cargamos el SE
        Rete r = new Rete();

        //Ruta del archivo CLP
        r.batch("src/SE/SE.clp");
        
        //Generamos el panel que entrega Jess para la interfaz gráfica
        ConsolePanel c = new ConsolePanel(r);
        //Enviamos el panel al Frame java que creamos
        interfaz Frame = new interfaz(c);
        Frame.add(c);
        Frame.setVisible(true);
        
        //reset para para cargar hechos, reglas, etc del CLP
        r.reset();
        //Ejecutamos el SE
        r.run();
        
        // Load from 'FCL' file
        String fileName = "src/moduloLD/fuzzy.fcl";
        FIS fis = FIS.load(fileName, true);
        
        // Error while loading?
        if (fis == null) {
            System.err.println("Can't load file: '"
                    + fileName + "'");
            return;
        }

        // Show 
        fis.chart();
        
        // Set inputs
        
        // MODIFICAR NOMBRES DE VARIABLES
        fis.setVariable("edad", Double.parseDouble(r.fetch("age").toString()));
        fis.setVariable("distancia_a_zona", Double.parseDouble(r.fetch("zone").toString()));  // De 0 a 10 => distancia a la zona
        fis.setVariable("dias_de_viaje", Double.parseDouble(r.fetch("days").toString()));  // Hace cuántos días viajó
        fis.setVariable("estado_salud", Double.parseDouble(r.fetch("st").toString()));  // estado de salud
        // -------------------------------
        
        // Evaluate
        fis.evaluate();

        // Show output variable's chart 
        fis.getVariable("probabilidad").chartDefuzzifier(true);
        Double x = fis.getVariable("probabilidad").getLatestDefuzzifiedValue();
        
        x = Math.round(x * Math.pow(10,2)) / Math.pow(10,2);
        
        r.executeCommand("(assert (auxiliares (aux1 " + x + ") (aux2 1)))");
        r.run();
        
        System.err.println("Probabilidad: " + x + "%");
        
        // Print ruleSet
        // System.out.println(fis);
    }
}