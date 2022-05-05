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
    var startDate = dayjs(packageJSON.pkgStartDate).format("YYYY-MM-DD");
    // var startDate2 = packageJSON.pkgStartDate;
    // console.log(startDate);
    // console.log(startDate2);
    $("#pkgStartDate").val(startDate);
    var endDate = dayjs(packageJSON.pkgEndDate).format("YYYY-MM-DD"); //new Date(Date.parse(packageJSON.pkgEndDate)).toISOString().split('T')[0];
    // console.log(endDate);
    $("#pkgEndDate").val(endDate);
    $("#pkgDesc").val(packageJSON.pkgDesc);
    $("#pkgBasePrice").val(packageJSON.pkgBasePrice);
    $("#pkgAgencyCommission").val(packageJSON.pkgAgencyCommission);
}

async function postPackage() {
    var startdate = dayjs($("#pkgStartDate").val()).format("YYYY-MM-DD");
    var enddate = dayjs($("#pkgEndDate").val()).format("YYYY-MM-DD");
    var postData = {
        "PackageId":$("#PackageId").val(),
        "pkgName":$("#pkgName").val(),
        "pkgStartDate":startdate,
        "pkgEndDate":enddate,
        "pkgDesc":$("#pkgDesc").val(),
        "pkgBasePrice":$("#pkgBasePrice").val(),
        "pkgAgencyCommission":$("#pkgAgencyCommission").val()
    };

    var url = "http://localhost:8081/team4_server_war_exploded/package/postpackage";
    try {
        const response = await fetch(url,
            {
                method: "post",
                headers: {"Content-type": "application/json"},
                body: JSON.stringify(postData)
            });
        if (!response.ok) {
            const message = "Update failed: status=" + response.status;
            throw new Error(message);
        }
        const data = await response.json();
        $("#message").html(data.message);
    } catch (e) {
        console.log("Error: " + e);
    }
}
async function addPackage()
{
    var startdate = dayjs($("#pkgStartDate").val()).format("YYYY-MM-DD");
    var enddate = dayjs($("#pkgEndDate").val()).format("YYYY-MM-DD");
    var putData = {
        "PackageId":0,
        "pkgName":$("#pkgName").val(),
        "pkgStartDate":startdate,
        "pkgEndDate":enddate,
        "pkgDesc":$("#pkgDesc").val(),
        "pkgBasePrice":$("#pkgBasePrice").val(),
        "pkgAgencyCommission":$("#pkgAgencyCommission").val()
    };

    var url = "http://localhost:8081/team4_server_war_exploded/package/insertpackage";
    try {
        const response = await fetch(url,
            {
                method: "put",
                headers: {"Content-type": "application/json"},
                body: JSON.stringify(putData)
            });
        if (!response.ok) {
            const message = "Insert failed: status=" + response.status;
            throw new Error(message);
        }
        const data = await response.json();
        $("#message").html(data.message);
    } catch (e) {
        console.log("Error: " + e);
    }
}