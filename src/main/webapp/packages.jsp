<%--Author: Brett Dawson--%>
<%--Last updated: 2022-05-07--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp"/>

<body>
<div class="container">
<jsp:include page="header.jsp"/>
<h3>Vacation packages currently available</h3>
<form>
    <div class="row">
    <div class="col">
    <div class="form-group">
        <select class="form-select" id="packageselect" onchange="fetchPackage(this.value)">
            <option value="">Select a package to view details</option>
        </select>
    Id:<input class="form-control" id="PackageId" type="number" disabled="disabled" /><br>
    Name:<input class="form-control" id="pkgName" type="text"/><br>
    Start Date:<input class="form-control" id="pkgStartDate" type="date"/><br>
    End Date:<input class="form-control" id="pkgEndDate" type="date"/><br>
    Description:<input class="form-control" id="pkgDesc" type="text"/><br>
    Base Price:<input class="form-control" id="pkgBasePrice" type="number" step="0.01"/><br>
    Agency Commission:<input class="form-control" id="pkgAgencyCommission" type="number" step="0.01"/><br>
    <button type="button" class="btn btn-primary" onclick="postPackage()">Update Package</button>
    <button type="button" class="btn btn-primary" onclick="addPackage()">Add New Package</button>
    <button type="button" class="btn btn-primary" onclick="deletePackage()">Delete Package</button>
    </div>
        </div>
        <div class="col">
            <img src="Pier.jpg" class="img-fluid"/>
        </div>
    </div>
</form>

    <p id="message"><br></p>
    <a href="AuthenticateServlet?logout=true">Logout</a>
    <%=(request.getParameter("message")!=null)?request.getParameter("message"):""%>
<script>
    $(document).ready(function(){
        fetchPackages();
    });
    /* The function below gets the dropdown list to re-populate after database changes have been made. It introduces
    a noticeable flicker when a user clicks on the dropdown selector which isn't ideal.
    */

    $("#packageselect").click(function(){
        $("#packageselect").empty();
        fetchPackages();
    });

</script>
<footer>
    <jsp:include page="footer.jsp"/>
</footer>
</div>
</body>
</html>