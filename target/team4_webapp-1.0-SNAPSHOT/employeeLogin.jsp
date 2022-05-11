<%--Author: Brett Dawson
Last Modified: 2022-05-07

Harv, please note that I ended up abandoning this page. Was also doing the authentication in a non-secure way.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%
    Cookie[] cookies = request.getCookies();
    String lastLogin="";
    String agentId;
    if (cookies!=null)
    {
        for (Cookie cookie: cookies)
        {
            if (cookie.getName().equals("sessionData"))
            {
                List<String> sessionValues=Arrays.asList(cookie.getValue().split("#"));
                agentId=sessionValues.get(0);
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="head.jsp"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<%= (request.getParameter("message")!=null)?request.getParameter("message"):"" %>
<h1>Travel Experts Employee Login</h1>
<form action="AuthenticateServlet" method="GET">
    Agent Id: <input type="number" name="agentId"><br/>
    Password: <input type="password" name="password"><br/>
<%--    <input type="hidden" id="username" name="username">--%>
    <input type="submit" value="Login">
</form>

<footer>
    <jsp:include page="footer.jsp"/>
</footer>
</body>

</html>