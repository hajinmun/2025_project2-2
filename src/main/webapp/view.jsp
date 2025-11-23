<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.project22.BoardDAO, org.example.project22.BoardVO" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="includes/header.jsp" />

<%
    int id = Integer.parseInt(request.getParameter("id"));
    BoardDAO boardDAO = new BoardDAO();

    // 조회수 증가
    boardDAO.updateCnt(id);

    // 게시글 조회
    BoardVO board = boardDAO.getBoard(id);
    request.setAttribute("board", board);
%>

<div class="text-center mb-4">
    <h2 class="fw-bold">게시글 상세보기</h2>
</div>

<div class="card">
    <div class="card-header">
        <h4 class="mb-0">${board.title}</h4>
    </div>
    <div class="card-body">
        <div class="info-row">
            <span class="info-label">작성자:</span>
            <span>${board.writer}</span>
        </div>
        <div class="info-row">
            <span class="info-label">작성일:</span>
            <span><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm"/></span>
        </div>
        <div class="info-row">
            <span class="info-label">조회수:</span>
            <span>${board.cnt}</span>
        </div>
    </div>
</div>

<div class="mt-3">
    <h5 class="fw-semibold mb-2">본문</h5>
    <div class="content-box">
        ${board.content}
    </div>
</div>

<div class="d-flex justify-content-between mt-4">
    <a href="list.jsp" class="btn btn-secondary">목록</a>
    <div>
        <a href="edit.jsp?id=${board.id}" class="btn btn-primary">수정</a>
        <a href="delete_ok.jsp?id=${board.id}"
           class="btn btn-danger"
           onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />