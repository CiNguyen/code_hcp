<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<form id="form_add_history_payment" method="post" action="javascript:;" onsubmit="return AddHistory_Payment();">
    <div class="modal-header">
        <a class="close" data-dismiss="modal" id="close_pop">×</a>
        <h3>Edit History Payment</h3>
    </div>
    <div class="modal-body">
        <div class="row" style="padding-top: 5px">
            <div class="col-md-4">
                <strong>HCP Info <span style="color: red">(*)</span></strong>
                <select id="HCP_Code" name="HCP_Code" class="form-control">
                    <option value="">Choose HCP</option>
                </select>
                <input type="hidden" id="Id_Event" name="Id_Event" value="<%=Session["idEventInfo"]%>" />
            </div>

            <div class="col-md-4">
                <strong>Number_Contract  <span style="color: red">*</span></strong>
                <input type="text" id="Number_Contract" name="Number_Contract" class="form-control" required="required"  />
            </div>

            <div class="col-md-4">
                <strong>Value_Contract <span style="color: red">*</span></strong>
                <input type="number" id="Value_Contract" name="Value_Contract" class="form-control" required="required"  min="1" />
            </div>
        </div>

        <div class="row" style="padding-top: 5px">
            <div class="col-md-4">
                <strong>From Date <span style="color: red">*</span></strong>
                <label class="input-group date">
                    <input class="form-control date" id="FromDate" name="FromDate" placeholder="dd/mm/yyyy" required="required" />
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </label>
            </div>

            <div class="col-md-4">
                <strong>To Date <span style="color: red">*</span></strong>
                <label class="input-group date">
                    <input class="form-control date" id="ToDate" name="ToDate" placeholder="dd/mm/yyyy" required="required" />
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </label>
            </div>

            <div class="col-md-4">
                <strong>PPL Get Contract Date <span style="color: red">*</span></strong>
                <label class="input-group date">
                    <input class="form-control date" id="PPL_GetContract_Date" name="PPL_GetContract_Date" placeholder="dd/mm/yyyy" required="required" />
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </label>
            </div>
        </div>

        <div class="row" style="padding-top: 5px">
            <div class="col-md-4">
                <strong>Rep_Name</strong>
                <input type="text" id="Rep_Name" name="Rep_Name" class="form-control" />
            </div>

            <div class="col-md-4">
                <strong>Sup_Name </strong>
                <input type="text" id="Sup_Name" name="Sup_Name" class="form-control" />
            </div>

            <div class="col-md-4">
                <strong>Account_Name </strong>
                <input type="text" id="Account_Name" name="Account_Name" class="form-control" />
            </div>
        </div>

        <div class="row" style="padding-top: 5px">
            <div class="col-md-4">
                <strong>Requested_Value</strong>
                <input type="number" id="Requested_Value" name="Requested_Value" class="form-control" min="1" />
            </div>

            <div class="col-md-4">
                <strong>Requested_Date </strong>
                <label class="input-group date">
                    <input class="form-control date" id="Requested_Date" name="Requested_Date" placeholder="dd/mm/yyyy" />
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </label>
            </div>

            <div class="col-md-4">
                <strong>PPL_Payment_Date </strong>
                <label class="input-group date">
                    <input class="form-control date" id="PPL_Payment_Date" name="PPL_Payment_Date" placeholder="dd/mm/yyyy" />
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </label>
            </div>
        </div>

        <div class="row" style="padding-top: 5px">
            <div class="col-md-6" style="padding-top: 15px">
                <strong>Invoice_Abbott</strong>
                <label class="radio-inline  lobiradio">
                    <input type="radio" name="Invoice_Abbott" value="true"><i></i> Yes
                </label>
                <label class="radio-inline  lobiradio">
                    <input type="radio" name="Invoice_Abbott" value="false"><i></i>No
                </label>
            </div>

            <div class="col-md-6">
                <strong>Report_Abbott_Date </strong>
                <label class="input-group date">
                    <input class="form-control date" id="Report_Abbott_Date" name="Report_Abbott_Date" placeholder="dd/mm/yyyy" />
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </label>
            </div>
        </div>

        <div class="row" style="padding-top: 5px">
            <strong>Note</strong>
            <textarea class="form-control" id="Note" name="Note" rows="3"></textarea>
        </div>
    </div>

    <div class="modal-footer">
        <button type="submit" class="btn btn-sm btn-primary">Confirm</button>
        <a href="#" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
    </div>
</form>

<script>
    $("#HCP_Code").select2({
        width: '100%',
        placeholder: 'Choose HCP'
    });

    $(".date").datepicker({
        format: "dd/mm/yyyy"
    });

    $.ajax({
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        type: 'POST',
        url: "/Index/Select_List_HCP_Info",
        data: JSON.stringify({ 'text': '', 'value': '' }),
        success: function (res) {
            $("#HCP_Code").empty();
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
            $("#HCP_Code").html(res.join(""));
        }
    });

    function AddHistory_Payment() {
        var form = $('#form_add_history_payment').serialize();
        $.ajax({
            url: '/Index/Event_Add_Edit_History_Payment',
            data: form,
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.code == 0) {
                    Lobibox.notify('success',
                        {
                            img: '/Contents/img/check_thanhcong.png',
                            sound: false,
                            position: 'bottom right',
                            delay: 2000,
                            showClass: 'fadeInDown',
                            title: 'Message Success ',
                            msg: data.msg
                        });
                    setTimeout(function() {
                        reload_history_payment_table();
                            $("#myMid .close").click();
                        },
                        200);
                } else {
                    Lobibox.notify('error',
                        {
                            img: '/Contents/img/check_warning.png',
                            sound: false,
                            position: 'bottom right',
                            delay: 3000,
                            showClass: 'fadeInDown',
                            title: 'Message Error ',
                            msg: data.msg
                        });
                }
            },
            error: function () {
                Lobibox.alert(
                    'error', // Any of the following
                    {
                        msg: 'Have Error In Processing , Please try again ! '
                    }
                );
            }
        });
    }

</script>
