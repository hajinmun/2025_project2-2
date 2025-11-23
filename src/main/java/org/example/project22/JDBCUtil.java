package org.example.project22;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBCUtil {

    // 매번 새로운 연결 생성 (static 변수 제거)
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");

            // 환경 변수에서 DB 정보 읽기
            String dbHost = System.getenv("DB_HOST");
            String dbPort = System.getenv("DB_PORT");
            String dbName = System.getenv("DB_NAME");
            String dbUser = System.getenv("DB_USER");
            String dbPassword = System.getenv("DB_PASSWORD");

            // 환경 변수가 없으면 기본값 사용
            if (dbHost == null) {
                dbHost = "walab.handong.edu";
                dbPort = "3306";
                dbName = "W25_22300263";
                dbUser = "W25_22300263";
                dbPassword = "poo5Ae";
            }

            String url = String.format("jdbc:mariadb://%s:%s/%s?autoReconnect=true&useSSL=false",
                    dbHost,
                    dbPort != null ? dbPort : "3306",
                    dbName
            );

            System.out.println("DB 연결 시도: " + url);
            conn = DriverManager.getConnection(url, dbUser, dbPassword);
            System.out.println("DB 연결 성공!");

        } catch (Exception e) {
            System.out.println("DB 연결 실패: " + e.getMessage());
            e.printStackTrace();
        }
        return conn;
    }

    public static void close(ResultSet rs, PreparedStatement stmt, Connection conn) {
        try {
            if (rs != null) rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            if (stmt != null) stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void close(PreparedStatement stmt, Connection conn) {
        close(null, stmt, conn);
    }
}