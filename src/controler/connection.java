/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author JUNAN
 */
public class connection {
    static Connection conn;

    
    public static Connection connectionDB() {
            try {
                 
                  String url = "jdbc:mysql://localhost:3306/db_bapena";
            String user = "root";
            String password = "";
                DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                
                 conn = DriverManager.getConnection(url, user, password);
                
                 System.out.println("Connection Successfully");
                
            }catch (SQLException ex) {
                System.out.println("failed connection to database"+ex.getMessage());
            }
        
        return conn;
    }

    public static void main(String args[]){
    connectionDB();
}
}


