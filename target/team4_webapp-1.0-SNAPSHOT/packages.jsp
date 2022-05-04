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
                $("#packageselect").append("<option value='" + packagesJSON[i].PackageId + "'>"
                    + packagesJSON[i].pkgName + "</option>");
            }
        }
        async function fetchPackage(id){
            var url = "http://localhost:8081/team4_server_war_exploded/package/getpackage/" + id;
            var response = await fetch(url);
            if(!response.ok){
                throw new Error("Error occurred, status code = " + response.status);
            }
            var packageJSON = await response.json();
            $("#PackageId").val(packageJSON.PackageId);
            $("#pkgName").val(packageJSON.pkgName);
            var startDate2 = new Date(packageJSON.pkgStartDate);
            var startDate = startDate2.toISOString();
            $("#pkgStartDate").val(startDate);
            // startDate2.setDate(startDate2.getDate(packageJSON.pkgStartDate));
            // $("#pkgStartDate").html($("#pkgStartDate").format(startDate2, 'dd MMMM yyyy'));
            // var startDate = packageJSON.pkgStartDate;
            // console.log(startDate);
            // $("#pkgStartDate").val(startDate);
            var endDate = dayjs(packageJSON.pkgEndDate).format('yyyy MMM dd');
            $("#pkgEndDate").val(endDate);
            $("#pkgDesc").val(packageJSON.pkgDesc);
            $("#pkgBasePrice").val(packageJSON.pkgBasePrice);
            $("#pkgAgencyCommission").val(packageJSON.pkgAgencyCommission);
        }
    </script>
</head>
<body>
<jsp:include page="header.jsp"/>
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