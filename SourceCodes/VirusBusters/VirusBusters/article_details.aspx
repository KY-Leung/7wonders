<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="article_details.aspx.cs" Inherits="VirusBusters.article_details" MasterPageFile="~/public.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageLevelPluginsLink" runat="server">
    <!-- PAGE LEVEL STYLES -->
    <link href="../public/assets/pages/css/blog.min.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <!-- CONTENT BODY-->
    <form id="form1" runat="server">
    <div class="blog-page blog-content-2">
        <div class="row">
            <div class="col-lg-9">
                <div class="blog-single-content bordered blog-container">
                    <div class="blog-single-head">
                        <h1 class="blog-single-head-title" id="ArticleTitle" runat="server"></h1>
                        <div class="blog-single-head-date">
                            <i class="fa fa-calendar font-blue"></i>
                            <span id="ArticleDate" runat ="server"></span>
                        </div>
                    </div>
                    <div class="blog-single-img">
                        <asp:Image ID="ArticleImg" runat="server" Visible="false"/>
                        </div>
                    <div class="blog-single-desc" id="ArticleDesc" runat="server">
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="blog-comments">
        <h3 class="sbold blog-comments-title">Comments</h3>

        <asp:PlaceHolder ID ="CommentConatiner" runat="server">

        </asp:PlaceHolder>

        <h3 class="sbold blog-comments-title">Leave A Comment</h3>
            <div class="form-group">
                <input type="text" placeholder="Your Name" class="form-control c-square" id="nameTB" runat="server">
            </div>
            <div class="form-group">
                <textarea rows="8" name="message" placeholder="Write comment here ..." class="form-control c-square" id="msgTB" runat="server"></textarea>
            </div>
            <div class="form-group">
                <asp:Button ID="submit_btn" runat="server" Text="Submit" OnClick="submit_btn_Click" />
            </div>
    </div>
        </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageLevelPluginsScript" runat="server">
    <!-- PAGE LEVEL PLUGINS -->
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageLevelScripts" runat="server">
    <!-- PAGE LEVEL SCRIPTS -->
</asp:Content>