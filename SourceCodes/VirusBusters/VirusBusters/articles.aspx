<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="articles.aspx.cs" Inherits="VirusBusters.articles" MasterPageFile="~/public.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Articles
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageLevelPluginsLink" runat="server">
    <!-- PAGE LEVEL STYLES -->
    <link href="../public/assets/pages/css/blog.min.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <!-- CONTENT BODY-->
    <div class="blog-page blog-content-1">
        <div class="row">
         <asp:PlaceHolder ID ="articlesContainer" runat="server">

        </asp:PlaceHolder>
    </div>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageLevelPluginsScript" runat="server">
    <!-- PAGE LEVEL PLUGINS -->
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageLevelScripts" runat="server">
    <!-- PAGE LEVEL SCRIPTS -->
</asp:Content>
 