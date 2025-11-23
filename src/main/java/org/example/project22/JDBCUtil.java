package org.example.project22;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil{
    private static Connection con = null;
    public static Connection getConnection(){
        try{
            if(con == null){
                Class.forName("com.mysql.jdbc.Driver");
                con= DriverManager.getConnection("jdbc:mysql://walab.handong.edu:3306","W25_2300263","poo5Ae");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
}