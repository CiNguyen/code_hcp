<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="HCB_Port.Models" %>
<% Admin_Info item = (Admin_Info) ViewData["admin_info"]; %>

<form id="form_edit_admin_info" method="post" action="javascript:;" onsubmit="return Edit_Admin_Info();">
    <div class="modal-header">
        <a class="close" data-dismiss="modal" id="close_pop">×</a>
        <h3>Edit Admin Info</h3>
    </div>
    <div class="modal-body">
        <div class="row" style="padding-top: 5px">
            <strong>Code <span style="color:red">*</span></strong>
            <input type="text" id="Code" name="Code" class="form-control" required="required" value="<%=item.Code %>"/>
            <input type="hidden" id="ID" name="ID" value="<%=item.ID %>"/>
        </div>

        <div class="row" style="padding-top: 5px">
            <strong>Full_Name  <span style="color:red">*</span></strong>
            <input type="text" id="FullName" name="FullName" class="form-control" required="required"  value="<%=item.FullName %>"/>
        </div>

        <div class="row" style="padding-top: 5px">
            <strong>Region</strong>
            <input type="text" id="Region" name="Region" class="form-control" value="<%=item.Region %>"/>
        </div>
        
        <div class="row" style="padding-top: 5px">
            <strong>Area</strong>
            <input type="text" id="Area" name="Area" class="form-control" value="<%=item.Area %>"/>
        </div>
        
        <div class="row" style="padding-top: 5px">
            <strong>Phone</strong>
            <input type="tel" id="Phone" name="Phone" class="form-control" value="<%=item.Phone %>"/>
        </div>
        
        <div class="row" style="padding-top: 5px">
            <strong>Email</strong>
            <input type="email" id="Email" name="Email" class="form-control" value="<%=item.Email %>"/>
        </div>
    </div>

    <div class="modal-footer">
        <button type="submit" class="btn btn-sm btn-primary">Confirm</button>
        <a href="#" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
    </div>
</form>

<script type="text/javascript">
    function Edit_Admin_Info() {
        var form = $('#form_edit_admin_info').serialize();
        $.ajax({
            url: '/Index/Event_Add_Edit_Admin_Info',
            data: form,
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.code == "0") {
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
                    $("#mysmal .close").click();
                    reload_admin_info_table();
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

        return false;
    }
</script>
