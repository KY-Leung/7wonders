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
                    <form action="symptom_checker_result.aspx" id="form_sample_3" class="form-horizontal" method ="POST">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="control-label col-md-3">Grouped Options</label>
                                <div class="col-md-9">
                                    <select multiple="multiple" class="multi-select" id="my_multi_select2" name="my_multi_select2">
                                        <optgroup label="Symptoms">
                                            <option value ="headache">Headache</option>
                                            <option value ="fever">Fever</option>
                                            <option value ="ulcers">Ulcers</option>
                                            <option value ="depressed">Depressed Mood</option>
                                            <option value ="forgetfulness">Forgetfulness</option>
                                            <option value ="hallucinations">Hallucinations</option>
                                            <option value ="rash">Rash with small Blisters</option>
                                        </optgroup>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-offset-3 col-md-9">
                                    <button type="submit" class="btn green">
                                        <i class="fa fa-check"></i> Diagnose</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- END FORM-->
                </div>
                <!-- END VALIDATION STATES-->
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageLevelPluginsScript" runat="server">
    <!-- PAGE LEVEL PLUGINS -->
    <script src="../public/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js" type="text/javascript"></script>
    <script src="../public/assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageLevelScripts" runat="server">
    <!-- PAGE LEVEL SCRIPTS -->
    <!-- TABLE-->
    <script src="../public/assets/pages/js/components-multi-select.min.js" type="text/javascript"></script>
</asp:Content>