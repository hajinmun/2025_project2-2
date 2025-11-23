<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.project22.BoardDAO, org.example.project22.BoardVO, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="includes/header.jsp" />

<%
    BoardDAO boardDAO = new BoardDAO();
    List<BoardVO> list = boardDAO.getBoardList();
    request.setAttribute("list", list);
%>

<div class="text-center mb-4">
    <h2 class="fw-bold">게시판</h2>
</div>

<table class="table table-bordered table-hover align-middle text-center">
    <thead class="table-warning">
    <tr>
        <th style="width: 60px;">ID</th>
        <th>제목</th>
        <th style="width: 120px;">작성자</th>
        <th style="width: 130px;">작성일</th>
        <th style="width: 70px;">조회수</th>
        <th style="width: 150px;">관리</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
        <c:when test="${empty list}">
            <tr>
                <td colspan="6" class="text-center py-4">등록된 게시글이 없습니다.</td>
            </tr>
        </c:when>
        <c:otherwise>
            <c:forEach var="board" items="${list}">
                <tr>
                    <td>${board.id}</td>
                    <td>
                        <a href="view.jsp?id=${board.id}" class="fw-semibold text-dark">
                                ${board.title}
                        </a>
                    </td>
                    <td>${board.writer}</td>
                    <td>
                        <fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd"/>
                    </td>
                    <td>${board.cnt}</td>
                    <td>
                        <a href="edit.jsp?id=${board.id}" class="btn btn-primary btn-sm">수정</a>
                        <a href="delete_ok.jsp?id=${board.id}"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('정말 삭제하시겠습니까?');">
                            삭제
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

<div class="text-end mt-3">
    <a href="write.jsp" class="btn btn-success px-4">+ 글쓰기</a>
</div>

<jsp:include page="includes/footer.jsp" />