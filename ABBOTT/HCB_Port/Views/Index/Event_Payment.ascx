<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript">
    $(function () {
        setTimeout(function () {
            $("#request_month").datepicker({
                format: "mm-yyyy",
                viewMode: "months",
                minViewMode: "months"
            }).datepicker("setDate", new Date());
        }, 100);

        setTimeout(function () {
            $('#event_time')
                .datepicker({
                    format: 'dd/mm/yyyy'
                });
        }, 100);
        done_load();
    });
</script>
<section>
    <div id="ribbon" class="hidden-print">
        <a href="/Index" class="btn-ribbon" data-container="#main" data-toggle="tooltip" data-title="Show dashboard" data-original-title="" title=""><i class="fa fa-home"></i></a>
        <span class="vertical-devider">&nbsp;</span>
        <button onclick="reload_event_info_table();" class="btn-ribbon" data-container="#main" data-action="reload" data-toggle="tooltip" data-title="Reload" data-original-title="" title=""><i class="fa fa-refresh"></i></button>
        <ol class="breadcrumb">
            <li class="active"><i class="fa fa-area-chart menu-item-icon"></i>Event & Payment</li>
        </ol>
        <a href="Javascript:;" id="create_modal" class="btn-sm btn-info" data-backdrop="static" data-keyboard="false" data-toggle="modal" data-target="#mysmal"><i class="fa fa-plus" aria-hidden="true"></i> Create New</a>
        | 
        <a href="/Index/Event_Payment_Template_File" class="btn-sm btn-primary"><i class="fa fa-file-excel-o" aria-hidden="true"></i> Template Excel</a> 
        | 
        <a href="/Index/Import_Event_History_Payment" class="btn-sm btn-success" data-backdrop="static" data-toggle="modal" data-target="#mysmal"><i class="fa fa-upload" aria-hidden="true"></i> Import Excel</a>
        |
        <a href="/Index/Export_Event_History_Payment" class="btn-sm btn-warning" data-backdrop="static" data-toggle="modal" data-target="#mysmal"><i class="fa fa-plus-circle" aria-hidden="true"></i> Export Excel</a>
    </div>
    <div class="row">
        <div class="col-md-2">
            <strong>Month Request Event</strong>
            <label class="input-group date">
                <input type="text" class="form-control" placeholder="mm-yyyy" name="request_month" id="request_month" />
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                </span>
            </label>
        </div>
        <div class="col-md-2">
            <strong>Event Time</strong>
            <label class="input-group date">
                <input class="form-control" id="event_time" name="event_time" placeholder="dd/mm/yyyy" />
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                </span>
            </label>
        </div>
    </div>

    <div id="content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active" style="color:blue"><a href="#event_info" onclick="reload_event_info_table();" data-toggle="tab">Event Info</a></li>
                <li style="color:blue"><a href="#admin_info" onclick="reload_admin_info_table();" data-toggle="tab">Requester Info</a></li>
            </ul>
            <div class="tab-content no-padding">
                <div class="chart tab-pane active" id="event_info" style="position: relative; min-height: 300px;">
                    <div class="row" style="padding-top: 5px;" id="event_info_table">
                    </div>
                </div>

                <div class="chart tab-pane" id="admin_info" style="position: relative; min-height: 300px;">
                    <div class="row" style="padding-top: 5px;" id="admin_info_table">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    $(function() {
        reload_event_info_table();
    });

    function reload_event_info_table() {
        $("#create_modal").attr("href", "/Index/Create_New_Event_Info");
        $("#create_modal").attr("data-target", "#myModal");
        waitting_load();
        setTimeout(function() {
                var requestTime = $("#request_month").val();
                var eventTime = $("#event_time").val();
                $("#event_info_table")
                    .load("/Index/Event_Info_Table?requestTime=" + requestTime + "&eventTime=" + eventTime);
            },
            200);
        done_load();
    }

    function reload_admin_info_table() {
        $("#create_modal").attr("href", "/Index/Create_New_Admin_Info");
        $("#create_modal").attr("data-target", "#mysmal");
        waitting_load();
        $("#admin_info_table").load("/Index/Admin_Info_Table");
        done_load();
    }
</script>
