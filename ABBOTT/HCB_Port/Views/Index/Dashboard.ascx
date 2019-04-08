<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript">
    $(function () {
        done_load();
    });
</script>
<section >
       <div id="ribbon" class="hidden-print">
                <a href="#dashboard" class="btn-ribbon" data-container="#main" data-toggle="tooltip" data-title="Show dashboard" data-original-title="" title=""><i class="fa fa-home"></i></a>
                <span class="vertical-devider">&nbsp;</span>
                <button class="btn-ribbon" data-container="#main" data-action="reload" data-toggle="tooltip" data-title="Reload content by ajax" data-original-title="" title=""><i class="fa fa-refresh"></i></button>
                <ol class="breadcrumb"><li class="active"><i class="fa fa-home menu-item-icon"></i> Dashboard</li></ol>
            </div>
<div id="content">
    index
</div>
</section>
