<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<style>
    hr {
        display: block;
        margin-top: 0.5em;
        margin-bottom: 0.5em;
        margin-left: auto;
        margin-right: auto;
        border-style: inset;
        border-width: 1px;
    }

    .modal-lg {
        width: 95% !important;
    }
</style>

<form id="form_add_new_event_info">
    <div class="modal-header">
        <a class="close" data-dismiss="modal" id="close_pop">×</a>
        <h3 style="color: #00008b">Add New Event Info</h3>
    </div>
    <div class="modal-body">
        <div class="row" style="padding-top: 5px">
            <div class="col-md-4">
                <strong>Abbott_Code <span style="color: red">*</span></strong>
                <input type="text" id="Abbott_Code" name="Abbott_Code" class="form-control" required="required" />
            </div>

            <div class="col-md-4">
                <strong>Tên Event  <span style="color: red">*</span></strong>
                <input type="text" id="Name" name="Name" class="form-control" required="required" />
            </div>

            <div class="col-md-4">
                <strong>Requester <span style="color: red">*</span></strong>
                <select id="Id_Admin_Info" name="Id_Admin_Info" class="form-control">
                    <option value="">Choose Requester</option>
                </select>
            </div>
        </div>

        <div class="row" style="padding-top: 5px">
            <div class="col-md-4">
                <strong>Region<span style="color: red">*</span></strong>
                <input type="text" id="Area" name="Area" class="form-control" />
            </div>

            <div class="col-md-4">
                <strong>Event_Time<span style="color: red">*</span></strong>
                <label class="input-group date">
                    <input class="form-control date" id="Event_Time" name="Event_Time" placeholder="dd/mm/yyyy" />
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </label>
            </div>

            <div class="col-md-4">
                <strong>Request_Date<span style="color: red">*</span></strong>
                <label class="input-group date">
                    <input class="form-control date" id="Request_Date" name="Request_Date" placeholder="dd/mm/yyyy" />
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </label>
            </div>
        </div>

        <div class="row" style="padding-top: 5px">
            <strong>Description</strong>
            <textarea class="form-control" id="Description" name="Description" rows="3"></textarea>
        </div>

        <div class="row" style="padding-top: 5px">
            <strong>Note</strong>
            <textarea class="form-control" id="Note" name="Note" rows="3"></textarea>
        </div>
        <br />
        <div class="row" style="padding-top: 5px">
            <div class="col-md-4">
            <strong>HCP Info <span style="color: red">(*)</span></strong>
            <select id="HCP_Code-" name="HCP_Code" class="form-control" required="required">
            <option value="">Choose HCP</option>
            </select>
            </div>
            <div class="col-md-4">
                <strong>Number_Contract <span style="color: red">(*)</span></strong>
                <input type="text" id="Number_Contract-" name="Number_Contract" class="form-control" required="required" />
            </div>
            <div class="col-md-4">
                <strong>Value_Contract <span style="color: red">(*)</span></strong>
                <input type="number" id="Value_Contract-" name="Value_Contract" min="1" class="form-control" required="required" />
            </div>
         </div>
        <div class="row" style="padding-top: 5px">
            <div class="col-md-4">
                <strong>From Date</strong>
               <label class="input-group date">
                <input class="form-control date" id="FromDate-" name="FromDate" placeholder="dd/mm/yyyy" />
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                </span>
            </label>
            </div>
            <div class ="col-md-4">
                <strong>To Date</strong>
               <label class="input-group date">
                <input class="form-control date" id="ToDate-" name="ToDate" placeholder="dd/mm/yyyy" />
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                </span>
                </label>
            </div>
            <div class ="col-md-4">
                <strong>PPL Get Contract Date</strong>
                <label class="input-group date">
                <input class="form-control date" id="PPL_GetContract_Date-" name="PPL_GetContract_Date" placeholder="dd/mm/yyyy" />
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                </span>
               </label>
             </div>
        </div>
        <div class="row" style="padding-top: 5px">
            <div class="col-md-6">
                <strong>Rep_Name <span style="color: red">(*)</span></strong>
                <input type="text" id="Rep_Name-" name="Rep_Name" class="form-control" required="required" />
            </div>
            <div class="col-md-6">
                <strong>Sup_Name <span style="color: red">(*)</span></strong>
                <input type="text" id="Sup_Name-" name="Sup_Name" class="form-control" required="required" />
            </div>
        </div>
        <div class="row" style="padding-top: 5px">
            <div class="col-md-6">
               <strong>Description</strong>
               <textarea class="form-control" id="Description-" name="Description" rows="3"></textarea></div>
              <div class="col-md-6">
                <strong>Invoice Abbott<span style="color: red">(*)</span></strong>
                 <%--<select id="Invoice_Abbott" name="Invoice_Abbott" class="form-control">
                     <option value="0" selected>0</option>
                     <option value="1" selected>1</option>
                </select>--%>
                <input type="number" id="Invoice_Abbott-" name="Invoice_Abbott" class="form-control" required="required" />
            </div>
            
        </div>
        <div class="row" style="padding-top: 5px">
            <div class="col-md-4">
                <strong>Payment Value <span style="color: red">(*)</span></strong>
                <input type="text" id="Payment_Value-" name="Payment_Value" class="form-control" required="required" />
            </div>
            <div class="col-md-4">
                <strong>PPL Payment Date <span style="color: red">(*)</span></strong>
               <label class="input-group date">
                <input class="form-control date" id="PPL_Payment_Date-" name="PPL_Payment_Date" placeholder="dd/mm/yyyy" />
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                </span>
            </label>
            </div>   
            <div class="col-md-4">
                <strong>Report Abbott Date <span style="color: red">(*)</span></strong>
               <label class="input-group date">
                <input class="form-control date" id="Report_Abbott_Date-" name="Report_Abbott_Date" placeholder="dd/mm/yyyy" />
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                </span>
            </label>
            </div>
         </div>
         <div class="row" style="padding-top: 5px">
        <div class="col-md-4">
                <a href="/Index/HCP_CreateView" style="margin-top:18px" class="btn btn-sm btn-info" data-backdrop="static" data-toggle="modal" data-target="#mysmal"><i class="fa fa-plus" aria-hidden="true"></i> ADD HCP INFO</a>
            </div> 
       </div>
        <%--<div class="row" style="padding-top: 5px">
            <a href="Javascript:;" class="btn btn-sm btn-success" onclick="Add_History_Payment();"><i class="fa fa-plus" aria-hidden="true"></i>Add</a>
        </div>--%>
        <%--<div class="row" style="padding-top: 5px">
            <div class="col-md-3">
                <strong>Nhập tổng tiền thù lao cho HCP</strong>
                <input type="number" id="Honorrarium_fee" name="Honorrarium_fee" min="0" step="0.01" data-number-to-fixed="0" data-number-stepfactor="100" class="form-control" required="required" />
            </div>
        </div>--%>

        <div id="append">
        </div>
        <div class="row table-bordered" style="margin-top: 10px;" id="load_table_service_costs">
        </div>
        <input type="hidden" class="form-control" name="CreateUser" value="<%=Session["user"].ToString() %>" />
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-primary" onclick="Add_New_Event_Info();"><i class="fa fa-check" aria-hidden="true"></i>Confirm</button>
        |
        <a href="#" class="btn btn-sm btn-danger" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i>Close</a>
    </div>
