<%@ page import="java.time.LocalDateTime" %><%--
  Created by IntelliJ IDEA.
  User: marci
  Date: 2019-03-30
  Time: 09:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>ExercisesJspDemo</title>
</head>
<body>
<div style="color: blueviolet">
    <h1>
        Expression w JSP
    </h1>
    <p>
        <%= java.time.LocalDateTime.now()%>
    </p>
    <p>
        <%= 10 + 200%>
    </p>
    <h1>
        Skryptlet:
    </h1>
    <p>
            <% for (int i = 0; i < 10; i++) {%>

    <h1><% out.print(i);%></h1>

    <%}%>
    </p>
    <p>
    <table style="border: 2px solid black">

        <thead>
        <tr>
            <td>Liczba "i"</td>
            <td>Liczba "i^2"</td>
        </tr>
        </thead>

        <tbody>
        <%for (int i = 0; i < 5; i++) {%>
        <tr>
            <td><%= i%></td>
            <td><% out.print(i*i); %></td>
        </tr>

        <%}%>
        </tbody>
    </table>

    </p>
   <h1>
       Dyrektywa
   </h1>
    <%!
        private int visitCount = 0;
    %>
    Liczba wyświetleń: <%=visitCount%>
    <%
        visitCount++;
    %>
</div>
<a href="https://www.google.pl/">Google</a>
</body>
</html>
