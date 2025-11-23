<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.project22.BoardDAO, org.example.project22.BoardVO, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="includes/header.jsp" />

<%
    BoardDAO boardDAO = new BoardDAO();
    String keyword = request.getParameter("keyword");
    List<BoardVO> list;

    if(keyword != null && !keyword.trim().isEmpty()) {
        list = boardDAO.searchBoardList(keyword);
        request.setAttribute("keyword", keyword);
    } else {
        list = boardDAO.getBoardList();
    }
    request.setAttribute("list", list);
%>

<div class="text-center mb-4">
    <h2 class="fw-bold">게시판</h2>
</div>

<div class="card mb-3">
    <div class="card-body">
        <form action="list.jsp" method="get" class="row g-2">
            <div class="col-md-10">
                <input type="text" class="form-control" name="keyword"
                       placeholder="제목으로 검색..." value="${keyword}">
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary w-100">검색</button>
            </div>
        </form>
        <c:if test="${not empty keyword}">
            <div class="mt-2">
                <span class="text-muted">검색어: <strong>${keyword}</strong></span>
                <a href="list.jsp" class="btn btn-sm btn-outline-secondary ms-2">전체보기</a>
            </div>
        </c:if>
    </div>
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
                <td colspan="6" class="text-center py-4">
                    <c:choose>
                        <c:when test="${not empty keyword}">
                            '<strong>${keyword}</strong>' 검색 결과가 없습니다.
                        </c:when>
                        <c:otherwise>
                            등록된 게시글이 없습니다.
                        </c:otherwise>
                    </c:choose>
                </td>
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