package org.example.project22;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil{
    private static Connection con = null;
    public static Connection getConnection(){
        try{//재연결
            if(con == null){
                Class.forName("org.mariadb.jdbc.Driver");
                con= DriverManager.getConnection("jdbc:mariadb://walab.handong.edu:3306/W25_22300263","W25_22300263","poo5Ae");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }

    //연결 여부 검사
//    public static void main(String[] args){
//        Connection con=JDBCUtil.getConnection();
//        if(con!=null){
//            System.out.print("연결성공");
//        }
    }


