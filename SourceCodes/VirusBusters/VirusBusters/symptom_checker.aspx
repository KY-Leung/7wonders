<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="symptom_checker.aspx.cs" Inherits="VirusBusters.symptom_checker" MasterPageFile="~/public.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Manage Appointment
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageLevelPluginsLink" runat="server">
    <!-- PAGE LEVEL PLUGINS-->
    <!-- TABLE-->
    <link href="../public/assets/global/plugins/jquery-multi-select/css/multi-select.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <!-- CONTENT BODY-->
    <form id="form1" runat="server">
    <div class="m-heading-1 border-green m-bordered">
        <h3>Instructions</h3>
        <p>--- Some instructions here ---</p>
    </div>
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN VALIDATION STATES-->
            <div class="portlet light portlet-fit portlet-form bordered">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-settings font-dark"></i>
                        <span class="caption-subject font-dark sbold uppercase">Choose Symptom(s)</span>
                    </div>
                </div>
                <div class="portlet-body">
                    <!-- BEGIN FORM-->
                    
                        <div class="form-body">
                            <div class="form-group">
                                <label class="control-label col-md-3">Grouped Options</label>
                                <div class="col-md-9">
                                    <asp:ListBox ID="symptomsLB" runat="server" Height="125px" SelectionMode="Multiple"
                                        Width="200px" CausesValidation="True">
                                        
                                    </asp:ListBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-offset-3 col-md-9">
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Maximum Symptoms you can select are 4"
                                        ClientValidationFunction="onClientSelectedIndexChangingHandler" ForeColor="Red"></asp:CustomValidator><br />
                                    <asp:Button ID="SubmitBtn" runat="server" Text="Diagnose" OnClick="SubmitBtn_Click" />
                                        
                                </div>
                            </div>
                        </div>

                    <!-- END FORM-->
                </div>
                <!-- END VALIDATION STATES-->
            </div>
        </div>
    </div>
        </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageLevelPluginsScript" runat="server">
    <!-- PAGE LEVEL PLUGINS -->
    <script src="../public/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js" type="text/javascript"></script>
    <script src="../public/assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>

    <script type="text/javascript" language="javascript">
            function onClientSelectedIndexChangingHandler(source, arguments) {
                var listbox = document.getElementById('<%=symptomsLB.ClientID%>');
                var selectedCount = 0;
                for (var index = 0; index < listbox.options.length; index++) {
                    if (listbox.options[index].selected)
                        selectedCount += 1;
                }
                if (selectedCount < 5)
                    arguments.IsValid = true;
                else
                    arguments.IsValid = false;

            }
        </script>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageLevelScripts" runat="server">
    <!-- PAGE LEVEL SCRIPTS -->
    <!-- TABLE-->
    <script src="../public/assets/pages/js/components-multi-select.min.js" type="text/javascript"></script>
</asp:Content>