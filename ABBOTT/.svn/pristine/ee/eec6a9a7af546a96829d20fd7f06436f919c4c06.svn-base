<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="HCB_Port.Models" %>
<% List<Service_Criteria> list = (List<Service_Criteria>)ViewData["list_service_costs"];
    string usr = (string)ViewBag.Usr;
%>
<style>
    .air_ticket {
        background-color: transparent !important;
    }

    .meal_fee {
        background-color: transparent !important;
    }

    .sub_ticket {
        cursor: pointer;
    }

    .tooltip-inner {
        white-space: pre-wrap;
    }
</style>
<div class="panel panel-info">
    <div class="panel-heading">
        <div class="panel-title">
            <h4>Chi phí dịch vụ</h4>
        </div>
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover " id="table_service_costs">
                <thead class="table">
                    <tr>
                        <th>STT</th>
                        <th>Chi tiết</th>
                        <th>Mức (%)</th>
                        <th>Tiền thù lao</th>
                        <th>Vé máy bay</th>
                        <th>Ăn uống</th>
                        <th>Khách sạn</th>
                        <th>Thuê xe</th>
                        <th>Chi phí khác</th>
                        <th>Tổng chi phí</th>
                    </tr>
                </thead>
                <tbody>
                    <%for (int i = 0; i < list.Count - 1; i++)
                        {
                            var item = list[i];
                    %>
                    <tr>
                        <td><%=item.ID_Details %></td>
                        <td><%=item.Details %></td>
                        <td><%if (item.ID_Details == 2 || item.ID_Details == 4 || item.ID_Details == 7)
                                { %>
                            <input type="text" data-number="" data-html="true" title="Press <b><i>'Enter'</i></b> to submit result!" data-toggle="tooltip" data-placement="top" class="rn_<%=item.ID_Details %>" style="color: darkgreen" data-role="none" name="rate_name" id="rate_name_<%=item.ID_Details %>" value="0" />
                            <%}
                                else
                                {%>
                            <input class="rate_name rn_<%=item.ID_Details %> %> no-border" readonly type="text" style="color: darkgreen" data-role="none" value="0" />
                            <% }%>
                        </td>
                        <td><%if (item.ID_Details == 3)
                                { %>
                            <input type="text" data-number="" data-html="true" title="Press <b><i>'Enter'</i></b> to submit result!" data-toggle="tooltip" data-placement="top" class="hn_<%=item.ID_Details %>" style="color: darkgreen" data-role="none" name="honorarium_fee" id="honorarium_fee" value="0" />
                            <%}
                                else
                                {%>
                            <input data-number="" class="honorarium_fee hn_<%=item.ID_Details %> no-border" readonly type="text" style="color: darkgreen" data-role="none" value="0" />
                            <% }%>
                        </td>
                        <td>
                            <%if (item.ID_Details == 3)
                                { %>
                            <input type="text" data-number="" data-html="true" title="Press <b><i>'Enter'</i></b> to submit result!" data-toggle="tooltip" data-placement="top" class="at_<%=item.ID_Details %>" style="color: darkgreen" data-role="none" name="air_ticket" id="air_ticket" value="0" />
                            <%}
                                else
                                {%>
                            <input class="air_ticket at_<%=item.ID_Details %> no-border" readonly type="text" style="color: darkgreen" data-role="none" value="0" />
                            <% }%>
                        </td>
                        <td>
                            <%if (item.ID_Details == 3)
                                { %>
                            <input type="text" data-number="" data-html="true" title="Press <b><i>'Enter'</i></b> to submit result!" data-toggle="tooltip" data-placement="top" class="mf_<%=item.ID_Details %>" style="color: darkgreen" data-role="none" name="meal_fee" id="meal_fee" value="0" />
                            <%}
                                else
                                {%>
                            <input class="meal_fee mf_<%=item.ID_Details %> no-border" readonly type="text" style="color: darkgreen" data-role="none" value="0" />
                            <% }%>
                        </td>
                        <td>
                            <%if (item.ID_Details == 3)
                                { %>
                            <input type="text" data-number="" data-html="true" title="Press <b><i>'Enter'</i></b> to submit result!" data-toggle="tooltip" data-placement="top" class="hf_<%=item.ID_Details %>" style="color: darkgreen" data-role="none" name="hotel_fee" id="hotel_fee" value="0" />
                            <%}
                                else
                                {%>
                            <input class="hotel_fee hf_<%=item.ID_Details %> no-border" readonly type="text" style="color: darkgreen" data-role="none" value="0" />
                            <% }%>
                        </td>
                        <td>
                            <%if (item.ID_Details == 3)
                                { %>
                            <input type="text" data-number="" data-html="true" title="Press <b><i>'Enter'</i></b> to submit result!" data-toggle="tooltip" data-placement="top" class="cr_<%=item.ID_Details %>" style="color: darkgreen" data-role="none" name="car_rental" id="car_rental" value="0" />
                            <%}
                                else
                                {%>
                            <input class="car_rental cr_<%=item.ID_Details %> no-border" readonly type="text" style="color: darkgreen" data-role="none" value="0" />
                            <% }%>
                        </td>
                        <td>
                            <%if (item.ID_Details == 3)
                                { %>
                            <input type="text" data-number="" data-html="true" title="Press <b><i>'Enter'</i></b> to submit result!" data-toggle="tooltip" data-placement="top" class="of_<%=item.ID_Details %>" style="color: darkgreen" data-role="none" name="other_fees" id="other_fees" value="0" />
                            <%}
                                else
                                {%>
                            <input class="other_fees of_<%=item.ID_Details %> no-border" readonly type="text" style="color: darkgreen" data-role="none" value="0" />
                            <% }%>
                        </td>
                        <td><span class="tt_row" id="total_row_<%=item.ID_Details %>"></span></td>
                    </tr>
                    <% } %>
                    <tr>
                        <th>8</th>
                        <th><%=list[7].Details %></th>
                        <th></th>
                        <th>
                            <input id="Honofee_8" class="honorarium_fee hn_8 no-border" readonly type="text" data-number="" style="color: darkgreen" data-role="none" value="0" /></th>
                        <th>
                            <input id="air_ticket_8" class="air_ticket at_8 no-border" readonly type="text" data-number="" style="color: darkgreen" data-role="none" value="0" /></th>
                        <th>
                            <input id="meal_fee_8" class="meal_fee mf_8 no-border" readonly type="text" data-number="" style="color: darkgreen" data-role="none" value="0" /></th>
                        <th>
                            <input id="hotel_fee_8" class="hotel_fee hf_8 no-border" readonly type="text" data-number="" style="color: darkgreen" data-role="none" value="0" /></th>
                        <th>
                            <input id="car_rental_8" class="car_rental cr_8 no-border" readonly type="text" data-number="" style="color: darkgreen" data-role="none" value="0" /></th>
                        <th>
                            <input id="other_fees_8" class="other_fees of_8 no-border" readonly type="text" data-number="" style="color: darkgreen" data-role="none" value="0" /></th>
                        <th><span id="total_col_8"></span></th>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        getRate_byUser();
        $('[data-toggle="tooltip"]').tooltip();
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
    run();
    
    function run() {
         setTimeout(function () {
            table = $('#table_service_costs').DataTable({
                dom: 'T<"clear">lfrtip',
                "scrollX": true,
                "language": {
                    "decimal": ".",
                    "thousands": ","
                },
                columnDefs: [
                    { type: 'currency', targets: 3 }
                ],
                "scrollCollapse": true,
                "tableTools": {
                    "sSwfPath": "../Contents/css/datatables/swf/copy_csv_xls.swf"
                }
            });
            new $.fn.dataTable.FixedColumns(table, {
                leftColumns: 2,
                rightColumns: 1
             });
             
        }, 500);
    }

    function Block_Service_Costs(id) {
        var user = "<%=Session["user"]%>";
        Lobibox.confirm({
            msg: "Xác Nhận Khóa Dịch Vụ ?",
            callback: function ($this, type, ev) {
                if (type === 'yes') {
                    $.ajax({
                        url: '/Index/Event_Block_Unblock_Service_Costs/' + id + '?user=' + user,
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

    function Unblock_Service_Costs(id) {
        var user = "<%=Session["user"]%>";
        Lobibox.confirm({
            msg: "Xác Nhận Mở Khóa Dịch Vụ ?",
            callback: function ($this, type, ev) {
                if (type === 'yes') {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json",
                        dataType: "json",
                        url: '/Index/Event_Block_Unblock_Service_Costs/' + id + '?user=' + user,
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

    function Delete_Service_Costs(id) {
        var user = "<%=Session["user"]%>";
        Lobibox.confirm({
            msg: "Xác Nhận Xóa Dịch Vụ Này ?",
            callback: function ($this, type, ev) {
                if (type === 'yes') {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json",
                        dataType: "json",
                        url: '/Index/Event_Delete_Service_Costs/' + id + '?user=' + user,
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
    var c;
    function getRate_byUser() {
        var usr = '<%=usr%>';
        $.ajax({
            url: '/Index/getRate_ByUsr',
            type: 'POST',
            data: { usr: usr },
            success: function (r) {
                c = r;
                if (r.code === "OK") {
                    console.log(c);
                    $('.rn_2').val(r.rate_2.Rate);
                    $('.rn_4').val(r.rate_4.Rate);
                    $('.rn_7').val(r.rate_7.Rate);
                }
            }
        });
    }
</script>

