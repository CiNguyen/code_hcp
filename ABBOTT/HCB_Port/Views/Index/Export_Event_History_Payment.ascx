<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<form onsubmit="return export_detail();" role="form" action="Javascript:;" method="post">
    <div class="modal-header">
        <a class="close" data-dismiss="modal">&times;</a>
        <div class="modal-title">
            <h2 style="color: #ff6a00">Export Event History Payment</h2>
        </div>
    </div>
    <div class="modal-body">
        <div class="row">
            <div class="col-md-6">
                <strong>Từ ngày</strong>
                <div class="form-group">
                    <div class='input-group date'>
                        <input type='text' id='fromdate' value="<%= System.DateTime.Now.Date.ToShortDateString() %>" name="tungay" class="form-control datepicker" data-inputmask="'alias': 'dd/mm/yyyy'" />
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <strong>Đến ngày</strong>
                <div class="form-group">
                    <div class='input-group date'>
                        <input type='text' id='todate' value="<%= System.DateTime.Now.Date.ToShortDateString() %>" name="denngay" class="form-control datepicker" data-inputmask="'alias': 'dd/mm/yyyy'" />
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <a id="export_event_payment" onclick="export_detail()" class="btn btn-success"><i class="fa fa-download" aria-hidden="true"></i> Export</a>
        <a href="#" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i> Đóng</a>
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

    
    function export_detail() {
        debugger;
            $('#export_event_payment').addClass("disabled");
            var fromdate = $("#fromdate").val();
            if (fromdate == "") {
                $.alert("Vui lòng chọn ngày!");
                $('#export_event_payment').removeClass("disabled");
                return false;
            }
            var todate = $('#todate').val();
            if (todate == "") {
                $.alert("Vui lòng chọn ngày!");
                $('#export_event_payment').removeClass("disabled");
                return false;
            }
            var formData = new FormData();
            formData.append("fromdate", fromdate);
            formData.append("todate", todate);
            $.ajax({
                url: '/Index/EventExportHistory_Payment',
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