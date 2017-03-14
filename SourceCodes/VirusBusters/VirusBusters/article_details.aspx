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
    <div class="blog-page blog-content-2">
        <div class="row">
            <div class="col-lg-9">
                <div class="blog-single-content bordered blog-container">
                    <div class="blog-single-head">
                        <h1 class="blog-single-head-title">Hand Foot Mouth disease</h1>
                        <div class="blog-single-head-date">
                            <i class="icon-calendar font-blue"></i>
                            <a href="javascript:;">Oct 24, 2015</a>
                        </div>
                    </div>
                    <div class="blog-single-img">
                        <img src="../public/assets/pages/img/article/hfm.jpg" /> </div>
                    <div class="blog-single-desc">
                        <p><b>What is hand-foot-and-mouth disease?</b></p>
                        <p> Hand-foot-and-mouth disease is an illness that causes sores in or on the mouth and on the hands, feet, and sometimes the buttocks and legs. The sores may be painful. The illness usually doesn't last more than a week or so. Hand-foot-and-mouth disease is common in children but can also occur in adults. It can occur at any time of year but is most common in the summer and fall. It is not the same as other diseases that have similar names: foot-and-mouth disease (sometimes called hoof-and-mouth disease) or mad cow disease. These diseases almost always occur in animals. </p>
                        <p><b>What causes hand-foot-and-mouth disease?</b></p>
                        <p> Hand-foot-and-mouth disease is caused by a virus called an enterovirus. The virus spreads easily through coughing and sneezing. It can also spread through infected stool, such as when you change a diaper or when a young child gets stool on his or her hands and then touches objects that other children put in their mouths. Often the disease breaks out within a community. It usually takes 3 to 6 days for a person to get symptoms of hand-foot-and-mouth disease after being exposed to the virus. This is called the incubation period. </p>
                        <p><b>What are the symptoms?</b></p>
                        <p>At first your child may feel tired, get a sore throat, or have a fever of around 101°F (38°C) to 103°F (39°C). Then in a day or two, sores or blisters may appear in or on the mouth and on the hands, feet, and sometimes the buttocks. In some cases a skin rash may appear before the blisters do. The blisters may break open and crust over. The sores and blisters usually go away in a week or so. In some cases there are no symptoms, or they are very mild. Parents may get the disease from their children and not even realize it.</p>
                        <p><b>How is hand-foot-and-mouth disease diagnosed?</b></p>  
                        <p>A doctor can tell if your child has hand-foot-and-mouth disease by the symptoms you describe and by looking at the sores and blisters. Tests usually aren't needed.</p>                                 
                    </div>
                    <div class="blog-single-foot">
                        <ul class="blog-post-tags">
                            <li class="uppercase">
                                <a href="javascript:;">Baby</a>
                            </li>
                            <li class="uppercase">
                                <a href="javascript:;">Infection</a>
                            </li>
                            <li class="uppercase">
                                <a href="javascript:;">Fever</a>
                            </li>
                        </ul>
                    </div>
                    <div class="blog-comments">
                        <h3 class="sbold blog-comments-title">Comments(0)</h3>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="blog-single-sidebar bordered blog-container">
                    <div class="blog-single-sidebar-search">
                        <div class="input-icon right">
                            <i class="icon-magnifier"></i>
                            <input type="text" class="form-control" placeholder="Search Blog"> </div>
                    </div>
                    <div class="blog-single-sidebar-recent">
                        <h3 class="blog-sidebar-title uppercase">Recent Posts</h3>
                        <ul>
                            <li>
                                <a href="javascript:;">Dengue Hotspots</a>
                            </li>
                            <li>
                                <a href="javascript:;">Breast Cancer Awareness</a>
                            </li>
                            <li>
                                <a href="javascript:;">Have you had your body checkup?</a>
                            </li>
                            <li>
                                <a href="javascript:;">Blood donation drives</a>
                            </li>
                        </ul>
                    </div>
                    <div class="blog-single-sidebar-tags">
                        <h3 class="blog-sidebar-title uppercase">Tags</h3>
                        <ul class="blog-post-tags">
                            <li class="uppercase">
                                <a href="javascript:;">Health</a>
                            </li>
                            <li class="uppercase">
                                <a href="javascript:;">Life</a>
                            </li>
                            <li class="uppercase">
                                <a href="javascript:;">Prevention</a>
                            </li>
                            <li class="uppercase">
                                <a href="javascript:;">Symptoms</a>
                            </li>
                            <li class="uppercase">
                                <a href="javascript:;">Cure</a>
                            </li>
                            <li class="uppercase">
                                <a href="javascript:;">MOH</a>
                            </li>
                            <li class="uppercase">
                                <a href="javascript:;">Discussion</a>
                            </li>
                            <li class="uppercase">
                                <a href="javascript:;">Information</a>
                            </li>
                        </ul>
                    </div>
                    <div class="blog-single-sidebar-links">
                        <h3 class="blog-sidebar-title uppercase">Useful Links</h3>
                        <ul>
                            <li>
                                <a href="javascript:;">Book appointment </a>
                            </li>
                            <li>
                                <a href="javascript:;">Submit Article</a>
                            </li>
                            <li>
                                <a href="javascript:;">Clinic locations</a>
                            </li>
                            <li>
                                <a href="javascript:;">Symptom checker</a>
                            </li>
                            <li>
                                <a href="javascript:;">Contacts</a>
                            </li>
                        </ul>
                    </div>
                                   
                </div>
            </div>
        </div>
    </div>
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