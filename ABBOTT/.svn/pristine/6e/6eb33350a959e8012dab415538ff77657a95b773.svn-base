<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="HCB_Port.Models" %>
<% List<Get_History_Payment_By_Event_Result> list = (List<Get_History_Payment_By_Event_Result>)ViewData["history_payment"]; %>


<div class="panel panel-info">
    <div class="panel-heading">
        <div class="panel-title">
            <h4>History Payment</h4>
        </div>
        <div class="col-md-2">
            <a href="/Index/Add_History_Payment_To_Event/" class="btn btn-sm btn-primary" data-backdrop="static" data-toggle="modal" data-target="#myMid"><i class="fa fa-plus"> Add History Payment</i></a>
        </div>
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover " id="history_payment_by_event1">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>HCP_Code</th>
                        <th>Full_Name </th>
                        <th>Citizen_ID</th>
                        <th>Number_Contract</th>
                        <th>FromDate</th>
                        <th>ToDate</th>
                        <th>Value_Contract</th>
                        <th>PPL_GetContract_Date</th>
                        <th>Rep_Name</th>
                        <th>Sup_Name</th>
                        <th>Description</th>
                        <th>Account_Name</th>
                        <th>Requested_Value</th>
                        <th>Requested_Date</th>
                        <th>PPL_Payment_Date</th>
                        <th>Payment_Value</th>
                        <th>Invoice_Abbott</th>
                        <th>Report_Abbott_Date</th>
                        <th>Note</th>
                        <th>Status</th>
                        <th>Create_Date</th>
                        <th>Create_User</th>
                    </tr>
                </thead>
                <tbody>
                    <% foreach (var item in list)
                       { %>
                    <tr>
                        <td>
                            <a href="/Index/Edit_History_Payment/<%=item.ID %>" class="btn btn-sm btn-primary" data-backdrop="static" data-toggle="modal" data-target="#myMid"><i class="fa fa-edit"></i></a>
                            <% if (item.Status != "Blocked")
                               { %>
                                <a href="Javascript:;" onclick="return Block_History_Payment(<%=item.ID %>);" title="Khóa" class="btn btn-sm btn-danger"><i class="fa fa-lock"></i></a>
                            <% }
                               else
                               { %>
                                <a href="Javascript:;" onclick="return Unblock_History_Payment(<%= item.ID %>);" title="Mở Khóa" class="btn btn-sm btn-success"><i class="fa fa-unlock"></i></a>
                                <a href="Javarscript:;" onclick="return Delete_History_Payment(<%=item.ID%>);" class="btn btn-sm btn-danger"><i class="fa fa-remove"></i></a>
                            <% } %>
                        </td>
                        <td><%=item.HCP_Code %></td>
                        <td><%=item.Full_Name %></td>
                        <td><%=item.Citizen_ID %></td>
                        <td><%=item.Number_Contract %></td>
                        <td><%=item.FromDate %></td>
                        <td><%=item.ToDate %></td>
                        <td><%=item.Value_Contract %></td>
                        <td><%=item.PPL_GetContract_Date %></td>
                        <td><%=item.Rep_Name %></td>
                        <td><%=item.Sup_Name %></td>
                        <td><%=item.Description %></td>
                        <td><%=item.Account_Name %></td>
                        <td><%=item.Requested_Value %></td>
                        <td><%=item.Requested_Date %></td>
                        <td><%=item.PPL_Payment_Date%></td>
                        <td><%=item.Payment_Value %></td>
                        <td><%=item.Invoice_Abbott %></td>
                        <th><%=item.Report_Abbott_Date%></th>
                        <th><%=item.Note %></th>
                        <th><%=item.Status %></th>
                        <th><%=item.Create_Date%></th>
                        <th><%=item.Create_User %></th>
                    </tr>
                    <% } %>
                </tbody>
                <tfoot>
                    <tr>
                        <th>#</th>
                        <th>HCP_Code</th>
                        <th>Full_Name </th>
                        <th>Citizen_ID</th>
                        <th>Number_Contract</th>
                        <th>FromDate</th>
                        <th>ToDate</th>
                        <th>Value_Contract</th>
                        <th>PPL_GetContract_Date</th>
                        <th>Rep_Name</th>
                        <th>Sup_Name</th>
                        <th>Description</th>
                        <th>Account_Name</th>
                        <th>Requested_Value</th>
                        <th>Requested_Date</th>
                        <th>PPL_Payment_Date</th>
                        <th>Payment_Value</th>
                        <th>Invoice_Abbott</th>
                        <th>Report_Abbott_Date</th>
                        <th>Note</th>
                        <th>Status</th>
                        <th>Create_Date</th>
                        <th>Create_User</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        setTimeout(function() {
            var table1 = $('#history_payment_by_event1').DataTable({
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

            new $.fn.dataTable.FixedColumns(table1,
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
        }, 200);
    });

    function Block_History_Payment(id) {
        var user = "<%=Session["user"]%>";
          Lobibox.confirm({
              msg: "Xác Nhận Khóa Admin ?",
              callback: function ($this, type, ev) {
                  if (type === 'yes') {
                      $.ajax({
                          url: '/Index/Event_Block_Unblock_History_Payment/' + id + '?user=' + user,
                          type: "POST",
                          contentType: "application/json",
                          dataType: "json",
                          success: function (data) {
                              if (data.code == "0") {
                                  Lobibox.alert("success",
                                      {
                                          msg: data.msg
                                      });
                                  reload_history_payment_table();
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

      function Unblock_History_Payment(id) {
          var user = "<%=Session["user"]%>";
          Lobibox.confirm({
              msg: "Xác Nhận Mở Khóa Admin ?",
              callback: function ($this, type, ev) {
                  if (type === 'yes') {
                      $.ajax({
                          type: "POST",
                          contentType: "application/json",
                          dataType: "json",
                          url: '/Index/Event_Block_Unblock_History_Payment/' + id + '?user=' + user,
                          success: function (data) {
                              if (data.code == "0") {
                                  Lobibox.alert("success",
                                      {
                                          msg: data.msg
                                      });
                                  reload_history_payment_table();
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

      function Delete_History_Payment(id) {
          var user = "<%=Session["user"]%>";
     Lobibox.confirm({
         msg: "Xác Nhận Xóa Admin Này ?",
         callback: function ($this, type, ev) {
             if (type === 'yes') {
                 $.ajax({
                     type: "POST",
                     contentType: "application/json",
                     dataType: "json",
                     url: '/Index/Event_Delete_History_Payment/' + id + '?user=' + user,
                     success: function (data) {
                         if (data.code == "0") {
                             Lobibox.alert("success",
                                 {
                                     msg: data.msg
                                 });
                             reload_history_payment_table();
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