</form>

<script type="text/javascript">
    var table = null, at_val, ticketJSON = {}, feeJSON = {}, mealJSON = {}, hotelJSON = {}, carJSON = {}, otherJSON = {};
    function formatPera(num) {
        var p = num.toFixed(2).split(".");
        return p[0].split("").reverse().reduce(function (acc, num, i, orig) {
            return num + (i && !(i % 3) ? "," : "") + acc;
        }, "");
    }
    //khoi tao ban dau = 0
                    feeJSON[0] = null;
                    feeJSON[1] = { fee: 0 };
                    feeJSON[2] = { fee: 0 };
                    feeJSON[3] = { fee: 0 };
                    feeJSON[4] = { fee: 0 };
                    feeJSON[5] = { fee: 0 };
                    feeJSON[6] = { fee: 0 };
                    feeJSON[7] = { fee: 0 };
                    feeJSON[8] = { fee: 0 };

                    ticketJSON[0] = null;
                    ticketJSON[1] = { tickets: 0 };
                    ticketJSON[2] = { tickets: 0 };
                    ticketJSON[3] = { tickets: 0 };
                    ticketJSON[4] = { tickets: 0 };
                    ticketJSON[5] = { tickets: 0 };
                    ticketJSON[6] = { tickets: 0 };
                    ticketJSON[7] = { tickets: 0 };
                    ticketJSON[8] = { tickets: 0 };

                    mealJSON[0] = null;
                    mealJSON[1] = { meals: 0 };
                    mealJSON[2] = { meals: 0 };
                    mealJSON[3] = { meals: 0 };
                    mealJSON[4] = { meals: 0 };
                    mealJSON[5] = { meals: 0 };
                    mealJSON[6] = { meals: 0 };
                    mealJSON[7] = { meals: 0 };
                    mealJSON[8] = { meals: 0 };                

                    hotelJSON[0] = null;
                    hotelJSON[1] = { hotels: 0 };
                    hotelJSON[2] = { hotels: 0 };
                    hotelJSON[3] = { hotels: 0 };
                    hotelJSON[4] = { hotels: 0 };
                    hotelJSON[5] = { hotels: 0 };
                    hotelJSON[6] = { hotels: 0 };
                    hotelJSON[7] = { hotels: 0 };
                    hotelJSON[8] = { hotels: 0 };

                    carJSON[0] = null;
                    carJSON[1] = { cars: 0 };
                    carJSON[2] = { cars: 0 };
                    carJSON[3] = { cars: 0 };
                    carJSON[4] = { cars: 0 };
                    carJSON[5] = { cars: 0 };
                    carJSON[6] = { cars: 0 };
                    carJSON[7] = { cars: 0 };
                    carJSON[8] = { cars: 0 };

                    otherJSON[0] = null;
                    otherJSON[1] = { others: 0 };
                    otherJSON[2] = { others: 0 };
                    otherJSON[3] = { others: 0 };
                    otherJSON[4] = { others: 0 };
                    otherJSON[5] = { others: 0 };
                    otherJSON[6] = { others: 0 };
                    otherJSON[7] = { others: 0 };
                    otherJSON[8] = { others: 0 };

    $(function () {
        $('#load_table_service_costs').load("/Index/Costs_TableView", function () {
            //tien thu lao
            hn_val = $('#honorarium_fee').val();
            if (+hn_val === 0) {
                $('#honorarium_fee').mouseover(function () {
                    $(this).val("");
                });
                $('#honorarium_fee').mouseout(function () {
                    $(this).val(0);
                });
            }
            $('#honorarium_fee').on('keyup', function (event) {
                var vl = $(this).val() + '';
                var _vl = +vl.replace(/,/g, '');
                if (isNaN(_vl)) {
                    alert('Vui lòng nhập số không nhập chữ! Cảm ơn !!!');
                    $(this).val(null);
                } else {
                    // When user select text in the document, also abort.
                        var selection = window.getSelection().toString();
                        if (selection !== '') {
                            return;
                        }

                        // When the arrow keys are pressed, abort.
                        if ($.inArray(event.keyCode, [38, 40, 37, 39]) !== -1) {
                            return;
                        }


                        var $this = $(this);

                        // Get the value.
                        var input = $this.val();

                        var input = input.replace(/[\D\s\._\-]+/g, "");
                        input = input ? parseInt(input, 10) : 0;

                        $this.val(function () {
                            return (input === 0) ? "" : input.toLocaleString("en-US");
                    });
                    var v = $(this).val() + '';
                    var v_ = +v.replace(/,/g, '');
                    $(this).attr('data-number', v_);
                }
                $(this).unbind('mouseover').unbind('mouseout');
            });
            var a = 0;
            $('#honorarium_fee').keypress(function (event) {
                var keycode = (event.keyCode ? event.keyCode : event.which);
                if (keycode == '13') {
                    $('.hn_5').attr('data-number', 15000);
                    var fee = +$(this).attr('data-number'); // so nhap tu input
                    var vat = 1 - ($('.rn_2').val() / 100);
                    //tinh toan cot
                    feeJSON[0] = null;
                    feeJSON[1] = { fee: Math.round(fee / vat) / 1 };
                    feeJSON[2] = { fee: Math.round((feeJSON[1].fee * $('.rn_2').val() / 100) * 1) / 1 };
                    feeJSON[3] = { fee: fee };
                    feeJSON[4] = { fee: Math.round((feeJSON[1].fee * $('.rn_4').val() / 100) * 1) / 1 };
                    feeJSON[5] = { fee: +$('.hn_5').attr('data-number') };
                    feeJSON[6] = { fee: feeJSON[1].fee + feeJSON[4].fee + feeJSON[5].fee };
                    feeJSON[7] = { fee: Math.round((feeJSON[6].fee * $('.rn_7').val() / 100) * 1) / 1 };
                    feeJSON[8] = { fee: feeJSON[6].fee + feeJSON[7].fee };
                    //
                    for (var i = 1; i <= 8; i++) {
                        var render_value = formatPera(feeJSON[i].fee);
                        $('.hn_' + i).attr('data-number',feeJSON[i].fee);
                        $('.hn_' + i).val(render_value);
                    }
                    //tinh toan hang
                    //tong = --fee cua hang do-- + other
                    for (var i = 1; i <= 7; i++) {
                        var total = Math.round((ticketJSON[i].tickets + feeJSON[i].fee + mealJSON[i].meals + hotelJSON[i].hotels + carJSON[i].cars + otherJSON[i].others) * 1)/ 1;
                        var t_ = formatPera(total);
                        $('#total_row_' + i).text(t_);
                    }
                    
                    var _t8 = Math.round((ticketJSON[8].tickets + feeJSON[8].fee + mealJSON[8].meals + hotelJSON[8].hotels + carJSON[8].cars + otherJSON[8].others) * 1) / 1;
                    $('#total_col_8').text(formatPera(_t8));
                    var table = $('#table_service_costs').DataTable();

                    table.draw();
                    //
                }
            });
            //mức
            //rn_val = $('#rate_name').val();

            //$('#rate_name_2').keypress(function (event) {
            //    var keycode = (event.keyCode ? event.keyCode : event.which);
            //    if (keycode == '13') {
            //        var ratename2 = +$(this).val();

            //        rateJSON[2] = { ratenames: ratename2 };
            //        //for (var i = 1; i <= 8; i++) {
            //        //        $('.rn_' + i).val(rateJSON[i].ratenames);
            //        //}
            //        var i = 2;
            //        $('.rn_' + i).val(rateJSON[i].ratenames);
            //        for (var i = 1; i <= 8; i++) {
            //            var total = feeJSON[i].fee + ticketJSON[i].tickets + mealJSON[i].meals + hotelJSON[i].hotels + carJSON[i].cars + otherJSON[i].others;
            //            var _t = Math.round((total) * 1) / 1;
            //            $('#total_row_' + i).text(formatPera(_t));
            //        }
            //        var _t8 = Math.round((ticketJSON[8].tickets + feeJSON[8].fee + mealJSON[8].meals + hotelJSON[8].hotels + carJSON[8].cars + otherJSON[8].others) * 1) / 1;
            //        $('#total_col_8').text(formatPera(_t8));
            //        var table = $('#table_service_costs').DataTable();

            //        table.draw();
            //    }
            //});
            //$('#rate_name_4').keypress(function (event) {
            //    var keycode = (event.keyCode ? event.keyCode : event.which);
            //    if (keycode == '13') {
            //        var ratename4 = +$(this).val();

            //        rateJSON[4] = { ratenames: ratename4 };
            //        //for (var i = 1; i <= 8; i++) {
            //        //        $('.rn_' + i).val(rateJSON[i].ratenames);
            //        //}
            //        var i = 4;
            //        $('.rn_' + i).val(rateJSON[i].ratenames);
            //        for (var i = 1; i <= 8; i++) {
            //            var total = feeJSON[i].fee + ticketJSON[i].tickets + mealJSON[i].meals + hotelJSON[i].hotels + carJSON[i].cars + otherJSON[i].others;
            //            var _t = Math.round((total) * 1) / 1;
            //            $('#total_row_' + i).text(formatPera(_t));
            //        }
            //        var _t8 = Math.round((ticketJSON[8].tickets + feeJSON[8].fee + mealJSON[8].meals + hotelJSON[8].hotels + carJSON[8].cars + otherJSON[8].others) * 1) / 1;
            //        $('#total_col_8').text(formatPera(_t8));
            //        var table = $('#table_service_costs').DataTable();

            //        table.draw();
            //    }
            //});
            //$('#rate_name_7').keypress(function (event) {
            //    var keycode = (event.keyCode ? event.keyCode : event.which);
            //    if (keycode == '13') {
            //        var ratename7 = +$(this).val();

            //        rateJSON[7] = { ratenames: ratename7 };
            //        //for (var i = 1; i <= 8; i++) {
            //        //        $('.rn_' + i).val(rateJSON[i].ratenames);
            //        //}
            //        var i = 7;
            //        $('.rn_' + i).val(rateJSON[i].ratenames);
            //        for (var i = 1; i <= 8; i++) {
            //            var total = feeJSON[i].fee + ticketJSON[i].tickets + mealJSON[i].meals + hotelJSON[i].hotels + carJSON[i].cars + otherJSON[i].others;
            //            var _t = Math.round((total) * 1) / 1;
            //            $('#total_row_' + i).text(formatPera(_t));
            //        }
            //        var _t8 = Math.round((ticketJSON[8].tickets + feeJSON[8].fee + mealJSON[8].meals + hotelJSON[8].hotels + carJSON[8].cars + otherJSON[8].others) * 1) / 1;
            //        $('#total_col_8').text(formatPera(_t8));
            //        var table = $('#table_service_costs').DataTable();

            //        table.draw();
            //    }
            //});

            // vé máy bay
            at_val = $('#air_ticket').val();

            if (+at_val === 0) {
                $('#air_ticket').mouseover(function () {
                    $(this).val("");
                });
                $('#air_ticket').mouseout(function () {
                    $(this).val(0);
                });
            }
            $('#air_ticket').on('keyup', function () {
                var vl = $(this).val() + '';
                var _vl = +vl.replace(/,/g, '');
                if (isNaN(_vl)) {
                    alert('Vui lòng nhập số không nhập chữ! Cảm ơn !!!');
                    $(this).val(null);
                } else {
                    // When user select text in the document, also abort.
                        var selection = window.getSelection().toString();
                        if (selection !== '') {
                            return;
                        }

                        // When the arrow keys are pressed, abort.
                        if ($.inArray(event.keyCode, [38, 40, 37, 39]) !== -1) {
                            return;
                        }


                        var $this = $(this);

                        // Get the value.
                        var input = $this.val();

                        var input = input.replace(/[\D\s\._\-]+/g, "");
                        input = input ? parseInt(input, 10) : 0;

                        $this.val(function () {
                            return (input === 0) ? "" : input.toLocaleString("en-US");
                    });
                    var v = $(this).val() + '';
                    var v_ = +v.replace(/,/g, '');
                    $(this).attr('data-number', v_);
                }
                $(this).unbind('mouseover').unbind('mouseout');
            });
            $('#air_ticket').keypress(function (event) {
                var keycode = (event.keyCode ? event.keyCode : event.which);
                if (keycode == '13') {
                    $('.at_5').attr('data-number', 15000);
                    var ticket = +$(this).attr('data-number'); // so nhap tu input
                    var vat = 1 - ($('.rn_2').val() / 100);
                    //tinh toan cot
                    ticketJSON[0] = null;
                    ticketJSON[1] = { tickets: Math.round(ticket / vat) / 1 };
                    ticketJSON[2] = { tickets: Math.round((ticketJSON[1].tickets * $('.rn_2').val() / 100) * 1) / 1 };
                    ticketJSON[3] = { tickets: ticket };
                    ticketJSON[4] = { tickets: Math.round((ticketJSON[1].tickets * $('.rn_4').val() / 100) * 1) / 1 };
                    ticketJSON[5] = { tickets: +$('.at_5').attr('data-number') };
                    ticketJSON[6] = { tickets: ticketJSON[1].tickets + ticketJSON[4].tickets + ticketJSON[5].tickets };
                    ticketJSON[7] = { tickets: Math.round((ticketJSON[6].tickets * $('.rn_7').val() / 100) * 1) / 1 };
                    ticketJSON[8] = { tickets: ticketJSON[6].tickets + ticketJSON[7].tickets };

                    for (var i = 1; i <= 8; i++) {
                        var render_value = formatPera(ticketJSON[i].tickets);
                        $('.at_' + i).val(render_value);
                    }
                    for (var i = 1; i <= 7; i++) {
                        var total = ticketJSON[i].tickets + feeJSON[i].fee + mealJSON[i].meals + hotelJSON[i].hotels + carJSON[i].cars + otherJSON[i].others;
                        var tt_1 = Math.round((total) * 1) / 1;
                        $('#total_row_' + i).text(formatPera(tt_1));
                    }
                    var _tc1 = Math.round((ticketJSON[8].tickets + feeJSON[8].fee + mealJSON[8].meals + hotelJSON[8].hotels + carJSON[8].cars + otherJSON[8].others) * 1) / 1;
                    $('#total_col_8').text(formatPera(_tc1));
                    var table = $('#table_service_costs').DataTable();
                    table.draw();
                }
            });

            // ăn uống 
            mf_val = $('#meal_fee').val();
            if (+mf_val === 0) {
                $('#meal_fee').mouseover(function () {
                    $(this).val("");
                });
                $('#meal_fee').mouseout(function () {
                    $(this).val(0);
                });
            }
            $('#meal_fee').on('keyup', function () {
                
                var vl = $(this).val() + '';
                var _vl = +vl.replace(/,/g, '');
                if (isNaN(_vl)) {
                    alert('Vui lòng nhập số không nhập chữ! Cảm ơn !!!');
                    $(this).val(null);
                } else {
                    // When user select text in the document, also abort.
                        var selection = window.getSelection().toString();
                        if (selection !== '') {
                            return;
                        }

                        // When the arrow keys are pressed, abort.
                        if ($.inArray(event.keyCode, [38, 40, 37, 39]) !== -1) {
                            return;
                        }


                        var $this = $(this);

                        // Get the value.
                        var input = $this.val();

                        var input = input.replace(/[\D\s\._\-]+/g, "");
                        input = input ? parseInt(input, 10) : 0;

                        $this.val(function () {
                            return (input === 0) ? "" : input.toLocaleString("en-US");
                    });
                    var v = $(this).val() + '';
                    var v_ = +v.replace(/,/g, '');
                    $(this).attr('data-number', v_);
                }
                $(this).unbind('mouseover').unbind('mouseout');
            });
            $('#meal_fee').keypress(function (event) {
                var keycode = (event.keyCode ? event.keyCode : event.which);
                if (keycode == '13') {
                    $('.mf_5').attr('data-number', 15000);
                    var meal = +$(this).attr('data-number'); // so nhap tu input
                    var vat = 1 - ($('.rn_2').val() / 100);
                    //tinh toan cot
                    mealJSON[0] = null;
                    mealJSON[1] = { meals: Math.round(meal / vat) / 1 };
                    mealJSON[2] = { meals: Math.round((mealJSON[1].meals * $('.rn_2').val() / 100) * 1) / 1 };
                    mealJSON[3] = { meals: meal };
                    mealJSON[4] = { meals: Math.round((mealJSON[1].meals * $('.rn_4').val() / 100) * 1) / 1 };
                    mealJSON[5] = { meals: +$('.mf_5').attr('data-number') };
                    mealJSON[6] = { meals: mealJSON[1].meals + mealJSON[4].meals + mealJSON[5].meals };
                    mealJSON[7] = { meals: Math.round((mealJSON[6].meals * $('.rn_7').val() / 100) * 1) / 1 };
                    mealJSON[8] = { meals: mealJSON[6].meals + mealJSON[7].meals };

                    for (var i = 1; i <= 8; i++) {
                        var render_value = formatPera(mealJSON[i].meals);
                        $('.mf_' + i).val(render_value);
                    }
                    for (var i = 1; i <= 7; i++) {
                        var total = ticketJSON[i].tickets + feeJSON[i].fee + mealJSON[i].meals + hotelJSON[i].hotels + carJSON[i].cars + otherJSON[i].others;
                        var tt_1 = Math.round((total) * 1) / 1;
                        $('#total_row_' + i).text(formatPera(tt_1));
                    }
                    var _tc1 = Math.round((ticketJSON[8].tickets + feeJSON[8].fee + mealJSON[8].meals + hotelJSON[8].hotels + carJSON[8].cars + otherJSON[8].others) * 1) / 1;
                    $('#total_col_8').text(formatPera(_tc1));
                    var table = $('#table_service_costs').DataTable();
                    table.draw();
                }
            });

            // khách sạn
            hf_val = $('#hotel_fee').val();
            if (+hf_val === 0) {
                $('#hotel_fee').mouseover(function () {
                    $(this).val("");
                });
                $('#hotel_fee').mouseout(function () {
                    $(this).val(0);
                });
            }
            $('#hotel_fee').on('keyup', function () {
                var vl = $(this).val() + '';
                var _vl = +vl.replace(/,/g, '');
                if (isNaN(_vl)) {
                    alert('Vui lòng nhập số không nhập chữ! Cảm ơn !!!');
                    $(this).val(null);
                } else {
                    // When user select text in the document, also abort.
                        var selection = window.getSelection().toString();
                        if (selection !== '') {
                            return;
                        }

                        // When the arrow keys are pressed, abort.
                        if ($.inArray(event.keyCode, [38, 40, 37, 39]) !== -1) {
                            return;
                        }


                        var $this = $(this);

                        // Get the value.
                        var input = $this.val();

                        var input = input.replace(/[\D\s\._\-]+/g, "");
                        input = input ? parseInt(input, 10) : 0;

                        $this.val(function () {
                            return (input === 0) ? "" : input.toLocaleString("en-US");
                    });
                    var v = $(this).val() + '';
                    var v_ = +v.replace(/,/g, '');
                    $(this).attr('data-number', v_);
                }
                $(this).unbind('mouseover').unbind('mouseout');
            });
            $('#hotel_fee').keypress(function (event) {
                var keycode = (event.keyCode ? event.keyCode : event.which);
                if (keycode == '13') {
                    $('.hf_5').attr('data-number', 15000);
                    var hotel = +$(this).attr('data-number'); // so nhap tu input
                    var vat = 1 - ($('.rn_2').val() / 100);
                    //tinh toan cot
                    hotelJSON[0] = null;
                    hotelJSON[1] = { hotels: Math.round(hotel / vat) / 1 };
                    hotelJSON[2] = { hotels: Math.round((hotelJSON[1].hotels * $('.rn_2').val() / 100) * 1) / 1 };
                    hotelJSON[3] = { hotels: hotel };
                    hotelJSON[4] = { hotels: Math.round((hotelJSON[1].hotels * $('.rn_4').val() / 100) * 1) / 1 };
                    hotelJSON[5] = { hotels: +$('.hf_5').attr('data-number') };
                    hotelJSON[6] = { hotels: hotelJSON[1].hotels + hotelJSON[4].hotels + hotelJSON[5].hotels };
                    hotelJSON[7] = { hotels: Math.round((hotelJSON[6].hotels * $('.rn_7').val() / 100) * 1) / 1 };
                    hotelJSON[8] = { hotels: hotelJSON[6].hotels + hotelJSON[7].hotels };

                    for (var i = 1; i <= 8; i++) {
                        var render_value = formatPera(hotelJSON[i].hotels);
                        $('.hf_' + i).val(render_value);
                    }
                    for (var i = 1; i <= 7; i++) {
                        var total = ticketJSON[i].tickets + feeJSON[i].fee + mealJSON[i].meals + hotelJSON[i].hotels + carJSON[i].cars + otherJSON[i].others;
                        var tt_1 = Math.round((total) * 1) / 1;
                        $('#total_row_' + i).text(formatPera(tt_1));
                    }
                    var _tc1 = Math.round((ticketJSON[8].tickets + feeJSON[8].fee + mealJSON[8].meals + hotelJSON[8].hotels + carJSON[8].cars + otherJSON[8].others) * 1) / 1;
                    $('#total_col_8').text(formatPera(_tc1));
                    var table = $('#table_service_costs').DataTable();
                    table.draw();
                }
            });

            // thuê xe
            cr_val = $('#car_rental').val();
            if (+cr_val === 0) {
                $('#car_rental').mouseover(function () {
                    $(this).val("");
                });
                $('#car_rental').mouseout(function () {
                    $(this).val(0);
                });
            }
            $('#car_rental').on('keyup', function () {
                var vl = $(this).val() + '';
                var _vl = +vl.replace(/,/g, '');
                if (isNaN(_vl)) {
                    alert('Vui lòng nhập số không nhập chữ! Cảm ơn !!!');
                    $(this).val(null);
                } else {
                    // When user select text in the document, also abort.
                        var selection = window.getSelection().toString();
                        if (selection !== '') {
                            return;
                        }

                        // When the arrow keys are pressed, abort.
                        if ($.inArray(event.keyCode, [38, 40, 37, 39]) !== -1) {
                            return;
                        }


                        var $this = $(this);

                        // Get the value.
                        var input = $this.val();

                        var input = input.replace(/[\D\s\._\-]+/g, "");
                        input = input ? parseInt(input, 10) : 0;

                        $this.val(function () {
                            return (input === 0) ? "" : input.toLocaleString("en-US");
                    });
                    var v = $(this).val() + '';
                    var v_ = +v.replace(/,/g, '');
                    $(this).attr('data-number', v_);
                }
                $(this).unbind('mouseover').unbind('mouseout');
            });
            $('#car_rental').keypress(function (event) {
                var keycode = (event.keyCode ? event.keyCode : event.which);
                if (keycode == '13') {
                    $('.cr_5').attr('data-number', 15000);
                    var car = +$(this).attr('data-number'); // so nhap tu input
                    var vat = 1 - ($('.rn_2').val() / 100);
                    //tinh toan cot
                    carJSON[0] = null;
                    carJSON[1] = { cars: Math.round(car / vat) / 1 };
                    carJSON[2] = { cars: Math.round((carJSON[1].cars * $('.rn_2').val() / 100) * 1) / 1 };
                    carJSON[3] = { cars: car };
                    carJSON[4] = { cars: Math.round((carJSON[1].cars * $('.rn_4').val() / 100) * 1) / 1 };
                    carJSON[5] = { cars: +$('.cr_5').attr('data-number') };
                    carJSON[6] = { cars: carJSON[1].cars + carJSON[4].cars + carJSON[5].cars };
                    carJSON[7] = { cars: Math.round((carJSON[6].cars * $('.rn_7').val() / 100) * 1) / 1 };
                    carJSON[8] = { cars: carJSON[6].cars + carJSON[7].cars };

                    for (var i = 1; i <= 8; i++) {
                        var render_value = formatPera(carJSON[i].cars);
                        $('.cr_' + i).val(render_value);
                    }

                    for (var i = 1; i <= 7; i++) {
                        var total = ticketJSON[i].tickets + feeJSON[i].fee + mealJSON[i].meals + hotelJSON[i].hotels + carJSON[i].cars + otherJSON[i].others;
                        var tt_1 = Math.round((total) * 1) / 1;
                        $('#total_row_' + i).text(formatPera(tt_1));
                    }
                    var _tc1 = Math.round((ticketJSON[8].tickets + feeJSON[8].fee + mealJSON[8].meals + hotelJSON[8].hotels + carJSON[8].cars + otherJSON[8].others) * 1) / 1;
                    $('#total_col_8').text(formatPera(_tc1));
                    var table = $('#table_service_costs').DataTable();
                    table.draw();
                }
            });

            // chi phí khác
            of_val = $('#other_fees').val();
            if (+of_val === 0) {
                $('#other_fees').mouseover(function () {
                    $(this).val("");
                });
                $('#other_fees').mouseout(function () {
                    $(this).val(0);
                });
            }
            $('#other_fees').on('keyup', function () {
                var vl = $(this).val() + '';
                var _vl = +vl.replace(/,/g, '');
                if (isNaN(_vl)) {
                    alert('Vui lòng nhập số không nhập chữ! Cảm ơn !!!');
                    $(this).val(null);
                } else {
                    // When user select text in the document, also abort.
                        var selection = window.getSelection().toString();
                        if (selection !== '') {
                            return;
                        }

                        // When the arrow keys are pressed, abort.
                        if ($.inArray(event.keyCode, [38, 40, 37, 39]) !== -1) {
                            return;
                        }


                        var $this = $(this);

                        // Get the value.
                        var input = $this.val();

                        var input = input.replace(/[\D\s\._\-]+/g, "");
                        input = input ? parseInt(input, 10) : 0;

                        $this.val(function () {
                            return (input === 0) ? "" : input.toLocaleString("en-US");
                    });
                    var v = $(this).val() + '';
                    var v_ = +v.replace(/,/g, '');
                    $(this).attr('data-number', v_);
                }
                $(this).unbind('mouseover').unbind('mouseout');
            });
            $('#other_fees').keypress(function (event) {
                var keycode = (event.keyCode ? event.keyCode : event.which);
                if (keycode == '13') {
                    $('.of_5').attr('data-number', 15000);
                    var other = +$(this).attr('data-number'); // so nhap tu input
                    var vat = 1 - ($('.rn_2').val() / 100);
                    //tinh toan cot
                    otherJSON[0] = null;
                    otherJSON[1] = { others: Math.round(other / vat ) / 1 };
                    otherJSON[2] = { others: Math.round((otherJSON[1].others * $('.rn_2').val() / 100) * 1) / 1 };
                    otherJSON[3] = { others: other };
                    otherJSON[4] = { others: Math.round((otherJSON[1].others * $('.rn_4').val() / 100) * 1) / 1 };
                    otherJSON[5] = { others: +$('.of_5').attr('data-number') };
                    otherJSON[6] = { others: otherJSON[1].others + otherJSON[4].others + otherJSON[5].others };
                    otherJSON[7] = { others: Math.round((otherJSON[6].others * $('.rn_7').val() / 100) * 1) / 1 };
                    otherJSON[8] = { others: otherJSON[6].others + otherJSON[7].others };

                    for (var i = 1; i <= 8; i++) {
                        var render_value = formatPera(otherJSON[i].others);
                        $('.of_' + i).val(render_value);
                    }
                    for (var i = 1; i <= 7; i++) {
                        var total = ticketJSON[i].tickets + feeJSON[i].fee + mealJSON[i].meals + hotelJSON[i].hotels + carJSON[i].cars + otherJSON[i].others;
                        var tt_1 = Math.round((total) * 1) / 1;
                        $('#total_row_' + i).text(formatPera(tt_1));
                    }
                    var _tc1 = Math.round((ticketJSON[8].tickets + feeJSON[8].fee + mealJSON[8].meals + hotelJSON[8].hotels + carJSON[8].cars + otherJSON[8].others) * 1) / 1;
                    $('#total_col_8').text(formatPera(_tc1));
                    var table = $('#table_service_costs').DataTable();
                    table.draw();
                }
            });
        });

    });
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
        }
    });
    $("#HCP_Code-").select2({
            width: '100%',
            placeholder: 'Chọn Account'
        });

        $.ajax({
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            type: 'POST',
            url: "/Index/Select_List_HCP_Info",
            success: function (res) {
                $("#HCP_Code-").empty();
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
                $("#HCP_Code-").html(res.join(""));
            }
        });

    //var num = 0;
    //function Add_History_Payment() {
    //    num++;
    //    $("#append").append('<div id="append-' + num + '"> <div class="row" >' +
    //        ' <hr />' +
    //        '<div class="col-md-4">' +
    //        '<strong>HCP Info <span style="color: red">(*)</span></strong>' +
    //        '<select id="HCP_Code-' + num + '" name="HCP_Code" class="form-control" required="required">' +
    //        '<option value="">Choose HCP</option>' +
    //        '</select>' +
    //        '</div>' +
    //        '<div class="col-md-4">' +
    //        ' <strong>Number_Contract <span style="color: red">(*)</span></strong>' +
    //        ' <input type="text" id="Number_Contract-' + num + '" name="Number_Contract" class="form-control" required="required" />' +
    //        ' </div>' +
    //        '<div class="col-md-4">' +
    //        ' <strong>Value_Contract <span style="color: red">(*)</span></strong>' +
    //        '<input type="number" id="Value_Contract-' + num + '" name="Value_Contract" min="1" class="form-control" required="required" />' +
    //        '</div>' +
    //        '</div>' +
    //        '<div class="row" >' +
    //        ' <div class="col-md-4">' +
    //        ' <strong>From Date</strong>' +
    //        '  <label class="input-group date">' +
    //        ' <input class="form-control date" id="FromDate-' + num + '" name="FromDate" placeholder="dd/mm/yyyy" />' +
    //        ' <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>' +
    //        ' </span>' +
    //        ' </label>' +
    //        ' </div>' +
    //        ' <div class="col-md-4">' +
    //        ' <strong>To Date</strong>' +
    //        ' <label class="input-group date">' +
    //        '  <input class="form-control date" id="ToDate-' + num + '" name="ToDate" placeholder="dd/mm/yyyy" />' +
    //        ' <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>' +
    //        '  </span>' +
    //        '</label>' +
    //        ' </div>' +
    //        ' <div class="col-md-4">' +
    //        ' <strong>PPL Get Contract Date</strong>' +
    //        '<label class="input-group date">' +
    //        ' <input class="form-control date" id="PPL_GetContract_Date-' + num + '" name="PPL_GetContract_Date" placeholder="dd/mm/yyyy" />' +
    //        '  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>' +
    //        ' </span>' +
    //        '</label>' +
    //        ' </div>' +
    //        '  </div>' +
    //        ' <div class="row" >' +
    //        '<div class="col-md-6">' +
    //        '<strong>Rep_Name <span style="color: red">(*)</span></strong>' +
    //        ' <input type="text" id="Rep_Name-' + num + '" name="Rep_Name" class="form-control" required="required" />' +
    //        ' </div>' +
    //        '<div class="col-md-6">' +
    //        ' <strong>Sup_Name <span style="color: red">(*)</span></strong>' +
    //        ' <input type="text" id="Sup_Name-' + num + '" name="Sup_Name" class="form-control" required="required" />' +
    //        ' </div>' +
    //        ' </div>' +
    //        '<div class="row"> <div class="col-md-6">' +
    //        '<strong>Description</strong>' +
    //        '<textarea class="form-control" id="Description-' + num + '" name="Description" rows="3"></textarea></div><div class="col-md-6">' +
    //        '<a href="/Index/HCP_CreateView" style="margin-top:18px" class="btn btn-sm btn-info" data-backdrop="static" data-toggle="modal" data-target="#mysmal"><i class="fa fa-plus" aria-hidden="true"></i> ADD HCP INFO</a>' +
    //        ' ' +
    //        '<a href="#" style="margin-top:18px" onclick="Remove_History_Payment(' + num + ');" class="btn btn-sm btn-danger"><i class="fa fa-times" aria-hidden="true"></i> Xóa</a></div></div>' +
    //        '</div></div>');

        
    //}

    //function Remove_History_Payment(num) {
    //    $("#append-" + num).remove();
    //}
    //function Add_HCP_Info(num) {
    //    $("#append-" + num).remove();
    //}


    function Add_New_Event_Info() {
        var total = [];
        for (var i = 1; i <= 7; i++) {
            total.push($('#total_row_' + i).text());
        }
        total.push($('#total_col_8').text());
        var form = convert_SerializeArray_to_JSON('form_add_new_event_info :input.form-control');
        //.replace('&table_service_costs_length=10', '');
        var formData = {
            "feeJSON": feeJSON,
            //"rateJSON": rateJSON,
            "ticketJSON": ticketJSON,
            "mealJSON": mealJSON,
            "hotelJSON": hotelJSON,
            "carJSON": carJSON,
            "otherJSON": otherJSON,
            'totalrow': total,
            'form': form
        };
        $.ajax({
            url: '/Index/Event_Add_Edit_Event_Info',
            data: { data: JSON.stringify(formData) },
            type: "POST",
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
                            $("#myModal .close").click();
                            reload_event_info_table();
                    //if (num > 0) {

                    //    //var array = [];
                    //    //for (var i = 1; i <= num; i++) {
                    //    //    var HCP_Code = $("#HCP_Code-" + i).val();
                    //    //    var Number_Contract = $("#Number_Contract-" + i).val();
                    //    //    var FromDate = $("#FromDate-" + i).val();
                    //    //    var ToDate = $("#ToDate-" + i).val();
                    //    //    var Value_Contract = $("#Value_Contract-" + i).val();
                    //    //    var PPL_GetContract_Date = $("#PPL_GetContract_Date-" + i).val();
                    //    //    var Rep_Name = $("#Rep_Name-" + i).val();
                    //    //    var Sup_Name = $("#Sup_Name-" + i).val();
                    //    //    var Description = $("#Description-" + i).val();

                    //    //    var obj = {
                    //    //        HCP_Code: HCP_Code,
                    //    //        Number_Contract: Number_Contract,
                    //    //        FromDate: FromDate,
                    //    //        ToDate: ToDate,
                    //    //        Value_Contract: Value_Contract,
                    //    //        PPL_GetContract_Date: PPL_GetContract_Date,
                    //    //        Rep_Name: Rep_Name,
                    //    //        Sup_Name: Sup_Name,
                    //    //        Description: Description
                    //    //    }
                    //    //    array.push(obj);

                    //        Lobibox.notify('success',
                    //            {
                    //                img: '/Contents/img/check_thanhcong.png',
                    //                sound: false,
                    //                position: 'bottom right',
                    //                delay: 2000,
                    //                showClass: 'fadeInDown',
                    //                title: 'Message Success ',
                    //                msg: data.msg
                    //            });
                    //        $("#myModal .close").click();
                    //        reload_event_info_table();
                    //    }

                        //array = JSON.stringify({ 'array': array });

                        //$.ajax({
                        //    url: '/Index/Event_Add_History_Payment',
                        //    contentType: 'application/json; charset=utf-8',
                        //    type: "POST",
                        //    dataType: "json",
                        //    data: array,
                        //    success: function (data) {
                        //        if (data.code == "0") {
                        //            Lobibox.notify('success',
                        //                {
                        //                    img: '/Contents/img/check_thanhcong.png',
                        //                    sound: false,
                        //                    position: 'bottom right',
                        //                    delay: 2000,
                        //                    showClass: 'fadeInDown',
                        //                    title: 'Message Success ',
                        //                    msg: data.msg
                        //                });
                        //            $("#myModal .close").click();
                        //            reload_event_info_table();
                        //        } else {
                        //            Lobibox.notify('error',
                        //                {
                        //                    img: '/Contents/img/check_warning.png',
                        //                    sound: false,
                        //                    position: 'bottom right',
                        //                    delay: 3000,
                        //                    showClass: 'fadeInDown',
                        //                    title: 'Message Error ',
                        //                    msg: data.msg
                        //                });
                        //        }

                        //    },
                        //    error: function () {
                        //        Lobibox.alert(
                        //            'error', // Any of the following
                        //            {
                        //                msg: 'Have Error In Processing , Please try again ! '
                        //            }
                        //        );
                        //    }
                        //}); 
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
