<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="article_new.aspx.cs" Inherits="VirusBusters.article_new" MasterPageFile="~/public.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    New Article
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageLevelPluginsLink" runat="server">
    <!-- PAGE LEVEL PLUGINS -->
    <link href="../public/assets/global/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css" rel="stylesheet" type="text/css" />
    <link href="../public/assets/global/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css" rel="stylesheet" type="text/css" />
    <link href="../public/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <!-- CONTENT BODY-->
    <form id="form1" runat="server">
        <div class="m-heading-1 border-green m-bordered">
            <h3>Create New Article
                <asp:Label ID="msgLbl" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
            </h3>
            <p>Medical staff will create new articles here.</p>
                <p><u>  General rules to follow : </u></p>
                <p>  1. No profanities allowed. </p>
                <p>  2. All sources used must be cited. </p>
                <p>  3. All articles are to be medical related. </p>
                <p>  4. No repeated posting of the same articles.  </p>
                <p>5. All submissions are subjected to approval by the administrator.
            </p>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet light portlet-fit portlet-form bordered">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-settings font-dark"></i>
                            <span class="caption-subject font-dark sbold uppercase">Create Article</span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="form-body">
                            <div class="alert alert-danger display-hide">
                                <button class="close" data-close="alert"></button> You have some form errors. Please check below. </div>
                            <div class="alert alert-success display-hide">
                                <button class="close" data-close="alert"></button> Your form validation is successful! </div>
                           
                       <div class="form-group">
                            <label class="control-label col-md-3">Title</label>
                            <div class="col-md-9">
                            <asp:TextBox ID="TitleTB" runat="server"></asp:TextBox> </div>
                        </div>

                             <div class="form-group">
                                <label class="control-label col-md-3">Content</label>
                                <div class="col-md-9">
                                    <textarea name="markdown" data-provide="markdown" rows="10" data-error-container="#editor_error" runat="server" id="art_content"></textarea>
                                    <div id="editor_error"> </div>
                                </div>
                            </div>
                        </div>
                       
                        <div class="form-group last">
                            <label class="control-label col-md-3">Image Upload</label>
                            <div class="col-md-9">
                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                    <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                        <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="" /> </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"> </div>
                                    <div>
                                        <span class="btn default btn-file">
                                            <span class="fileinput-new"> Select image </span>
                                            <span class="fileinput-exists"> Change </span>
                                            <asp:FileUpload ID="img_up" runat="server" /></span>
                                        <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"> Remove </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-offset-3 col-md-9">
                                <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Submit_Click" cssclass="btn green"/>
                                <br />
                                <asp:Label ID="errorMsg" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageLevelPluginsScript" runat="server">
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script src="../public/assets/global/plugins/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript"></script>
    <script src="../public/assets/global/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js" type="text/javascript"></script>
    <script src="../public/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageLevelScripts" runat="server">
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../public/assets/pages/js/components-bootstrap-tagsinput.min.js" type="text/javascript"></script>
</asp:Content>