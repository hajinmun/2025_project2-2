package org.example.project22;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil{
    private static Connection con = null;
    public static Connection getConnection(){
        try{//재연결
            if(con == null){
                Class.forName("com.mariadb.jdbc.Driver");
                con= DriverManager.getConnection("jdbc:mariadb://walab.handong.edu:3306/W25_22300263","W25_2300263","poo5Ae");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
}