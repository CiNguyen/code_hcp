<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="HCB_Port.Models" %>
<% List<Get_List_Event_Info_Result> list = (List<Get_List_Event_Info_Result>)ViewData["list_event_info"]; %>

<div class="panel panel-info">
    <div class="panel-heading">
        <div class="panel-title">
            <h4>Event Info List</h4>
        </div>
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover " id="event_info_datatable">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Abbott Code</th>
                        <th>Tên Event </th>
                        <th>Event Time</th>
                        <th>Request Date</th>
                        <th>Region</th>
                        <th>Requester Code</th>
                        <th>Tên Requester</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Description</th>
                        <th>Ghi chú</th>
                        <th>Status</th>
                        <th>Create Date</th>
                        <th>Create User</th>
                    </tr>
                </thead>
                <tbody>
                    <% foreach (var item in list)
                       { %>
                    <tr>
                        <td>
                            <a href="/Index/Detail_Event_Info/<%=item.ID %>" class="btn btn-sm btn-primary" data-backdrop="static" data-toggle="modal" data-target="#myModal"><i class="fa fa-info"></i></a>
                            <% if (item.Status != "Blocked")
                               { %>
                            <a href="Javascript:;" onclick="return Block_Event_Info(<%=item.ID %>);" title="Khóa" class="btn btn-sm btn-danger"><i class="fa fa-lock"></i></a>
                            <% }
                               else
                               { %>
                            <a href="Javascript:;" onclick="return Unblock_Event_Info(<%= item.ID %>);" title="Mở Khóa" class="btn btn-sm btn-success"><i class="fa fa-unlock"></i></a>
                            <a href="Javarscript:;" onclick="return Delete_Event_Info(<%=item.ID%>);" class="btn btn-sm btn-danger"><i class="fa fa-remove"></i></a>
                            <% } %>
                        </td>
                        <td><%=item.Abbott_Code %></td>
                        <td><%=item.Name %></td>
                        <td><%=item.Event_Time.GetValueOrDefault().ToShortDateString() %></td>
                        <td><%=item.Request_Date.GetValueOrDefault().ToShortDateString() %></td>
                        <td><%=item.Area %></td>
                        <td><%=item.Code %></td>
                        <td><%=item.FullName %></td>
                        <td><%=item.Email %></td>
                        <td><%=item.Phone %></td>
                        <td><%=item.Description %></td>
                        <td><%=item.Note %></td>
                        <td><%=item.Status %></td>
                        <td><%=item.Create_Date.GetValueOrDefault().ToShortDateString() %></td>
                        <td><%=item.Create_User %></td>
                    </tr>
                    <% } %>
                </tbody>
                <tfoot>
                    <tr>
                        <th>#</th>
                        <th>Abbott Code</th>
                        <th>Tên Event </th>
                        <th>Event Time</th>
                        <th>Request Date</th>
                        <th>Region</th>
                        <th>Requester Code</th>
                        <th>Tên Requester</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Description</th>
                        <th>Ghi chú</th>
                        <th>Status</th>
                        <th>Create Date</th>
                        <th>Create User</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        var table = $('#event_info_datatable').DataTable({
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

        new $.fn.dataTable.FixedColumns(table,
            {
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
    });

    function Block_Event_Info(id) {
        var user = "<%=Session["user"]%>";
        Lobibox.confirm({
            msg: "Xác Nhận Khóa Admin ?",
            callback: function ($this, type, ev) {
                if (type === 'yes') {
                    $.ajax({
                        url: '/Index/Event_Block_Unblock_Event_Info/' + id + '?user=' + user,
                        type: "POST",
                        contentType: "application/json",
                        dataType: "json",
                        success: function (data) {
                            if (data.code == "0") {
                                Lobibox.alert("success",
                                    {
                                        msg: data.msg
                                    });
                                reload_event_info_table();
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

    function Unblock_Event_Info(id) {
        var user = "<%=Session["user"]%>";
     Lobibox.confirm({
         msg: "Xác Nhận Mở Khóa Admin ?",
         callback: function ($this, type, ev) {
             if (type === 'yes') {
                 $.ajax({
                     type: "POST",
                     contentType: "application/json",
                     dataType: "json",
                     url: '/Index/Event_Block_Unblock_Event_Info/' + id + '?user=' + user,
                     success: function (data) {
                         if (data.code == "0") {
                             Lobibox.alert("success",
                                 {
                                     msg: data.msg
                                 });
                             reload_event_info_table();
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

 function Delete_Event_Info(id) {
     var user = "<%=Session["user"]%>";
        Lobibox.confirm({
            msg: "Xác Nhận Xóa Admin Này ?",
            callback: function ($this, type, ev) {
                if (type === 'yes') {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json",
                        dataType: "json",
                        url: '/Index/Event_Delete_Event_Info/' + id + '?user=' + user,
                        success: function (data) {
                            if (data.code == "0") {
                                Lobibox.alert("success",
                                    {
                                        msg: data.msg
                                    });
                                reload_event_info_table();
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
