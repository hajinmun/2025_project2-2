<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.project22.BoardDAO" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    BoardDAO boardDAO = new BoardDAO();
    int result = boardDAO.deleteBoard(id);
    String msg = "삭제 성공";
    if(result == 0) msg = "삭제 실패";
%>

<script>
    alert('<%=msg%>');
    location.href = "list.jsp";
</script>