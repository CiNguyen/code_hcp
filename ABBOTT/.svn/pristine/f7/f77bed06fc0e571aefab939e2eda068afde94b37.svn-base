<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="HCB_Port.Models" %>
<% Service_costs item = (Service_costs) ViewData["service_costs"];%>

<form id="edit_service_costs" method="post" onsubmit="Event_Edit_Service_Costs();">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h3 class="modal-title" style="color: #00008b">Edit Service Costs</h3>
    </div>
    <div class="modal-body">
        <div class="row" style="padding-top: 10px">
            <div class="col-md-4">
                <strong>Chi tiết</strong>
                <input type="text" id="details" name="details" class="form-control" required="required" value="<%=item.Detail %>"/>
                <input type="hidden" id="ID" name="ID" value="<%=item.ID %>"/>
            </div>
            <div class="col-md-4">
                <strong>Mức</strong>
                <input type="text" id="rate" name="rate" class="form-control" value="<%=item.Rate %>"/>
            </div>
            <div class="col-md-4">
                <strong>Tiền thù lao</strong>
                <label class="input-group date">
                    <input type="text" id="honorarium_fee" placeholder="mm-yyyy" name="honorarium_fee" class="form-control date" value="<%=item.Honorrarium_fee %>"/>
                    
                </label>
            </div>
        </div>
        <div class="row" style="padding-top: 10px">
            <div class="col-md-4">
                <strong>Vé máy bay</strong>
                <input type="text" id="Place_Issue" name="Place_Issue" class="form-control" value="<%=item.Air_ticket %>" />
            </div>
            <div class="col-md-4">
                <strong>Ăn uống</strong>
                <input type="text" class="form-control" name="meal_fee" id="meal_fee" value="<%=item.Meal_fee %>"/>
            </div>
            <div class="col-md-4">
                <strong>Khách sạn</strong>
                <input type="text" class="form-control" name="hotel_fee" id="hotel_fee" value="<%=item.Hotel_fee %>"/>
            </div>
        </div>

        <div class="row" style="padding-top: 10px">
            <div class="col-md-4">
                <strong>Thuê xe</strong>
                <label class="input-group date">
                    <input type="text" id="car_rental" placeholder="mm-yyyy" name="car_rental" class="form-control date"  value="<%=item.Car_rental%>"/>
                    
                </label>
            </div>
            <div class="col-md-4">
                <strong>Chi phí khác</strong>
                <input type="text" class="form-control" name="other_fees" id="other_fees" value="<%=item.Other_fees %>"/>
            </div>
            <div class="col-md-4">
                <strong>Tổng chi phí</strong>
                <input type="text" class="form-control" name="total_costs" id="total_costs" value="<%=item.Total_costs %>"/>
            </div>
        </div>

    </div>
    <div class="modal-footer">
        <button class="btn btn-primary" type="submit">Cập nhật</button>
        <a href="#" class="btn btn-info" data-dismiss="modal">Close</a>
    </div>
</form>
<script type="text/javascript">
    $(".date").datepicker({
        format: "dd/mm/yyyy"
    });

    function Event_Edit_Service_Costs() {
        var form = $('#edit_service_costs').serialize();
        $.ajax({
            type: "POST",
            data: form,
            url: "/Index/Event_Add_Edit_Service_Costs",
            datatype: 'json',
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
                    reload_costs_tableview();
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
