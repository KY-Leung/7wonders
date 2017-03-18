<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="Manage_Illness_Predictor.aspx.cs" Inherits="VirusBusters.Manage_Illness_Predictor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageLevelPluginsLink" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">

     <form id="form1" runat="server">
        <div class="m-heading-1 border-green m-bordered">
            <h3>Manage Illness Predcitor</h3>
            <asp:Label ID="msglbl" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
        </div>
        <div class="row">
            <div class="form-group">
                <label class="control-label col-md-3">Disease</label>
                <div class="col-md-9">
                    <asp:textbox id="DiseaseTB" runat="server"></asp:textbox>
                </div>
            </div>
            <br />
            <div class="form-group">
                <label class="control-label col-md-3">Symptom 1</label>
                <div class="col-md-9">
                    <asp:textbox id="sym1TB" runat="server"></asp:textbox>
                </div>
            </div>
            <br />
            <div class="form-group">
                <label class="control-label col-md-3">Symptom 2</label>
                <div class="col-md-9">
                    <asp:textbox id="sym2TB" runat="server"></asp:textbox>
                </div>
            </div>
            <br />
            <div class="form-group">
                <label class="control-label col-md-3">Symptom 3</label>
                <div class="col-md-9">
                    <asp:textbox id="sym3TB" runat="server"></asp:textbox>
                </div>
            </div>
            <br />
            <div class="form-group">
                <label class="control-label col-md-3">Symptom 4</label>
                <div class="col-md-9">
                    <asp:textbox id="sym4TB" runat="server"></asp:textbox>
                </div>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click"/>

            </div>

        </div>

         <div class="m-heading-1 border-green m-bordered">
             <h3>List of Dieases in System</h3>
         </div>
         <div class="row">
             <asp:PlaceHolder ID="DiseasesContainer" runat="server">

             </asp:PlaceHolder>
         </div>
    </form>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageLevelPluginsScript" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageLevelScripts" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Others" runat="server">
</asp:Content>
