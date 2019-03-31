<%--
  Created by IntelliJ IDEA.
  User: marci
  Date: 2019-03-30
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ExercisesJspDemo2</title>

</head>
<body>
<div>
    <h1>Zadania</h1>
    <%
        String liczba1 = request.getParameter("liczba1");
        String liczba2 = request.getParameter("liczba2");
        int first = Integer.parseInt(liczba1);
        int second = Integer.parseInt(liczba2);
        int wynik = first + second;
        out.print("Winik dodawania to: " + wynik);


    %>
</div>
</body>
</html>
