<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="ArticleDetailsValidate.aspx.cs" Inherits="VirusBusters.ArticleDetailsValidate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageLevelPluginsLink" runat="server">
    <link href="../public/assets/pages/css/blog.min.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <form id="form1" runat="server">
     <div class="blog-page blog-content-2">
        <div class="row">
            <div class="col-lg-9">
                <div class="blog-single-content bordered blog-container">
                    <div class="blog-single-head">
                        <h1 class="blog-single-head-title" id="ArticleTitle" runat="server"></h1>
                        <asp:Label ID="msglbl" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
                        <div class="blog-single-head-date">
                            <i class="icon-calendar font-blue"></i>
                            <span id="ArticleDate" runat ="server"></span>
                        </div>
                    </div>
                    <div class="blog-single-img">
                        <asp:Image ID="ArticleImg" runat="server" />
                        </div>
                    <div class="blog-single-desc" id="ArticleDesc" runat="server">
                        
                    </div>
                    <asp:Button ID="Approve" runat="server" Text="Approve" OnClick="Approve_Click" />
                </div>
            </div>
        </div>
    </div>
        </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageLevelPluginsScript" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageLevelScripts" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Others" runat="server">
</asp:Content>
