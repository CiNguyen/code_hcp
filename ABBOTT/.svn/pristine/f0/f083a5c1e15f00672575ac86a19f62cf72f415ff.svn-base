<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<style>
    .select2-search__field {
        width: 100% !important;
    }

    .progress {
        height: 20px;
    }

        .progress .skill {
            font: normal 12px "Open Sans Web";
            line-height: 20px;
            padding: 0;
            margin: 0px 0 0 20px;
            text-transform: uppercase;
            float: left;
        }

    .progress-bar {
        text-align: left;
        transition-duration: 0.5s;
    }
</style>

<form id="form_import_history_payment" action="javascript:;" method="post" onsubmit="return Import_Event_History_Payment();">
    <div class="modal-header">
        <a class="close" id="close_pop" data-dismiss="modal">&times;</a>
        <h3 style="color: #ff6a00">&nbsp;Import Event History Payment</h3>
    </div>

    <div class="row" style="padding-top: 10px; padding-left: 15px;">
        <input type="file" id="file" name="file" />
    </div>

    <div class="row" id="Process_Event_History_Payment" style="display: none">
        <div style="padding-left: 10px;">
            <strong>Upload Event_History_Payment Schedule Process</strong>
            <div class="progress skill-bar " id="import_event_history_payment">
                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                    <span class="skill"></span>
                </div>
            </div>
        </div>
    </div>

    <div class="modal-footer">
        <button type="submit" class="btn btn-success"><i class="fa fa-cloud-upload" aria-hidden="true"></i> Import</button>
        <a href="#" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i> Đóng</a>
    </div>
</form>

<script type="text/javascript">
    $(".date").datepicker({
        format: "dd/mm/yyyy"
    }).datepicker("setDate", new Date());;

    function Import_Event_History_Payment() {
        var formData = new FormData();
        var totalFiles = document.getElementById("file").files.length;
        if (totalFiles == 0) {
            Lobibox.alert(
                'error', // Any of the following
                {
                    msg: 'Bạn chưa chọn file để up'
                }
            );
        } else {
            for (var i = 0; i < totalFiles; i++) {
                var file = document.getElementById("file").files[i];
                formData.append("file", file);
            }
            //formData.append("idSchedule", data.Data[0].sub_code);
            $.ajax({
                type: "POST",
                url: "/Index/Event_Check_Import_Template_Event_Payment",
                data: formData,
                dataType: 'json',
                contentType: false,
                processData: false,
                success: function (res) {
                    debugger;
                    if (res.total > 2) {
                        $('#Process_Event_History_Payment').removeAttr("style");
                        var ii = 2;
                        function inserteventSchedule() {
                            Event_Import_Event_Info(ii, res.total);
                            ii++;
                            if (ii < (res.total)) {
                                setTimeout(inserteventSchedule, 100);
                            }
                        }
                        inserteventSchedule();
                    } else {
                        Lobibox.notify('error',
                            {
                                img: '/Contents/img/check_warning.png',
                                sound: false,
                                position: 'bottom right',
                                delay: 3000,
                                showClass: 'fadeInDown',
                                title: 'Thông Báo Lỗi',
                                msg: "File Rỗng. Hãy Kiểm Tra Lại File."
                            });
                    }
                },
                error: function () {
                    Lobibox.alert(
                        'error', // Any of the following
                        {
                            msg: "Có Lỗi Xảy Ra. Hãy Liên Hệ IT Để Được Hỗ Trợ ."
                        }
                    );
                }
            });
        }
    };

    function Process_Event_History_Payment(percent, vals) {
        $('#import_event_history_payment .progress-bar').attr("aria-valuenow", percent);
        $('#import_event_history_payment .skill').text(vals);
        $('#import_event_history_payment .progress-bar').css("width",
            function () {
                return $(this).attr("aria-valuenow") + "%";
            }
        );
    }

    function Event_Import_Event_Info(row, totalReco) {
        $.post('/Index/Event_Import_Event_Info', { rowIndex: row },
            function (data) {
                if (data["code"] == "1") {
                    Process_Event_History_Payment(100, 'done');
                    Lobibox.notify('error', {
                        img: '/Contents/img/check_warning.png',
                        sound: false,
                        position: 'bottom right',
                        delay: 3000,
                        showClass: 'fadeInDown',
                        title: 'Thông Báo Lỗi',
                        msg: data.sub_code
                    });
                    done_load();
                    window.location = '/Index/Download_ErrorList' + "?fName=" + data.sub_code;
                } else {
                    if (data["code"] == "2") {
                        Process_Event_History_Payment(100, 'done');
                        Lobibox.notify('success', {
                            img: '/Contents/img/check_thanhcong.png',
                            sound: false,
                            position: 'bottom right',
                            delay: 2000,
                            showClass: 'fadeInDown',
                            title: 'Thông Báo Thành Công !',
                            msg: data.msg
                        });
                        reload_event_info_table_view();
                        done_load();
                    } else {
                        var abc = row + 1;
                        var total = abc * 100 / totalReco;
                        Process_Event_History_Payment(total, data.msg);
                        //inser processbar
                    }
                }
            });
    }


</script>

