<%--
  Created by IntelliJ IDEA.
  User: marci
  Date: 2019-03-31
  Time: 09:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LoginError</title>
    <style>
        <%@ include file="../css/login3.css"%>
    </style>
</head>
<body>

<%@include file="pageHeader3.jsp"%>

<div style="font-size: 25px; color:green">
    Udało się zalogować :)
</div>
<form method="post" action="${pageContext.request.contextPath}/secret/AddPostAction">
    <input type="text" name="postText">
    <input type="submit" name="submit">

</form>

<%@include file="pageFooter3.jsp"%>

</body>
</html>
