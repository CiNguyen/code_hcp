<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Index.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        a:focus, a:hover
        {
            text-decoration:none;
        }
        .modal-lg {
            width: 70% !important; 
        }
    </style>
    <section class="box">
        <div id="overlay"></div>
        <div id="loading"></div>
          <div id="Main_Load" >

    </div>
    </section>
  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JS" runat="server">
    <script type="text/javascript">
        $(function () {
           
            Dashboard_Load();
        })
    </script>
</asp:Content>
