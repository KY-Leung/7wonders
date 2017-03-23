<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="symptom_checker_result.aspx.cs" Inherits="VirusBusters.symptom_checker_result" MasterPageFile="~/public.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Possible Conditions
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageLevelPluginsLink" runat="server">
    <!-- PAGE LEVEL PLUGINS-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">

    <!-- CONTENT BODY-->
    <div class="m-heading-1 border-green m-bordered">
        <h3>Matches for Possible Conditions</h3>
        <p>You have chosen: </p>
        <asp:Label ID="Testing" name="Testing" runat="server" />

        <p>Based on the symptoms you entered, we have calculated matches for possible conditions. The conditions are listed in order of how closely your symptoms match those conditions. This information is meant to be informational, and is not intended as medical advice or a diagnosis. Information you read should not replace the advice of your healthcare provider. You should always seek the advice of a qualified healthcare provider about any questions you may have about a medical condition. As always, if you think you have a medical emergency you should call your doctor or dial "995" immediately.</p>
    </div>
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN CHART PORTLET-->
            <div class="portlet light bordered">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-bars font-green-haze"></i>
                        <span class="caption-subject bold uppercase font-green-haze">Possible Conditions</span>
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                        <a href="#portlet-config" data-toggle="modal" class="config"></a>
                        <a href="javascript:;" class="reload"></a>
                        <a href="javascript:;" class="fullscreen"></a>
                        <a href="javascript:;" class="remove"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
                </div>
                <a href="symptom_checker.aspx" class="btn default button-previous">
                    <i class="fa fa-angle-left"></i>Back to Choose Symptom(s)
                </a>

            </div>
            <!-- END CHART PORTLET-->
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageLevelPluginsScript" runat="server">
    <!-- PAGE LEVEL PLUGINS -->
    <!-- AMCHARTS-->
    <%--    <script src="../public/assets/global/plugins/amcharts/amcharts/amcharts.js" type="text/javascript"></script>
    <script src="../public/assets/global/plugins/amcharts/amcharts/serial.js" type="text/javascript"></script>
    <script src="../public/assets/global/plugins/amcharts/amcharts/pie.js" type="text/javascript"></script>
    <script src="../public/assets/global/plugins/amcharts/amcharts/themes/light.js" type="text/javascript"></script>--%>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageLevelScripts" runat="server">
    <!-- PAGE LEVEL SCRIPTS -->
    <!-- AMCHARTS-->
    <%-- <script src="../public/assets/pages/js/charts-amcharts.min.js" type="text/javascript"></script>--%>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="Scripts/custom.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Others" runat="server">
    <!-- OTHERS-->

</asp:Content>
