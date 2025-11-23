package org.example.project22;

import org.mariadb.jdbc.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    // SQL 쿼리
    private final String BOARD_INSERT = "INSERT INTO BOARD (title, writer, content) VALUES (?, ?, ?)";
    private final String BOARD_SELECT_ALL = "SELECT * FROM BOARD ORDER BY id DESC";
    private final String BOARD_SELECT_ONE = "SELECT * FROM BOARD WHERE id = ?";
    private final String BOARD_UPDATE = "UPDATE BOARD SET title=?, writer=?, content=? WHERE id=?";
    private final String BOARD_DELETE = "DELETE FROM BOARD WHERE id=?";
    private final String BOARD_UPDATE_CNT = "UPDATE BOARD SET cnt = cnt + 1 WHERE id = ?";

    // 글 작성 (INSERT)
    public int insertBoard(BoardVO vo) {
        System.out.println("-> JDBC로 insertBoard() 기능처리");
        try {
            conn = (Connection) JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_INSERT);
            stmt.setString(1, vo.getTitle());
            stmt.setString(2, vo.getWriter());
            stmt.setString(3, vo.getContent());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(stmt, conn);
        }
        return 0;
    }

    // 전체 목록 조회 (SELECT ALL)
    public List<BoardVO> getBoardList() {
        System.out.println("-> JDBC로 getBoardList() 기능처리");
        List<BoardVO> list = new ArrayList<>();
        try {
            conn = (Connection) JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_SELECT_ALL);
            rs = stmt.executeQuery();

            while (rs.next()) {
                BoardVO vo = new BoardVO();
                vo.setId(rs.getInt("id"));
                vo.setTitle(rs.getString("title"));
                vo.setWriter(rs.getString("writer"));
                vo.setContent(rs.getString("content"));
                vo.setRegdate(rs.getDate("regdate"));
                vo.setCnt(rs.getInt("cnt"));
                list.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return list;
    }

    // 단일 게시글 조회 (SELECT ONE)
    public BoardVO getBoard(int id) {
        System.out.println("-> JDBC로 getBoard() 기능처리");
        BoardVO vo = null;
        try {
            conn = (Connection) JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_SELECT_ONE);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                vo = new BoardVO();
                vo.setId(rs.getInt("id"));
                vo.setTitle(rs.getString("title"));
                vo.setWriter(rs.getString("writer"));
                vo.setContent(rs.getString("content"));
                vo.setRegdate(rs.getDate("regdate"));
                vo.setCnt(rs.getInt("cnt"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return vo;
    }

    // 글 수정 (UPDATE)
    public int updateBoard(BoardVO vo) {
        System.out.println("-> JDBC로 updateBoard() 기능처리");
        try {
            conn = (Connection) JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_UPDATE);
            stmt.setString(1, vo.getTitle());
            stmt.setString(2, vo.getWriter());
            stmt.setString(3, vo.getContent());
            stmt.setInt(4, vo.getId());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(stmt, conn);
        }
        return 0;
    }

    // 글 삭제 (DELETE)
    public int deleteBoard(int id) {
        System.out.println("-> JDBC로 deleteBoard() 기능처리");
        try {
            conn = (Connection) JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_DELETE);
            stmt.setInt(1, id);
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(stmt, conn);
        }
        return 0;
    }

    // 조회수 증가
    public void updateCnt(int id) {
        System.out.println("-> JDBC로 updateCnt() 기능처리");
        try {
            conn = (Connection) JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_UPDATE_CNT);
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(stmt, conn);
        }
    }
}