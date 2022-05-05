<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="head.jsp"/>
    <script src="packageFunctions.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<h1>Select a vacation package to see its details</h1>
<select id="packageselect" onchange="fetchPackage(this.value)">
    <option value="">Select a package to view details</option>
</select>
<form>
    Id:<input id="PackageId" type="number" disabled="disabled" /><br>
    Name:<input id="pkgName" type="text"/><br>
    Start Date:<input id="pkgStartDate" type="date"/><br>
    End Date:<input id="pkgEndDate" type="date"/><br>
    Description:<input id="pkgDesc" type="text"/><br>
    Base Price:<input id="pkgBasePrice" type="number" step="0.01"/><br>
    Agency Commission:<input id="pkgAgencyCommission" type="number" step="0.01"/><br>
    <button type="button" onclick="postPackage()">Update Package</button>
    <button type="button" onclick="addPackage()">Add New Package</button>
</form>

<script>
    $(document).ready(function(){
        fetchPackages();
    });

</script>
<footer>
    <jsp:include page="footer.jsp"/>
</footer>
</body>

</html>