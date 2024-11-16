/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import java.util.*; 
import java.sql.*; 

public class TrainLine {
    // fields of train line
    public int train_line_id;
    public String line_name; 
    public String company_handler; 
    public boolean is_operational;
    
    // list of train line
    public ArrayList<Integer> list_trainLineID       = new ArrayList<>();
    public ArrayList<String> list_lineName           = new ArrayList<>();
    public ArrayList<String> list_company_handler    = new ArrayList<>();
    public ArrayList<Boolean> list_isOperational     = new ArrayList<>();
    
    // constructor
    public TrainLine() {}
    
    
    public int register_TrainLine() {
        
        try {
            // connect to database
            Connection conn; 
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/?user=root");
            System.out.println("Connection successful!");
            
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
        
        return 0;
    }
    
    
    public static void main(String[] args) {
        TrainLine test = new TrainLine();
        
        test.register_TrainLine();
    }
    
}
