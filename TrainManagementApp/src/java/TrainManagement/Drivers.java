/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TrainManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*; 


public class Drivers {
    // fields of Drivers
    public int driver_id; 
    public String first_name; 
    public String last_name; 
    public String contact_info;
    private int temp; 
    
    // lists
    public ArrayList<Integer> list_driver_id = new ArrayList<>(); 
    public ArrayList<String> list_first_name = new ArrayList<>();
    public ArrayList<String> list_last_name = new ArrayList<>();
    public ArrayList<String> list_contact_info = new ArrayList<>();
    
    public ArrayList<String> list_complete_name = new ArrayList<>(); 
    
    // constructor 
    public Drivers() {
        
    }
    
    public void display_driverRecords() {
                       
       try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // connect to database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtrains", "root", "Dlsuid12343080#");
            System.out.println("Connection successful!");
            
            PreparedStatement psmt = conn.prepareStatement("SELECT driver_id, first_name, last_name, contact_info FROM drivers");
            ResultSet rst = psmt.executeQuery();
            
            // clear list before adding values
            list_driver_id.clear();
            list_first_name.clear();            
            list_last_name.clear(); 
            list_contact_info.clear(); 
            
            while(rst.next()) {
                driver_id = rst.getInt("driver_id");
                first_name = rst.getString("first_name");
                last_name = rst.getString("last_name"); 
                contact_info = rst.getString("contact_info");
                
                list_driver_id.add(driver_id); 
                list_first_name.add(first_name);
                list_last_name.add(last_name);
                list_contact_info.add(contact_info);
            }
            
            psmt.close();
            conn.close(); // close connection
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
        }
    }
    
    public int update_driver_contactInfo() {
        temp = -1; 
               
       try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // connect to database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtrains", "root", "Dlsuid12343080#");
            System.out.println("Connection successful!");
            
            PreparedStatement psmt = conn.prepareStatement("UPDATE drivers SET contact_info = ? WHERE driver_id = ? ");
            psmt.setString(1, contact_info); 
            psmt.setInt(2, driver_id);

            psmt.executeUpdate();
            
            psmt.close();
            conn.close(); // close connection
            
            return 1; // if success
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
        }
        
        return 0; // if failure
    }
    
    public int delete_driver() {
       temp = -1; 
       
       try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // connect to database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtrains", "root", "Dlsuid12343080#");
            System.out.println("Connection successful!");
            
            PreparedStatement psmt = conn.prepareStatement("DELETE FROM drivers WHERE driver_id = ?");
            psmt.setInt(1, driver_id); 

            psmt.executeUpdate();
            
            psmt.close();
            conn.close(); // close connection
            
            return 1; // if success
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
        }
        
        return 0; // if failure
    
    }
    
    // continue this function
    public int current_drivers() {
        temp = -1; 
       
       try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // connect to database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtrains", "root", "Dlsuid12343080#");
            System.out.println("Connection successful!");
            
            // Use the connection (e.g., create a statement, execute queries, etc.)
            
            PreparedStatement psmt = conn.prepareStatement("SELECT driver_id, first_name, last_name FROM drivers");
            ResultSet rst = psmt.executeQuery();
            
            list_driver_id.clear(); 
            list_complete_name.clear(); 
            
            while(rst.next()) {
                driver_id = rst.getInt("driver_id");
                first_name = rst.getString("first_name");
                last_name = rst.getString("last_name"); 
                
                list_driver_id.add(driver_id); 
                list_complete_name.add(first_name + " " + last_name); 
            }
            
            psmt.close();
            conn.close(); // close connection
            
            return 1; // if success
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
        }
        
        return 0; // if failure
    }
    
    public int register_newDriver() {
       temp = -1; 
       
       try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // connect to database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtrains", "root", "Dlsuid12343080#");
            System.out.println("Connection successful!");
            
            // Use the connection (e.g., create a statement, execute queries, etc.)
            
            PreparedStatement psmt = conn.prepareStatement("SELECT MAX(driver_id) + 1 AS new_id FROM drivers");
            ResultSet rst = psmt.executeQuery();
            
            while(rst.next()) {
                driver_id = rst.getInt("new_id");
            }
            
            psmt = conn.prepareStatement("INSERT INTO drivers (driver_id, first_name, last_name, contact_info) VALUES(?, ?, ?, ?)");
            psmt.setInt(1, driver_id); 
            psmt.setString(2, first_name);
            psmt.setString(3, last_name); 
            psmt.setString(4, contact_info);
            
            psmt.executeUpdate();
            
            psmt.close();
            conn.close(); // close connection
            
            return 1; // if success
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
        }
        
        return 0; // if failure
    }
 }
    
