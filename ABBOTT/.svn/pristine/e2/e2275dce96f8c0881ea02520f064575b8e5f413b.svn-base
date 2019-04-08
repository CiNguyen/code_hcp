<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<form onsubmit="return export_detail();" role="form" action="Javascript:;" method="post">
    <div class="modal-header">
        <a class="close" data-dismiss="modal">&times;</a>
        <div class="modal-title">
            <h2 style="color: #ff6a00">Export HCP Info</h2>
        </div>
    </div>
    <div class="modal-body">
        <div class="row">
            <div class="col-md-4">
                <strong>Từ ngày</strong>
                <div class="form-group">
                    <div class='input-group date'>
                        <input type='text' id='fromdate' value="<%= System.DateTime.Now.Date.ToShortDateString() %>" name="tungay" class="form-control datepicker" data-inputmask="'alias': 'dd/mm/yyyy'" />
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <strong>Đến ngày</strong>
                <div class="form-group">
                    <div class='input-group date'>
                        <input type='text' id='todate' value="<%= System.DateTime.Now.Date.ToShortDateString() %>" name="denngay" class="form-control datepicker" data-inputmask="'alias': 'dd/mm/yyyy'" />
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>

                </div>
            </div>
            <div class="col-md-4">
                <strong>Địa điểm</strong>
                <select id="Place_Issue2" class="form-control">
                </select>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <a id="export_hcp_info" onclick="export_detail()" class="btn btn-success"><i class="fa fa-download" aria-hidden="true"></i>Export</a>
        <a href="#" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i>Đóng</a>
    </div>
</form>

<script>
    $(function () {
        $('#fromdate').datepicker({
            format: 'dd/mm/yyyy'
        });

        $('#todate').datepicker({
            format: 'dd/mm/yyyy'
        });
    });
    $.ajax({
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        type: 'POST',
        url: "/Index/Select_List_Place_Issue",
        success: function (res) {
            $("#Place_Issue2").empty();
            res = $.map(res,
                function (item, a) {
                    return "<option value='" +
                        item.Value +
                        "' " +
                        (item.Selected ? "" : "") +
                        ">" +
                        item.Text +
                        "</option>";
                });
            $("#Place_Issue2").html(res.join("")).append('<option value="ALL" selected>Chọn tất cả</option>');
            $("#Place_Issue2").select2({
                width: '100%',
                placeholder: 'Place Issue'
            });
        }
    });


    function export_detail() {
        if ($("#Place_Issue2").val() === "ALL") {
            $('#export_hcp_info').addClass("disabled");
            var fromdate = $("#fromdate").val();
            if (fromdate == "") {
                $.alert("Vui lòng chọn ngày!");
                $('#export_hcp_info').removeClass("disabled");
                return false;
            }
            var todate = $('#todate').val();
            if (todate == "") {
                $.alert("Vui lòng chọn ngày!");
                $('#export_hcp_info').removeClass("disabled");
                return false;
            }
            var Place_Issue2 = $("#Place_Issue2").val();

        }
        else {
            $('#export_hcp_info').addClass("disabled");
            var fromdate = $("#fromdate").val();
            if (fromdate == "") {
                $.alert("Vui lòng chọn ngày!");
                $('#export_hcp_info').removeClass("disabled");
                return false;
            }
            var todate = $('#todate').val();
            if (todate == "") {
                $.alert("Vui lòng chọn ngày!");
                $('#export_hcp_info').removeClass("disabled");
                return false;
            }
            var Place_Issue2 = $("#Place_Issue2").val();
        }

        var formData = new FormData();
        formData.append("fromdate", fromdate);
        formData.append("todate", todate);
        formData.append("Place_Issue2", Place_Issue2);

        $.ajax({
            url: '/Index/EventExportHCP_Info',
            data: formData,
            type: 'POST',
            contentType: false,
            processData: false,
            datatype: 'Json',
            success: function (res) {
                if (res.success === true) {
                    for (i = 53; i <= 99; i++) {

                        if (i === 99) {
                            setTimeout(function () {
                                Process_bar(i, "Hoàn tất!");
                            }, 3000);
                        } else {
                            setTimeout(function () {
                                Process_bar(i, i + "%");
                            }, 5000);
                        }
                    }
                    $('#DownloadExcelReportExcel').removeClass("disabled");
                    window.location = '/Index/DownloadExcelReportExcel' + "?fName=" + res.file_name;
                    //  $("#mynormal").modal('hide');
                }
            },
            error: function (err) {
                $('#DownloadExcelReportExcel').removeClass("disabled");
            }
        });
    }

</script>
