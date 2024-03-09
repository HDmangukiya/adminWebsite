$('#commentSubmit').click(function () {
    var blogId = $('#blogId').val();
    var verifyCode = $('#verifyCode').val();
    var commentator = $('#commentator').val();
    var email = $('#email').val();
    var websiteUrl = $('#websiteUrl').val();
    var commentBody = $('#commentBody').val();
    if (isNull(blogId)) {
        swal("The parameter is abnormal", {
            icon: "warning",
        });
        return;
    }
    if (isNull(commentator)) {
        swal("Please enter your salutation", {
            icon: "warning",
        });
        return;
    }
    if (isNull(email)) {
        swal("Please enter your email address", {
            icon: "warning",
        });
        return;
    }
    if (isNull(verifyCode)) {
        swal("Please enter a verification code", {
            icon: "warning",
        });
        return;
    }
    if (!validCN_ENString2_100(commentator)) {
        swal("Please enter a name that matches the specification (do not enter special characters)", {
            icon: "warning",
        });
        return;
    }
    if (!validCN_ENString2_100(commentBody)) {
        swal("Please enter a comment that complies with the norm (do not enter special characters)", {
            icon: "warning",
        });
        return;
    }
    var data = {
        "blogId": blogId, "verifyCode": verifyCode, "commentator": commentator,
        "email": email, "websiteUrl": websiteUrl, "commentBody": commentBody
    };
    console.log(data);
    $.ajax({
        type: 'POST',//Method type
        url: '/blog/comment',
        data: data,
        success: function (result) {
            if (result.resultCode == 200) {
                swal("The comment was submitted successfully, please wait for the blogger to review it", {
                    icon: "success",
                });
                $('#commentBody').val('');
                $('#verifyCode').val('');
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