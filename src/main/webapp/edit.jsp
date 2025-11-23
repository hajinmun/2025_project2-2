<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.project22.BoardDAO, org.example.project22.BoardVO" %>

<jsp:include page="includes/header.jsp" />

<%
    int id = Integer.parseInt(request.getParameter("id"));
    BoardDAO boardDAO = new BoardDAO();
    BoardVO board = boardDAO.getBoard(id);
    request.setAttribute("board", board);
%>

<div class="text-center mb-4">
    <h2 class="fw-bold">게시글 수정</h2>
</div>

<div class="card">
    <div class="card-body">
        <form action="edit_ok.jsp" method="post">
            <input type="hidden" name="id" value="${board.id}">

            <div class="mb-3">
                <label for="title" class="form-label fw-semibold">
                    제목 <span class="text-danger">*</span>
                </label>
                <input type="text" class="form-control" id="title" name="title"
                       value="${board.title}" required placeholder="제목 입력">
            </div>

            <div class="mb-3">
                <label for="writer" class="form-label fw-semibold">
                    작성자 <span class="text-danger">*</span>
                </label>
                <input type="text" class="form-control" id="writer" name="writer"
                       value="${board.writer}" required placeholder="작성자 입력">
            </div>

            <div class="mb-3">
                <label for="content" class="form-label fw-semibold">
                    본문
                </label>
                <textarea class="form-control" id="content" name="content" rows="10">${board.content}</textarea>
            </div>

            <div class="d-flex justify-content-center gap-2 mt-4">
                <button type="submit" class="btn btn-primary px-4">수정</button>
                <button type="button" class="btn btn-secondary px-4"
                        onclick="location.href='view.jsp?id=${board.id}'">취소</button>
            </div>
        </form>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />