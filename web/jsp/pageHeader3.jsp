<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="pageHeaderDiv">
    <h1>
        SDA Forum
    </h1>
    <img id="picture1" src="/../src/main/resources/img/1.jpg">
    <div>
        Witaj w nowym forum ;)
    </div>
    <div>
        <%--<c:if test="${sessionScope.cotainsKey('loggedUserId')}">--%>
        <a href="${pageContext.request.contextPath}/LogoutAction">Wyloguj</a>
        <%--</c:if>--%>
    </div>
</div>
