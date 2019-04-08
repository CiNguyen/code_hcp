<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="HCB_Port.Models" %>
<% List<Get_List_HCP_Info_Result> list = (List<Get_List_HCP_Info_Result>)ViewData["list_hcp_info"]; %>

<script type="text/javascript">
    $(function () {
        var table = $('#hcp_info').DataTable({
            dom: 'T<"clear">lfrtip',
            "scrollX": true,
            "language": {
                "decimal": ",",
                "thousands": "."
            },
            "scrollCollapse": true,
            "tableTools": {
                "sSwfPath": "../Contents/css/datatables/swf/copy_csv_xls.swf"
            }
        });

        new $.fn.dataTable.FixedColumns(table, {
            leftColumns: 2
        });

        $('.panel').lobiPanel({
            reload: {
                icon: 'fa fa-refresh'
            },
            editTitle: {
                icon: 'fa fa-edit',
                icon2: 'fa fa-save'
            },
            unpin: {
                icon: 'fa fa-arrows'
            },
            minimize: {
                icon: 'fa fa-chevron-up',
                icon2: 'fa fa-chevron-down'
            },
            close: {
                icon: 'fa fa-times-circle'
            },
            expand: {
                icon: 'fa fa-expand',
                icon2: 'fa fa-compress'
            }

        });
    })
</script>
<div class="panel panel-info">
    <div class="panel-heading">
        <div class="panel-title">
            <h4>HCP Info List</h4>
        </div>
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover " id="hcp_info">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Code</th>
                        <th>Full_Name </th>
                        <th>Citizen_ID</th>
                        <th>Issue_Date</th>
                        <th>Place_Issue</th>
                        <th>PIT_Code</th>
                        <th>Position</th>
                        <th>Birth_Day</th>
                        <th>Address</th>
                        <th>Bank_Name</th>
                        <th>Bank_Account</th>
                        <th>Quantity_Event</th>
                        <th>Money_Received</th>
                        <th>History</th>
                        <th>Total_Amount</th>
                        <th>Note</th>
                        <th>Status</th>
                        <th>Create_Date</th>
                        <th>Create_User</th>
                        <th>CMND_MT</th>
                        <th>CMND_MS</th>
                    </tr>
                </thead>
                <tbody>
                    <%if (list != null && list.Count>0)
                        {
                            foreach (var item in list)
                            { %>
                    <tr>
                        <td>
                            <a href="/Index/HCP_EditView/<%=item.ID %>" class="btn btn-sm btn-primary" data-backdrop="static" data-toggle="modal" data-target="#myModal"><i class="fa fa-edit"></i></a>
                            <% if (item.Status != "Blocked")
                                { %>
                            <a href="Javascript:;" onclick="return Block_HCP_Info(<%=item.ID %>);" title="Khóa" class="btn btn-sm btn-danger"><i class="fa fa-lock"></i></a>
                            <% }
                                else
                                { %>
                            <a href="Javascript:;" onclick="return Unblock_HCP_Info(<%= item.ID %>);" title="Mở Khóa" class="btn btn-sm btn-success"><i class="fa fa-unlock"></i></a>
                            <a href="Javarscript:;" onclick="return Delete_HCP_Info(<%=item.ID%>);" class="btn btn-sm btn-danger"><i class="fa fa-remove"></i></a>
                            <% } %>
                        </td>
                        <td><%=item.Code %></td>
                        <td><%=item.Full_Name %></td>
                        <td><%=item.Citizen_ID %></td>
                        <td><%=item.Issue_Date.GetValueOrDefault().ToShortDateString() %></td>
                        <td><%=item.Place_Issue %></td>
                        <td><%=item.PIT_Code %></td>
                        <td><%=item.Position %></td>
                        <td><%=item.Birth_Day.GetValueOrDefault().ToShortDateString() %></td>
                        <td><%=item.Address %></td>
                        <td><%=item.Bank_Name %></td>
                        <td><%=item.Bank_Account %></td>
                        <td><%=item.Quantity_Event %></td>
                        <td><%=item.Money_Received %></td>
                        <td><%=item.History %></td>
                        <td><%=item.Total_Amount %></td>
                        <td><%=item.Note %></td>
                        <td><%=item.Status %></td>
                        <td><%=item.Create_Date.GetValueOrDefault().ToShortDateString() %></td>
                        <td><%=item.Create_User %></td>
                        <td>
                            <% if (item.CMND_MT != null)	{%>
                             <img class="cursor-pointer" id="ha1" title="Click vào hình ảnh !" width="100%" height="auto" src="data:image/png;base64, <%=Convert.ToBase64String(item.CMND_MT) %>" alt="Image" />
                            <%} %>
                        </td>
                        <td>
                            <% if (item.CMND_MS != null)	{%>
                             <img class="cursor-pointer" id="ha2" title="Click vào hình ảnh !" width="100%" height="auto" src="data:image/png;base64, <%=Convert.ToBase64String(item.CMND_MS) %>" alt="Image" />
                            <%} %>
                        </td>
                    </tr>
                    <% } %>
                    <%} %>
                </tbody>
                <tfoot>
                    <tr>
                        <th>#</th>
                        <th>Code</th>
                        <th>Full_Name </th>
                        <th>Citizen_ID</th>
                        <th>Issue_Date</th>
                        <th>Place_Issue</th>
                        <th>PIT_Code</th>
                        <th>Position</th>
                        <th>Birth_Day</th>
                        <th>Address</th>
                        <th>Bank_Name</th>
                        <th>Bank_Account</th>
                        <th>History</th>
                        <th>Total_Amount</th>
                        <th>Note</th>
                        <th>Status</th>
                        <th>Create_Date</th>
                        <th>Create_User</th>
                        <th>CMND_MT</th>
                        <th>CMND_MS</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
    
