<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="HCB_Port.Models" %>
<% Event_Info item = (Event_Info)ViewData["event_info"]; %>

<form id="form_edit_event_info" method="post" action="javascript:;" onsubmit="return Edit_Event_Info();">
    <div class="row" style="padding-top: 5px">
        <div class="col-md-4">
            <strong>Abbott_Code <span style="color: red">*</span></strong>
            <input type="text" id="Abbott_Code" name="Abbott_Code" class="form-control" required="required" value="<%=item.Abbott_Code %>" />
            <input type="hidden" id="ID" name="ID" value="<%=item.ID %>" />
        </div>

        <div class="col-md-4">
            <strong>Name  <span style="color: red">*</span></strong>
            <input type="text" id="Name" name="Name" class="form-control" required="required" value="<%=item.Name %>" />
        </div>

        <div class="col-md-4">
            <strong>Admin <span style="color: red">(*)</span></strong>
            <select id="Id_Admin_Info" name="Id_Admin_Info" class="form-control">
                <option value="">Choose Admin</option>
            </select>
        </div>
    </div>

    <div class="row" style="padding-top: 5px">
        <div class="col-md-4">
            <strong>Area</strong>
            <input type="text" id="Area" name="Area" class="form-control" value="<%=item.Area %>" />
        </div>

        <div class="col-md-4">
            <strong>Event_Time</strong>
            <label class="input-group date">
                <input class="form-control date" id="Event_Time" name="Event_Time" placeholder="dd/mm/yyyy" value="<%=item.Event_Time.GetValueOrDefault().ToShortDateString() %>" />
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                </span>
            </label>
        </div>

        <div class="col-md-4">
            <strong>Request_Date</strong>
            <label class="input-group date">
                <input class="form-control date" id="Request_Date" name="Request_Date" placeholder="dd/mm/yyyy" value="<%=item.Request_Date.GetValueOrDefault().ToShortDateString() %>" />
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                </span>
            </label>
        </div>
    </div>

    <div class="row" style="padding-top: 5px">
        <strong>Description</strong>
        <textarea class="form-control" id="Description" name="Description" rows="3"><%=item.Description %></textarea>
    </div>

    <div class="row" style="padding-top: 5px">
        <strong>Note</strong>
        <textarea class="form-control" id="Note" name="Note" rows="3"><%=item.Note %></textarea>
    </div>
</form>

<script>
    $("#Id_Admin_Info").select2({
        width: '100%',
        placeholder: 'Choose Admin'
    });

    $(".date").datepicker({
        format: "dd/mm/yyyy"
    });

    $.ajax({
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        type: 'POST',
        url: "/Index/Select_List_Admin_Info",
        data: JSON.stringify({ 'text': '', 'value': '' }),
        success: function (res) {
            $("#Id_Admin_Info").empty();
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
            $("#Id_Admin_Info").html(res.join(""));
            $('#Id_Admin_Info').val('<%=item.Id_Admin_Info%>').trigger('change');
        }
    });

    function Edit_Event_Info() {
        var form = $('#form_edit_event_info').serialize();
        $.ajax({
            url: '/Index/Event_Add_Edit_Event_Info',
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
                    reload_event_info_table();
                    reload_edit_event_info();
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
