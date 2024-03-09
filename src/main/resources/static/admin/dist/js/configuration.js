$(function () {
    //Modify site information
    $('#updateWebsiteButton').click(function () {
        $("#updateWebsiteButton").attr("disabled", true);
        //AJAX submits data
        var params = $("#websiteForm").serialize();
        $.ajax({
            type: "POST",
            url: "/admin/configurations/website",
            data: params,
            success: function (result) {
                if (result.resultCode == 200 && result.data) {
                    swal("Save Successful", {
                        icon: "success",
                    });
                }
                else {
                    swal(result.message, {
                        icon: "error",
                    });
                }
                ;
            },
            error: function () {
                swal("The operation failed", {
                    icon: "error",
                });
            }
        });
    });
    //Personal Information
    $('#updateUserInfoButton').click(function () {
        $("#updateUserInfoButton").attr("disabled", true);
        var params = $("#userInfoForm").serialize();
        $.ajax({
            type: "POST",
            url: "/admin/configurations/userInfo",
            data: params,
            success: function (result) {
                if (result.resultCode == 200&& result.data) {
                    swal("Save Successful", {
                        icon: "success",
                    });
                }
                else {
                    swal(result.message, {
                        icon: "error",
                    });
                }
                ;
            },
            error: function () {
                swal("The operation failed", {
                    icon: "error",
                });
            }
        });
    });
    //Modify the bottom settings
    $('#updateFooterButton').click(function () {
        $("#updateFooterButton").attr("disabled", true);
        var params = $("#footerForm").serialize();
        $.ajax({
            type: "POST",
            url: "/admin/configurations/footer",
            data: params,
            success: function (result) {
                if (result.resultCode == 200&& result.data) {
                    swal("Save Successful", {
                        icon: "success",
                    });
                }
                else {
                    swal(result.message, {
                        icon: "error",
                    });
                }
                ;
            },
            error: function () {
                swal("The operation failed", {
                    icon: "error",
                });
            }
        });
    });

})
