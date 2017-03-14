<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="appointment_history.aspx.cs" Inherits="VirusBusters.appointment_history" MasterPageFile="~/admin.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="title" runat="server">
    Manage Appointment
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageLevelPluginsLink" runat="server">
    <link href="../public/assets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
    <link href="../public/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentBody" runat="server">
    <!-- BEGIN EXAMPLE TABLE PORTLET-->
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-globe"></i>Appointment History
                    </div>
                    <div class="tools"> </div>
                </div>
                <div class="portlet-body">
                    <table class="table table-striped table-bordered table-hover" id="sample_2">
                        <thead>
                            <tr>
                                <th> Status </th>
                                <th> Appointment ID </th>
                                <th> Type </th>
                                <th> Location </th>
                                <th> Date </th>
                                <th> Time </th>
                                <th> Remarks </th>
                                <th> Booking Date </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td> Confirmed </td>
                                <td> A0001 </td>
                                <td> Polyclinic </td>
                                <td> Bukit Batok Polyclinic </td>
                                <td> 24/02/2017 </td>
                                <td> 1000 </td>
                                <td>  </td>
                                <td> 21/02/2017 </td>
                            </tr>
                            <tr>
                                <td> Confirmed </td>
                                <td> A0002 </td>
                                <td> Polyclinic </td>
                                <td> Bukit Batok Polyclinic </td>
                                <td> 24/02/2017 </td>
                                <td> 1000 </td>
                                <td>  </td>
                                <td> 21/02/2017 </td>
                            </tr>
                            <tr>
                                <td> Confirmed </td>
                                <td> A0003 </td>
                                <td> Polyclinic </td>
                                <td> Bukit Batok Polyclinic </td>
                                <td> 24/02/2017 </td>
                                <td> 1000 </td>
                                <td>  </td>
                                <td> 21/02/2017 </td>
                            </tr>
                            <tr>
                                <td> Confirmed </td>
                                <td> A0004 </td>
                                <td> Polyclinic </td>
                                <td> Bukit Batok Polyclinic </td>
                                <td> 24/02/2017 </td>
                                <td> 1000 </td>
                                <td>  </td>
                                <td> 21/02/2017 </td>
                            </tr>
                            <tr>
                                <td> Confirmed </td>
                                <td> A0005 </td>
                                <td> Polyclinic </td>
                                <td> Bukit Batok Polyclinic </td>
                                <td> 24/02/2017 </td>
                                <td> 1000 </td>
                                <td>  </td>
                                <td> 21/02/2017 </td>
                            </tr>
                            <tr>
                                <td> Pending </td>
                                <td> A0006 </td>
                                <td> Polyclinic </td>
                                <td> Bukit Batok Polyclinic </td>
                                <td> 24/02/2017 </td>
                                <td> 1000 </td>
                                <td>  </td>
                                <td> 21/02/2017 </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- END EXAMPLE TABLE PORTLET-->
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageLevelPluginsScript" runat="server">
    <script src="../public/assets/global/js/datatable.js" type="text/javascript"></script>
    <script src="../public/assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
    <script src="../public/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PageLevelScripts" runat="server">
    <script src="../public/assets/pages/js/table-datatables-colreorder.min.js" type="text/javascript"></script>
</asp:Content>

