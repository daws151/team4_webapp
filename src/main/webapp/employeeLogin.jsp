<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="head.jsp"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<h1>Travel Experts Employee Login</h1>
<form action="AuthenticateServlet" method="GET">
    Agent Id: <input type="number" name="agentId"><br/>
    Password: <input type="password" name="password"><br/>
    <input type="hidden" id="agentId" name="agentId">
    <input type="submit" value="Login">
</form>

<%
    String agentId = request.getParameter("agentid");

%>
<footer>
    <jsp:include page="footer.jsp"/>
</footer>
</body>

</html>