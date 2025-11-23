<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25. 11. 23.
  Time: 오후 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Write</title>
</head>
<body>
    <h1>Add New Post</h1>
    <form action="addpost.jsp" method="post">
        <table>
            <tr>
                <td>
                    Title
                </td>
                <td><input type="text" name="title"/></td>
            </tr>

            <tr>
                <td>
                    Writer
                </td>
                <td><input type="text" name="writer"/></td>
            </tr>

            <tr>
                <td>
                    Content
                </td>
                <td><textarea name="content"></textarea></td>
            </tr>

            <tr>
                <td>
                    <a href="posts.jsp">view all posts</a>
                </td>
                <td><input type="submit" value="+ Add post"/></td>
            </tr>
        </table>
    </form>
</body>
</html>
