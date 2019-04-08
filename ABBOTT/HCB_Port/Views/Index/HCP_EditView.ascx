﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="HCB_Port.Models" %>
<% HCP_Info item = (HCP_Info) ViewData["hcp_info"];%>

<form id="edit_hcp_info" method="post" onsubmit="Event_Edit_HCP_Info();">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h3 class="modal-title" style="color: #00008b">Edit HCP Info</h3>
    </div>
    <div class="modal-body">
            <div class="row" style="padding-top: 10px">
            <div class="col-md-4">
                <strong>Full Name <span style="color: red">*</span></strong>
                <input type="text" id="Full_Name" name="Full_Name" class="form-control" required="required" value="<%=item.Full_Name %>"/>
                <input type="hidden" id="ID" name="ID" value="<%=item.ID %>"/>
            </div>
            <div class="col-md-4">
                <strong>Citizen ID <span style="color: red">*</span></strong>
                <input type="text" id="Citizen_ID" name="Citizen_ID" class="form-control" value="<%=item.Citizen_ID %>"/>
            </div>
            <div class="col-md-4">
                <strong>Issue Date</strong>
                <label class="input-group date">
                    <input type="text" id="Issue_Date" placeholder="mm-yyyy" name="" class="form-control date" value="<%=item.Issue_Date.GetValueOrDefault().ToShortDateString() %>"/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </label>
            </div>
        </div>
        <div class="row" style="padding-top: 10px">
            <div class="col-md-4">
                <strong>Place Issue </strong>
                <input type="text" id="Place_Issue" name="Place_Issue" class="form-control" value="<%=item.Place_Issue %>" />
            </div>
            <div class="col-md-4">
                <strong>PIT Code</strong>
                <input type="text" class="form-control" name="PIT_Code" id="PIT_Code" value="<%=item.PIT_Code %>"/>
            </div>
            <div class="col-md-4">
                <strong>Position</strong>
                <input type="text" class="form-control" name="Position" id="Position" value="<%=item.Position %>"/>
            </div>
        </div>

        <div class="row" style="padding-top: 10px">
            <div class="col-md-4">
                <strong>Birth Day</strong>
                <label class="input-group date">
                    <input type="text" id="Birth_Day" placeholder="mm-yyyy" name="Birth_Day" class="form-control date"  value="<%=item.Birth_Day%>"/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </label>
            </div>
            <div class="col-md-4">
                <strong>Address</strong>
                <input type="text" class="form-control" name="Address" id="Address" value="<%=item.Address %>"/>
            </div>
            <div class="col-md-4">
                <strong>Bank Name</strong>
                <input type="text" class="form-control" name="Bank_Name" id="Bank_Name" value="<%=item.Bank_Name %>"/>
            </div>
        </div>

        <div class="row" style="padding-top: 10px">
            <div class="col-md-6">
                <strong>Bank Account</strong>
                <input type="text" class="form-control" name="Bank_Account" id="Bank_Account" value="<%=item.Bank_Account %>" />
            </div>
            
            <div class="col-md-6">
                <strong>Status</strong>
                <input type="text" class="form-control" name="Status" id="Status" value="<%=item.Status %>"/>
            </div>
        </div>
         
              <div class="row" style="padding-top: 10px">
            <div class="display-table-cell w-full vertical-align-middle">
			    <div class="form-group">
			        <label for="Image" class="control-label font-bold">CMND Mặt Trước <span style="color: red">*</span></label>
			        <input type="file" id="imgedit1" name="imgedit1" />
		        </div>
		    </div>
            <div class="display-table-cell w-full vertical-align-middle padding-15">
                <% if (item.CMND_MT == null)
                    {%>
                <img src=".." id="CMND_MT" style="width:256px;height:auto">
		        <%} else {%>
                <img src="data:image/png;base64, <%=Convert.ToBase64String(item.CMND_MT) %>" id="CMND_MT" style="width:256px;height:auto">
                <%} %>
            </div>
        </div>
        
        
                <div class="row" style="padding-top: 10px">
        <div class="row display-table-cell w-full vertical-align-middle">
            <div class="form-group">
			    <label for="Image" class="control-label font-bold">CMND Mặt Sau <span style="color: red">*</span></label>
			    <input type="file" id="imgedit2" name="imgedit2" /> 
		    </div>
        </div>
            <div class="display-table-cell w-full vertical-align-middle padding-15">
                <% if (item.CMND_MS == null)
                    {%>
                <img src=".." id="CMND_MS" style="width:256px;height:auto">
                <%}
                  else
                    {%> <img src="data:image/png;base64, <%=Convert.ToBase64String(item.CMND_MS) %>" id="CMND_MS" style="width:256px;height:auto">
		        <% }%>
            </div>
        </div>
        
        
        <div class="row" style="padding-top: 10px">
            <strong>Note</strong>
            <textarea rows="3" class="form-control" name="Note"><%=item.Note %></textarea>
        </div>
        
        
    </div>
    <div class="modal-footer">
        <button class="btn btn-primary" type="submit"><i class="fa fa-pencil" aria-hidden="true"></i>Edit</button>
        <a href="#" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i>Close</a>
    </div>
</form>
<script type="text/javascript">
    $(".date").datepicker({
        format: "dd/mm/yyyy"
    });
    $(document).ready(function () {
        var input_img1 = $('#imgedit1');
        var input_img2 = $('#imgedit2');
        input_img1.on('change', function () {
            readURL(input_img1[0],'#CMND_MT');
        });
        input_img2.on('change', function () {
            readURL(input_img2[0],'#CMND_MS');
        });
    })
    function readURL(input, idimg) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				//alert(e.target.result);
				$(idimg).attr('src', e.target.result);
			};
			reader.readAsDataURL(input.files[0]);
		}
	}


    function Event_Edit_HCP_Info() {
        var form = convert_SerializeArray_to_JSON('edit_hcp_info');
        var issue_date = $('#Issue_Date').val();
        var cmnd_mt = $('#CMND_MT').attr('src');
        var cmnd_ms = $('#CMND_MS').attr('src');
        $.ajax({
            type: "POST",
            data: {data:JSON.stringify(form), CMND_MT: cmnd_mt, CMND_MS: cmnd_ms, issue:issue_date},
            url: "/Index/Event_Add_Edit_HCP_Info",
            success: function (data) {
                if (data["code"] == "0") {
                    Lobibox.notify('success', {
                        img: '/Contents/img/check_thanhcong.png',
                        sound: false,
                        position: 'top right',
                        delay: 2000,
                        showClass: 'fadeInDown',
                        title: 'Message Success ',
                        msg: data['msg']
                    });
                    Load_Content();
                    $("#myModal .close").click();
                    reload_hcp_tableview();
                } else {
                    Lobibox.notify('error', {
                        img: '/Contents/img/check_warning.png',
                        sound: false,
                        position: 'top right',
                        delay: 2000,
                        showClass: 'fadeInDown',
                        title: 'Message Error ',
                        msg: data['msg']
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
