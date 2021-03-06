$(function () {
  $('#container').highcharts({
                             chart: {
                             type: 'area'
                             },
                             title: {
                             text: 'US and USSR nuclear stockpiles'
                             },
                             subtitle: {
                             text: 'Source: <a href="http://thebulletin.metapress.com/content/c4120650912x74k7/fulltext.pdf">'+
                             'thebulletin.metapress.com</a>'
                             },
                             xAxis: {
                             labels: {
                             formatter: function() {
                             return this.value; // clean, unformatted number for year
                             }
                             }
                             },
                             yAxis: {
                             title: {
                             text: 'Nuclear weapon states'
                             },
                             labels: {
                             formatter: function() {
                             return this.value / 1000 +'k';
                             }
                             }
                             },
                             tooltip: {
                             pointFormat: '{series.name} produced <b>{point.y:,.0f}</b><br/>warheads in {point.x}'
                             },
                             plotOptions: {
                             area: {
                             pointStart: 1940,
                             marker: {
                             enabled: false,
                             symbol: 'circle',
                             radius: 2,
                             states: {
                             hover: {
                             enabled: true
                             }
                             }
                             }
                             }
                             },
                             series: %@
                             });
  });