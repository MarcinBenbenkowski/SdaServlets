<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: marci
  Date: 2019-04-06
  Time: 09:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>jstlTutorial</title>
</head>
<body>
<h1>JSTL Tutorial</h1>
<c:out value="CZESC" default=""/>
<c:out value="${null}" default="Wynik działania jest nulem"/>
<c:out value="${10+100}"/>

<jsp:useBean id="mySimpleBean" class="demojsp.SimpleBean"/>

<n><jsp:setProperty name="mySimpleBean" property="name" value="JANUSZ"/></n>

<c:out value="${mySimpleBean.name}" default="Nie ma imienia"/>

<c:set var="licznik" value="Jestem Licznkiem, który jest ustawiony na !!"/>

<c:set target="${mySimpleBean}" property="name" value="Zbigniew"/>

<c:out value="${mySimpleBean.name}"/>

<c:if test="${mySimpleBean.name.countains('Zbi')}">
    <div>Warunek w IF Był prawdziwy</div>
</c:if>

<c:choose>
    <c:when test="${mySimpleBean.name.countains('Zbi')}">
        <div>Warunek w IF Był prawdziwy</div>
    </c:when>
    <c:when test="${mySimpleBean.name.countains('Jan')}">
        <div>Warunek w IF Był prawdziwy</div>
    </c:when>
    <c:otherwise>
        <div>Nie rozpoznano imienia</div>
    </c:otherwise>
</c:choose>
<c:forEach items="${mySimpleBean}" var="word">
    <c:out value="${word}"/>
</c:forEach>

</body>
</html>
