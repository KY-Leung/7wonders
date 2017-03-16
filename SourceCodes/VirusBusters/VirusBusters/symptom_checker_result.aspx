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
        <asp:label id="Testing" name="Testing"  runat="server" />
                        
        <p>Based on the symptoms you entered, we have calculated matches for possible conditions. The conditions are listed in order of how closely your symptoms match those conditions. This information is meant to be informational, and is not intended as medical advice or a diagnosis. Information you read should not replace the advice of your healthcare provider. You should always seek the advice of a qualified healthcare provider about any questions you may have about a medical condition. As always, if you think you have a medical emergency you should call your doctor or dial "995" immediately.</p>
    </div>
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN CHART PORTLET-->
            <div class="portlet light bordered">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-bar-chart font-green-haze"></i>
                        <span class="caption-subject bold uppercase font-green-haze"> Possible Conditions</span>
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"> </a>
                        <a href="#portlet-config" data-toggle="modal" class="config"> </a>
                        <a href="javascript:;" class="reload"> </a>
                        <a href="javascript:;" class="fullscreen"> </a>
                        <a href="javascript:;" class="remove"> </a>
                    </div>
                </div>
                <div class="portlet-body">
                    <script src="https://code.highcharts.com/highcharts.js"></script>
                    <script src="https://code.highcharts.com/modules/exporting.js"></script>
                    <div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
                    <p> More information about the disease can be found  <a href= "https://www.moh.gov.sg/content/moh_web/home/diseases_and_conditions/h/hfmd.html" target="_blank">HERE</a> </p>
                </div>
                <a href="symptom_checker.aspx"  class="btn default button-previous">
                    <i class="fa fa-angle-left"></i> Back to Choose Symptom(s)
                </a>
            </div>
            <!-- END CHART PORTLET-->
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageLevelPluginsScript" runat="server">
    <!-- PAGE LEVEL PLUGINS -->
    <!-- AMCHARTS-->
    <script src="../public/assets/global/plugins/amcharts/amcharts/amcharts.js" type="text/javascript"></script>
    <script src="../public/assets/global/plugins/amcharts/amcharts/serial.js" type="text/javascript"></script>
    <script src="../public/assets/global/plugins/amcharts/amcharts/pie.js" type="text/javascript"></script>
    <script src="../public/assets/global/plugins/amcharts/amcharts/themes/light.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageLevelScripts" runat="server">
    <!-- PAGE LEVEL SCRIPTS -->
    <!-- AMCHARTS-->
    <script src="../public/assets/pages/js/charts-amcharts.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Others" runat="server">
    <!-- OTHERS-->
    <script type="text/javascript">

     
    var symptoms = "<%=test%>";
   

    if (symptoms == "fever"){


    Highcharts.chart('container', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: 'Possible Conditions'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                }
            }
        }
    },
    series: [{
        name: 'Conditions',
        colorByPoint: true,
        data: [{
            name: 'Fever',
            y: 100.00
        },  ]
    }]
});
       }

else if (symptoms == "headache"){

Highcharts.chart('container', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: 'Possible Conditions'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                }
            }
        }
    },
    series: [{
        name: 'Conditions',
        colorByPoint: true,
        data: [{
            name: 'Headache',
            y: 100.00
        },  ]
    }]
});
       }

else if (symptoms == "ulcers"){

Highcharts.chart('container', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: 'Possible Conditions'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                }
            }
        }
    },
    series: [{
        name: 'Conditions',
        colorByPoint: true,
        data: [{
            name: 'Ulcers',
            y: 100.00
        },  ]
    }]
});
       }

else if (symptoms == "depressed" || symptoms == "forgetfulness" || symptoms == "hallucinations"){

Highcharts.chart('container', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: 'Possible Conditions'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                }
            }
        }
    },
    series: [{
        name: 'Conditions',
        colorByPoint: true,
        data: [{
            name: 'Normal Symptoms',
            y: 100.00
        },  ]
    }]
});
       }


else if (symptoms == "headache,fever,ulcers,rash"){

Highcharts.chart('container', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: 'Possible Conditions'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                }
            }
        }
    },
    series: [{
        name: 'Conditions',
        colorByPoint: true,
        data: [{
            name: 'Hand, Foot and Mouth Diseases',
            y: 89.00
        },
{
            name: 'Normal ',
            y: 11.00
        },   ]
    }]
});
       }

else if (symptoms == "headache,ulcers"){

Highcharts.chart('container', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: 'Possible Conditions'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                }
            }
        }
    },
    series: [{
        name: 'Conditions',
        colorByPoint: true,
        data: [{
            name: 'Heaty, Drink More Water',
            y: 54.00
        },
{
            name: 'Exhausted ',
            y: 23.00
        },  
{
            name: 'Normal ',
            y: 23.00
        }, 

 ]
    }]
});
       }

else if (symptoms == "depressed,hallucinations"){

Highcharts.chart('container', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: 'Possible Conditions'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                }
            }
        }
    },
    series: [{
        name: 'Conditions',
        colorByPoint: true,
        data: [{
            name: 'Depression',
            y: 85.00
        },
{
            name: 'Mental Disorder',
            y: 10.00
        },  
{
            name: 'Normal ',
            y: 5.00
        }, 

 ]
    }]
});
       }


else if (symptoms == "headache,forgetfulness,hallucinations"){

Highcharts.chart('container', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: 'Possible Conditions'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                }
            }
        }
    },
    series: [{
        name: 'Conditions',
        colorByPoint: true,
        data: [{
            name: 'Amnesia',
            y: 55.00
        },
{
            name: 'Depression',
            y: 24.00
        },  
{
            name: 'Stress ',
            y: 11.00
        }, 
{
            name: 'Normal ',
            y: 5.00
        }, 
{
            name: 'Hypertension ',
            y: 5.00
        }, 
 ]
    }]
});
       }






else{

Highcharts.chart('container', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: 'Possible Conditions'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                }
            }
        }
    },
    series: [{
        name: 'Conditions',
        colorByPoint: true,
        data: [{
            name: 'Normal',
            y: 70.00
        }, {
            name: 'Stressed',
            y: 25.03,
            sliced: true,
            selected: true
        }, {
            name: 'Disorder',
            y: 4.97
        }, ]
    }]
});
       }
     </script>
</asp:Content>