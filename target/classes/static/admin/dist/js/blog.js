$(function () {
    $("#jqGrid").jqGrid({
        url: '/admin/blogs/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'blogId', index: 'blogId', width: 50, key: true, hidden: true},
            {label: 'title', name: 'blogTitle', index: 'blogTitle', width: 140},
            {label: 'Preview the image', name: 'blogCoverImage', index: 'blogCoverImage', width: 120, formatter: coverImageFormatter},
            {label: 'Views', name: 'blogViews', index: 'blogViews', width: 60},
            {label: 'state', name: 'blogStatus', index: 'blogStatus', width: 60, formatter: statusFormatter},
            {label: 'Blog classification', name: 'blogCategoryName', index: 'blogCategoryName', width: 60},
            {label: 'Add time', name: 'createTime', index: 'createTime', width: 90}
        ],
        height: 700,
        rowNum: 10,
        rowList: [10, 20, 50],
        styleUI: 'Bootstrap',
        loadtext: 'The message is being read...',
        rownumbers: false,
        rownumWidth: 20,
        autowidth: true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader: {
            root: "data.list",
            page: "data.currPage",
            total: "data.totalPage",
            records: "data.totalCount"
        },
        prmNames: {
            page: "page",
            rows: "limit",
            order: "order",
        },
        gridComplete: function () {
            //Hide the scrollbar at the bottom of the grid
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });

$(window).resize(function () {
        $("#jqGrid").setGridWidth($(".card-body").width());
    });

function coverImageFormatter(cellvalue) {
        return "<img src='" + cellvalue + "' height=\"120\" width=\"160\" alt='coverImage'/>";
    }

function statusFormatter(cellvalue) {
        if (cellvalue == 0) {
            return "<button type=\"button\" class=\"btn btn-block btn-secondary btn-sm\" style=\"width: 50%;\">draft</button>";
        }
        else if (cellvalue == 1) {
            return "<button type=\"button\" class=\"btn btn-block btn-success btn-sm\" style=\"width: 50%;\">publish</button>";
        }
    }

});

/**
 * Search function
 */
function search() {
    //Title keywords
    var keyword = $('#keyword').val();
    if (!validLength(keyword, 20)) {
        swal("The search field is too long!", {
            icon: "error",
        });
        return false;
    }
    //Data encapsulation
    var searchData = {keyword: keyword};
    //Pass in the query condition parameters
    $("#jqGrid").jqGrid("setGridParam", {postData: searchData});
    //Clicking on the search button starts from the first page by default
    $("#jqGrid").jqGrid("setGridParam", {page: 1});
    //Submit the POST and refresh the form
    $("#jqGrid").jqGrid("setGridParam", {url: '/admin/blogs/list'}).trigger("reloadGrid");
}

/**
 * jq Grid reload
 */
function reload() {
    var page = $("#jqGrid").jqGrid('getGridParam', 'page');
    $("#jqGrid").jqGrid('setGridParam', {
        page: page
    }).trigger("reloadGrid");
}

function addBlog() {
    window.location.href = "/admin/blogs/edit";
}

function editBlog() {
    var id = getSelectedRow();
    if (id == null) {
        return;
    }
    window.location.href = "/admin/blogs/edit/" + id;
}

function deleteBlog() {
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    swal({
        title: "Confirm the pop-up box",
        text: "Do you want to delete the data??",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "POST",
                    url: "/admin/blogs/delete",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.resultCode == 200) {
                            swal("The deletion is successful", {
                                icon: "success",
                            });
                            $("#jqGrid").trigger("reloadGrid");
                        } else {
                            swal(r.message, {
                                icon: "error",
                            });
                        }
                    }
                });
            }
        }
    );
}