<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script src="https://code.highcharts.com/modules/variable-pie.js"></script>

	<style>

	</style>
</head>   

<body>


<figure class="highcharts1-figure">
    <div id="container1"></div>
</figure>

   
  
   
   <script>
   Highcharts.chart('container1', {
	    chart: {
	        type: 'variablepie'
	    },
	    title: {
	        text: 'Countries compared by population density and total area.'
	    },
	    tooltip: {
	        headerFormat: '',
	        pointFormat: '<span style="color:{point.color}">\u25CF</span> <b> {point.name}</b><br/>' +
	            'Area (square km): <b>{point.y}</b><br/>' +
	            'Population density (people per square km): <b>{point.z}</b><br/>'
	    },
	    series: [{
	        minPointSize: 10,
	        innerSize: '20%',
	        zMin: 0,
	        name: '정상인지vs인지저하',
	        data: [{
	            name: '정상인지',
	            y: 505370,
	            z: 92.9
	        }, {
	            name: '인지저하',
	            y: 551500,
	            z: 118.7
	        }]
	    }]
	});

   </script>
</body>

</html>