</div>
<div id="myLogo" class="modal fade bs-example-modal-md">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="row no-padding ">
				<div class="col-md-12 padding-20">
					<img id="ori_logo" class="center-block" width="100%" height="auto" src="" />
				</div>
			</div>
			<div class="row no-padding margin-bottom-10">
				<div class="col-md-12">
					<button class="btn btn-danger center-block" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i>Close</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>


<script>
    set_event_showBigImage();
    function set_event_showBigImage() {
         $(document).on('click','#ha1',function (r) {
            $('#ori_logo').attr('src', r.target.src);
            $('#myLogo').modal({
                backdrop: 'static'
            });
        });
        $(document).on('click','#ha2',function (r) {
            $('#ori_logo').attr('src', r.target.src);
            $('#myLogo').modal({
                backdrop: 'static'
            });
        });
    }
    function Block_HCP_Info(id) {
        var user = "<%=Session["user"]%>";
        Lobibox.confirm({
            msg: "Xác Nhận Khóa Admin ?",
            callback: function ($this, type, ev) {
                if (type === 'yes') {
                    $.ajax({
                        url: '/Index/Event_Block_Unblock_HCP_Info/' + id + '?user=' + user,
                        type: "POST",
                        contentType: "application/json",
                        dataType: "json",
                        success: function (data) {
                            if (data.code == "0") {
                                Lobibox.alert("success",
                                    {
                                        msg: data.msg
                                    });
                                reload_admin_info_table();
                            } else {
                                Lobibox.alert("error",
                                    {
                                        msg: data.msg
                                    });
                            }
                        }
                    });
                }
            }
        });
    }

    function Unblock_HCP_Info(id) {
        var user = "<%=Session["user"]%>";
        Lobibox.confirm({
            msg: "Xác Nhận Mở Khóa Admin ?",
            callback: function ($this, type, ev) {
                if (type === 'yes') {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json",
                        dataType: "json",
                        url: '/Index/Event_Block_Unblock_HCP_Info/' + id + '?user=' + user,
                        success: function (data) {
                            if (data.code == "0") {
                                Lobibox.alert("success",
                                    {
                                        msg: data.msg
                                    });
                                reload_admin_info_table();
                            } else {
                                Lobibox.alert("error",
                                    {
                                        msg: data.msg
                                    });
                            }
                        }
                    });
                }
            }
        });
    }

    function Delete_HCP_Info(id) {
        var user = "<%=Session["user"]%>";
        Lobibox.confirm({
            msg: "Xác Nhận Xóa Admin Này ?",
            callback: function ($this, type, ev) {
                if (type === 'yes') {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json",
                        dataType: "json",
                        url: '/Index/Event_Delete_HCP_Info/' + id + '?user=' + user,
                        success: function (data) {
                            if (data.code == "0") {
                                Lobibox.alert("success",
                                    {
                                        msg: data.msg
                                    });
                                reload_admin_info_table();
                            } else {
                                Lobibox.alert("error",
                                    {
                                        msg: data.msg
                                    });
                            }
                        }
                    });
                }
            }
        });
    }
</script>
