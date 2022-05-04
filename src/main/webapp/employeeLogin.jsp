<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="head.jsp"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<h1>Travel Experts Employee Login</h1>
<form action="ValidateServlet" method="POST">
    Username: <input type="text" name="empUsername"><br/>
    Password: <input type="password" name="password"><br/>
    <input type="submit" value="Login">
</form>
<footer>
    <jsp:include page="footer.jsp"/>
</footer>
</body>

</html>