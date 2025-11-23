<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.project22.BoardDAO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="vo" class="org.example.project22.BoardVO" />
<jsp:setProperty name="vo" property="*"/>

<%
    BoardDAO boardDAO = new BoardDAO();
    int result = boardDAO.updateBoard(vo);
    String msg = "수정 성공";
    if(result == 0) msg = "수정 실패";
%>

<script>
    alert('<%=msg%>');
    location.href = "view.jsp?id=<%=vo.getId()%>";
</script>