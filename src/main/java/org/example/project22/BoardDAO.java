package org.example.project22;

import org.mariadb.jdbc.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BoardDAO {
    //쿼리 실행 위한 클래스
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String BOARD_INSERT = "insert into BOARD (title, writer, content) values (?, ?, ?)";

    public int insertBoard(BoardVO vo) {
        System.out.println("-> JCBC로 insertBoard() 기능처리");
        try{
            conn = (Connection) JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_INSERT);
            stmt.setString(1, vo.getTitle());
            stmt.setString(2, vo.getWriter());
            stmt.setString(3, vo.getContent());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

//    public static void main(String[] args) {
//        BoardVO vo = new BoardVO("제목", "hajin", "내용");
//        BoardDAO dao = new BoardDAO();
//        int result = dao.insertBoard(vo);
//
//        if (result == 1) {
//            System.out.println("추가 완료");
//        }
//    }
}
