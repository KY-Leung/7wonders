<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="appointment_new.aspx.cs" Inherits="VirusBusters.appointment_new" MasterPageFile="~/admin.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    New Appointment
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageLevelPluginsLink" runat="server">
    <!-- PAGE LEVEL PLUGINS-->
    <!-- WIZARD-->
    <link href="../public/assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="../public/assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- CALENDER-->
    <link href="../public/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <form id="form1" runat="server">
        <div class="row">
        <div class="col-md-12">
            <div class="portlet light bordered" id="form_wizard_1">
                <div class="portlet-title">
                    <div class="caption">
                        <i class=" fa fa-edit font-red"></i>
                        <span class="caption-subject font-red bold uppercase">
                            Making Appointment -
                            <span class="step-title"> Step 1 of 1 </span>
                        </span>
                    </div>
                    
                </div>
                <div class="portlet-body form"></div>
                <div class="form-wizard">
                    <div class="form-body">
                        <ul class="nav nav-pills nav-justified steps">
                            <li>
                                <a href="#tab1" data-toggle="tab" class="step">
                                    <span class="number"> 1 </span>
                                    <span class="desc">
                                        <i class="fa fa-check"></i> Appointment Details
                                    </span>
                                </a>
                            </li>
                        </ul>
                        <div id="bar" class="progress progress-striped" role="progressbar">
                            <div class="progress-bar progress-bar-success"> </div>
                        </div>
                        <div class="tab-content">
                            <div class="alert alert-danger display-none">
                                <button class="close" data-dismiss="alert"></button> You have some form errors. Please check below.
                            </div>
                            <div class="alert alert-success display-none">
                                <button class="close" data-dismiss="alert"></button> Your form validation is successful!
                            </div>
                            <div class="tab-pane active" id="tab1">
                                <h3 class="block">Select your appointment details</h3>
                                <table>
                                <tr>
                                    <td class="auto-style1">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">
                                            Date
                                            <span class="required"> * </span>
                                        </label>
                                        <div class="col-md-3">
                                            <div class="input-group input-medium date date-picker" data-date-format="yyyy/mm/dd">              
                                                <asp:TextBox ID="DateBox" runat="server" class="form-control"  Enabled="true" OnTextChanged="DateBox_TextChanged"></asp:TextBox>
                                                <span class="input-group-btn">
                                                    <button class="btn default" type="button" style="margin-right:29px">
                                                        <i class="fa fa-calendar"></i>
                                                    </button>
                                                </span>
                                            </div>
                                            <!-- /input-group -->
                                        </div>
                                    </div>
                                    </td>
                                </tr>
                                    <tr>
                                        <td>
                                            <br/>
                                        </td>
                                    </tr>
                                    <tr>
                                    <td>
                                        <div class="form-group">
                                            <label class="control-label col-md-3">
                                                Clinic
                                                <span class="required"> * </span>
                                            </label>
                                            <div class="col-md-3">
                                                <div>
                                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="cN" DataValueField="cN"  AppendDataBoundItems="true" EnableViewState="True"></asp:DropDownList>           
                                                </div>
                                                <!-- /input-group -->
                                            </div>
                                        </div>
                                    </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br/>
                                        </td>
                                    </tr>
                                    <tr>
                                    <td>
                                        <div class="form-group">
                                            <label class="control-label col-md-3">
                                                Time
                                                <span class="required"> * </span>
                                            </label>
                                            <div class="col-md-3">
                                                <div>
                                                    <asp:DropDownList ID="DropDownList2" runat="server">
                                                        <asp:ListItem>0800</asp:ListItem>
                                                        <asp:ListItem>0900</asp:ListItem>
                                                        <asp:ListItem>1000</asp:ListItem>
                                                        <asp:ListItem>1100</asp:ListItem>
                                                        <asp:ListItem>1200</asp:ListItem>
                                                        <asp:ListItem>1300</asp:ListItem>
                                                        <asp:ListItem>1400</asp:ListItem>
                                                        <asp:ListItem>1500</asp:ListItem>
                                                        <asp:ListItem>1600</asp:ListItem>
                                                        <asp:ListItem>1700</asp:ListItem>
                                                        <asp:ListItem>1800</asp:ListItem>
                                                        <asp:ListItem>1900</asp:ListItem>
                                                        <asp:ListItem>2000</asp:ListItem>
                                                        <asp:ListItem>2100</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>  <!-- /input-group -->
                                            </div>
                                        </div>
                                    </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="Button1" runat="server" Text="Book" cssclass="btn green" OnClick="Button1_Click" OnClientClick="return confirm('Are you sure you want to make this appointment?');"/>
                                        </td>
                                    </tr>
                                </table>             
                            </div>
                        </div>            
                    </div>
                </div>
            </div>
        </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VirusBustersDBConnectionString %>" SelectCommand="SELECT [cN] FROM [clinic]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:VirusBustersDBConnectionString %>" DeleteCommand="DELETE FROM [appointment] WHERE [Id] = @Id" InsertCommand="INSERT INTO [appointment] ([Id], [clinicName], [date], [userID], [time]) VALUES (@Id, @clinicName, @date, @userID, @time)" SelectCommand="SELECT * FROM [appointment]" UpdateCommand="UPDATE [appointment] SET [clinicName] = @clinicName, [date] = @date, [userID] = @userID, [time] = @time WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter Name="Id" Type="Int32" ControlID="Label1"/>
                <asp:ControlParameter Name="clinicName" Type="String"  ControlID="DropdownList1" PropertyName="SelectedValue" />
                <asp:ControlParameter Name="date" Type="String" ControlID ="Label3"/>
                <asp:ControlParameter Name="userID" Type="String" ControlID="Label2" />
                <asp:ControlParameter Name="time" Type="String" ControlID="DropdownList2"/>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="clinicName" Type="String" />
                <asp:Parameter Name="date" Type="String" />
                <asp:Parameter Name="userID" Type="String" />
                <asp:Parameter Name="time" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>
        <asp:Label ID="Label3" runat="server" Text="Label" Visible="false"></asp:Label>
        <script runat="server">
            protected void DateBox_TextChanged(object sender, System.EventArgs e) {   
            }
        </script>
    </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageLevelPluginsScript" runat="server">
    <!-- PAGE LEVEL PLUGINS)-->
    <!-- WIZARD-->
    <script src="../public/assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
    <script src="../public/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../public/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
    <script src="../public/assets/global/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js" type="text/javascript"></script>
    <!-- CALENDER)-->
    <script src="../public/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageLevelScripts" runat="server">
    <!-- PAGE LEVEL SCRIPTS-->
    <!-- WIZARD -->
    <script src="../public/assets/pages/js/form-wizard.min.js" type="text/javascript"></script>
    <!-- CALENDER-->
    <script src="../public/assets/pages/js/components-date-time-pickers.min.js" type="text/javascript"></script>
</asp:Content>