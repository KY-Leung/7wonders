<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="appointment_manage.aspx.cs" Inherits="VirusBusters.appointment_manage" MasterPageFile="~/public.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Manage Appointment
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageLevelPluginsLink" runat="server">
    <!-- PAGE LEVEL PLUGINS-->
    <!-- TABLE-->
    <link href="../public/assets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
    <link href="../public/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <!-- CONTENT BODY-->
    <!-- BEGIN EXAMPLE TABLE PORTLET-->
    <div class="m-heading-1 border-green m-bordered">
        <h1>Manage Appointment</h1>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Id"  >
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Appointment Id" SortExpression="Id" ReadOnly="True" />
                <asp:BoundField DataField="clinicName" HeaderText="Clinic" SortExpression="clinicName" />
                <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                <asp:BoundField DataField="time" HeaderText="Time" SortExpression="time" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this appointment?');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VirusBustersDBConnectionString %>" DeleteCommand="DELETE FROM [appointment] WHERE [Id] = @Id" InsertCommand="INSERT INTO [appointment] ([Id], [clinicName], [date], [userID], [time]) VALUES (@Id, @clinicName, @date, @userID, @time)" SelectCommand="SELECT * FROM [appointment] WHERE ([userID] = @userID)" UpdateCommand="UPDATE [appointment] SET [clinicName] = @clinicName, [date] = @date, [userID] = @userID, [time] = @time WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="clinicName" Type="String" />
                <asp:Parameter Name="date" Type="String" />
                <asp:Parameter Name="userID" Type="String" />
                <asp:Parameter Name="time" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" Name="userID" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="clinicName" Type="String" />
                <asp:Parameter Name="date" Type="String" />
                <asp:Parameter Name="userID" Type="String" />
                <asp:Parameter Name="time" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <!-- END EXAMPLE TABLE PORTLET-->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageLevelPluginsScript" runat="server">
    <!-- PAGE LEVEL PLUGINS -->
    <!-- TABLE-->
    <script src="../public/assets/global/js/datatable.js" type="text/javascript"></script>
    <script src="../public/assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
    <script src="../public/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageLevelScripts" runat="server">
    <!-- PAGE LEVEL SCRIPTS -->
    <!-- TABLE-->
    <script src="../public/assets/pages/js/table-datatables-colreorder.min.js" type="text/javascript"></script>
</asp:Content>
