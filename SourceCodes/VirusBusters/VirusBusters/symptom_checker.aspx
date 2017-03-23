<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="symptom_checker.aspx.cs" Inherits="VirusBusters.symptom_checker" MasterPageFile="~/public.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Symptom Checker
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageLevelPluginsLink" runat="server">
    <!-- PAGE LEVEL PLUGINS-->
    <!-- TABLE-->
    <style>
        select option {
            text-transform: capitalize;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <!-- CONTENT BODY-->
    <form id="form1" runat="server">
        <div class="m-heading-1 border-green m-bordered">
            <h3>Instructions</h3>
            <p>Select at least one or more symptoms from the list provided to predict your illness. The maximum number of symptoms that you can select is 4.</p>
            <p>Click on to the diagnose button to proceed the prediction after selecting your symptoms.</p>
        </div>
        <div class="row">
            <div class="col-md-12">
                <!-- BEGIN VALIDATION STATES-->
                <div class="portlet light portlet-fit portlet-form bordered">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-medkit font-dark"></i>
                            <span class="caption-subject font-dark sbold uppercase">Choose Symptom(s)</span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <!-- BEGIN FORM-->

                        <div class="form-body">
                            <div class="form-group">
                                <div class="col-md-offset-1 col-md-10">
                                    <div class="row">
                                        <div class="col-xs-5">
                                            <select name="from[]" id="multiselect" class="form-control" size="8" multiple="multiple">
                                                <asp:PlaceHolder ID="SymContainer" runat="server"></asp:PlaceHolder>
                                            </select>
                                        </div>

                                        <div class="col-xs-2">
                                            <button type="button" id="multiselect_rightSelected" class="btn btn-block"><i class="glyphicon glyphicon-chevron-right"></i></button>
                                            <button type="button" id="multiselect_leftSelected" class="btn btn-block"><i class="glyphicon glyphicon-chevron-left"></i></button>
                                        </div>

                                        <div class="col-xs-5">
                                            <select name="to[]" id="multiselect_to" class="form-control" size="8" multiple="multiple"></select>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-offset-1 col-md-10">
                                    <div class="col-md-12">
                                        <span id="err_msg" style="color: red; display: none;"></span></br></br>
                                        <button type="submit" id="diagnose" value="submit" name="submit">Diagnose</button>
                                    </div>
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
    <%--<script src="../public/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js" type="text/javascript"></script>
    <script src="../public/assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>--%>

    <script src="public/assets/global/plugins/multiselect.js" type="text/javascript"></script>

    <script type="text/javascript" language="javascript">
        jQuery(document).ready(function ($) {
            var max4text = "Maximum Symptoms you can select are 4";
            var min1text = "Minimum Symptoms you have to select is 1";

            $('#multiselect').multiselect({
                beforeMoveToRight: function (l, r, o) {
                    console.log($("#multiselect_to").children("option").length, $("#multiselect :selected").size())
                    if ($("#multiselect_to").children("option").length + $("#multiselect :selected").size() > 4) {
                        $("#err_msg").text(max4text);
                        $("#err_msg").show();
                        return false;
                    }
                    else {
                        $("#err_msg").hide();
                        return true;
                    }
                },
                beforeMoveToLeft: function () {
                    $("#err_msg").hide();
                    return true;
                }
            });

            $("#diagnose").click(function (e) {
                var symptoms = new Array();
                e.preventDefault();
                i = 0;
                $("#multiselect_to").children("option").each(function (e) {
                    symptoms.push($(this).val());
                    i++;
                });

                switch (i) {
                    case 0:
                        $("#err_msg").text(min1text);
                        $("#err_msg").show();
                    case 1:
                        window.location = "symptom_checker_result.aspx?s1=" + symptoms[0] + "&s2=&s3=&s4=";
                        break;
                    case 2:
                        window.location = "symptom_checker_result.aspx?s1=" + symptoms[0] + "&s2=" + symptoms[1] + "&s3=&s4=";
                        break;
                    case 3:
                        window.location = "symptom_checker_result.aspx?s1=" + symptoms[0] + "&s2=" + symptoms[1] + "&s3=" + symptoms[2] + "&s4=";
                        break;
                    case 4:
                        window.location = "symptom_checker_result.aspx?s1=" + symptoms[0] + "&s2=" + symptoms[1] + "&s3=" + symptoms[2] + "&s4=" + symptoms[3];
                        break;
                }

                //window.location = "symptom_checker_result.aspx?s1=" + symptoms[0] + "&s2=" + symptoms[1] + "&s3=" + symptoms[2] + "&s4=" + symptoms[3];
            })
        });
    </script>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageLevelScripts" runat="server">
</asp:Content>
