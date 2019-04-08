<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<div class="modal-header">
    <a class="close" data-dismiss="modal" id="close_pop">×</a>
    <h3>Event Info Detail</h3>
</div>

<div class="modal-body">
    <div class="nav-tabs-custom">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#history_payment_by_event" onclick="reload_history_payment_table();" data-toggle="tab">History Payment</a></li>
            <li><a href="#edit_event_info" onclick="reload_edit_event_info();" data-toggle="tab">Edit Event Info</a></li>
        </ul>
        <div class="tab-content no-padding">
            <div class="chart tab-pane active" id="history_payment_by_event" style="position: relative; min-height: 300px;">
                <div class="row" style="padding-top: 5px;" id="history_payment_by_event_table">
                </div>
            </div>

            <div class="chart tab-pane" id="edit_event_info" style="position: relative; min-height: 300px;">
                <div class="row" style="padding-top: 5px;" id="edit_event_info_view">
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal-footer">
    <button type="submit" id="submit_form" onclick="$('#form_edit_event_info').submit();" class="btn btn-sm btn-primary">Confirm</button>
    <a href="#" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
</div>

<script>
    $(document).ready(function () {
        reload_history_payment_table();
    });

    function reload_history_payment_table() {
        $("#submit_form").hide();
        $('#history_payment_by_event_table').load('/Index/History_Payment_By_Event_Table');
    }

    function reload_edit_event_info() {
        $('#submit_form').show();
        $('#edit_event_info_view').load('/Index/Edit_Event_Info');
    }
</script>