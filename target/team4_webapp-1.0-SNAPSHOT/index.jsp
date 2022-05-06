<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="head.jsp"/>
</head>
<body>
<div class="container">
<header>
    <jsp:include page="header.jsp"/>
</header>
    <div class="row">
        <div class="col-lg">
        <h2>Welcome to Travel Experts</h2>
        <img src="hongkong.jpg" class="img-fluid"/>
            <br />
        </div>
            <%=(request.getParameter("message")!=null)?request.getParameter("message"):""%>
    </div>
<footer>
    <br />
    <jsp:include page="footer.jsp"/>
</footer>
</div>
</body>

</html>