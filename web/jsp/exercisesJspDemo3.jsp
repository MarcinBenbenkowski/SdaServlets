<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.OptionalInt" %><%--
  Created by IntelliJ IDEA.
  User: marci
  Date: 2019-03-30
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="exercisesJspDemo.jsp" %>
<html>
<head>
    <title>Zadanie2</title>
    <style><%@include file="../css/exercises.css"%></style>
</head>
<body>

<h1>Zadanie 2</h1>
<%
    //wyciągnięcie atrybutów z requestu
    String productName = request.getParameter("productName");
    String productCount = pageContext.getRequest().getParameter("productCount");
    if (productName == null || productCount == null) {
        out.print("Podaj parametry");
    } else {
        int productCountInt = Integer.parseInt(productCount);

        //wyciągniece mapy produktów z sesji
        Map<String, Integer> productsMap = (Map<String, Integer>) session.getAttribute("paroductsMap");

        //obsłużenie przypadku, gdy w sesji nie ma jeszcze mapy z prodktam
        if (productsMap == null) {
            HashMap<String, Integer> newProductsMap = new HashMap<>();
            newProductsMap.put(productName, productCountInt);
            session.setAttribute("paroductsMap", newProductsMap);
        } else {
            //ustawić ciasteczko w response

            Integer max = 0;
            for (Map.Entry<String, Integer> mapEntity : productsMap.entrySet()) {
                if (mapEntity.getValue() > max) {
                    max = mapEntity.getValue();
                }
            }
            response.addCookie(new Cookie("maxCountProduct", max.toString()));

            productsMap.put(productName, productCountInt);
            session.setAttribute("paroductsMap", productsMap);
        }
    }

%>


<table style="border: 1px black solid">
    <tbody style="border: 1px black solid">
    <%
        Map<String, Integer> produtMapToDisplay = (Map<String, Integer>) session.getAttribute("paroductsMap");
        if (produtMapToDisplay != null) {
            for (Map.Entry<String, Integer> mapEntity : produtMapToDisplay.entrySet()) {

    %>
    <tr>
        <td>
            <% out.print(mapEntity.getKey());%>
        </td>
        <td>
            <% out.print(mapEntity.getValue());%>
        </td>
    </tr>

    <%}%>
    <%}%>

    </tbody>
</table>
<div>
    <%--Pamietaj ${cookie.get("maxCountProduct")}--%>
</div>


<jsp:useBean id="calculatorBeam"
             type="Cwiczenia.MyCalculatorBeam"
             scope="session"/>
<jsp:setProperty name="calculatorBeam" property="multiplyNumber" value="10"/>
<jsp:setProperty name="calculatorBeam" property="addingNumber" value="2"/>

</body>
</html>
