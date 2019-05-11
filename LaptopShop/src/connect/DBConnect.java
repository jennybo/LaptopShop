/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect;
 
import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnect {
    
     public static Connection getConnecttion() {
        Connection cons = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            cons = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/shopdata?useSSL=false&allowPublicKeyRetrieval=true", "root", "1234");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cons;
    }
 
   public static void main(String args[]) { boolean a = true; boolean b = !true; boolean c = a | b; boolean d = a & b; boolean e = d ? b : c; System.out.println(d + " " + e); } 
    
}
