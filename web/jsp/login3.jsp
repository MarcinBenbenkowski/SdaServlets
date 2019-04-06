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
    <title>Login</title>
    <style>
        <%@ include file="../css/login3.css"%>
    </style>
</head>
<body>
<jsp:include page="pageHeader3.jsp"></jsp:include>
<div>
    Logowanie:
</div>
<div id="loginFormDiv">
    <form method="post" action="LoginAction3">
        Login: <input name="login" type="text">
        Password: <input name="password" type="password"><br>
        <input name="submit" type="submit">
    </form>
</div>
<jsp:include page="pageFooter3.jsp"></jsp:include>
</body>
</html>
