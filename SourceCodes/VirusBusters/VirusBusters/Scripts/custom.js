
jQuery.ajax({
    url: 'symptom_checker_result.aspx/displayResult',
    type: "POST",
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    success: function (data) {
        var result = JSON.parse(data.d);
        var sym = new Array();
        for (i = 0; i < result.length; i++) {
            if(parseInt(result[i].percent) != 0)
                sym.push({ name: result[i].name, y: parseInt(result[i].percent) })
        }

        generatePie(sym);

    }
});

function generatePie(sym) {

    var con = document.getElementById('container');
    Highcharts.chart({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie',
            renderTo: con
        }, tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        }, title: {
            text: ''
        },exporting: {
            enabled: false
        }, credits: {
            enabled: false
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
            name: 'Symtoms',
            colorByPoint: true,
            data: sym

        }]
    });
}
