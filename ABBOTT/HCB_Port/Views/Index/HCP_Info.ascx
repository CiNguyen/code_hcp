<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<section>
       <div id="ribbon" class="hidden-print">
                <a href="/Index" class="btn-ribbon" data-container="#main" data-toggle="tooltip" data-title="Show dashboard" data-original-title="" title=""><i class="fa fa-home"></i></a>
                <span class="vertical-devider">&nbsp;</span>
                <button onclick="Load_Content();" class="btn-ribbon" data-container="#main" data-action="reload" data-toggle="tooltip" data-title="Reload" data-original-title="" title=""><i class="fa fa-refresh"></i></button>
                <ol class="breadcrumb"><li class="active"><i class="fa fa-share-alt menu-item-icon"></i> HCP INFO</li></ol>
                <a href="/Index/HCP_Info_Template_File" class="btn-sm btn-primary"><i class="fa fa-file-excel-o" aria-hidden="true"></i> Template Excel</a> - 
                <a href="/Index/Import_HCP_Info" class="btn-sm btn-success" data-backdrop="static" data-toggle="modal" data-target="#mysmal"><i class="fa fa-upload" aria-hidden="true"></i> Import Excel</a> -
                <a href="/Index/Export_HCP_Info" class="btn-sm btn-warning" data-backdrop="static" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus-circle" aria-hidden="true"></i> Export Excel</a> -
                <a href="/Index/HCP_CreateView" class="btn-sm btn-info" data-backdrop="static" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus" aria-hidden="true"></i> Create New</a>
            </div>
    <div class="row" style="padding-left: 10px;">
        <div class="col-md-2">
            <strong>Citizen ID Place Filter</strong>
            <select id="Place_Issue" class="form-control">
                <option value="" >Chose Province </option>
            </select>
        </div>
    </div>
    <div id="content" class="row">

    </div>
</section>

<script type="text/javascript">
    $("#Place_Issue").select2({
        width: '100%',
        placeholder: 'Place Issue'
    });

    $.ajax({
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        type: 'POST',
        url: "/Index/Select_List_Place_Issue",
        success: function (res) {
            $("#Place_Issue").empty();
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
            $("#Place_Issue").html(res.join(""));
        }
    });

    $("#Place_Issue").on('change',
        function () {
            var place = $("#Place_Issue").val();
            Load_Content(place);
        });

    $(function () {
        Load_Content();
        done_load();
    });
    function Load_Content(province) {
        $("#content").load("/Index/HCP_TableView", { 'province': province });
    }
</script>
