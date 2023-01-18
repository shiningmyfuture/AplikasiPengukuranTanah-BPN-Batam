/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */

 

package tester;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JUNAN
 */
public class tesMysql {

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        // TODO code application logic here
        String forName = "com.mysql.cj.jdbc.Driver";
        try {
            Class.forName(forName);
            System.out.println("Successfully");
        } catch (ClassNotFoundException ex) {
            System.out.println("Driver Failed");
            System.out.println(ex.getMessage());
        }
    }
    }

