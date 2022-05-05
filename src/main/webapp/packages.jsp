<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="head.jsp"/>
    <script>
        async function fetchPackages(){
            var url = "http://localhost:8081/team4_server_war_exploded/package/getpackages";
            var packages = await fetch(url);
            var packagesJSON = await packages.json();
            for (i=0;i<packagesJSON.length;i++){
                $("#packageselect").append("<option value='" + packagesJSON[i].PackageId + "'>" + packagesJSON[i].pkgName +"</option>");
                // + packagesJSON[i].pkgStartDate + packagesJSON[i].pkgEndDate+
                // packagesJSON[i].pkgDesc + packagesJSON[i].pkgBasePrice + packagesJSON[i].pkgAgencyCommission
            }
        }
        async function fetchPackage(id){
            var url = "http://localhost:8081/team4_server_war_exploded/package/getpackage/" + id;
            var response = await fetch(url);
            if(!response.ok){
                throw new Error("Error occurred, status code = " + response.status);
                $("#PackageId").val("");
                $("#pkgName").val("");
                $("#pkgStartDate").val("");
                $("#pkgEndDate").val("");
                $("#pkgDesc").val("");
                $("#pkgBasePrice").val("");
                $("#pkgAgencyCommission").val("");
            }
            var packageJSON = await response.json();
            $("#PackageId").val(packageJSON.PackageId);
            $("#pkgName").val(packageJSON.pkgName);
            var startDate = new Date(Date.parse(packageJSON.pkgStartDate)).toISOString().split('T')[0];
            var startDate2 = packageJSON.pkgStartDate;
            console.log(startDate);
            console.log(startDate2);
            $("#pkgStartDate").val(startDate);
            var endDate = new Date(Date.parse(packageJSON.pkgEndDate)).toISOString().split('T')[0];
            console.log(endDate);
            $("#pkgEndDate").val(endDate);
            $("#pkgDesc").val(packageJSON.pkgDesc);
            $("#pkgBasePrice").val(packageJSON.pkgBasePrice);
            $("#pkgAgencyCommission").val(packageJSON.pkgAgencyCommission);
        }
    </script>
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