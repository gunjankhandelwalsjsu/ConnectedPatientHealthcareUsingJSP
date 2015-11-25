 <!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Highcharts data from JSON Response</title>
		<style>
		body{
			margin-top: 30px;
			margin-left:40px;
		}
		</style>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>		
	<script src="http://code.highcharts.com/highcharts.js"></script>
	<script type="text/javascript">
        $(function () {
                var processed_json = new Array();   
                $.getJSON('/ChartServlet', function(data) {
                    // Populate series
                    for (i = 0; i < data.length; i++){
                        processed_json.push([data[i].time, data[i].temperature]);
                    }
                 
                    // draw chart
                    $('#container').highcharts({
                    
                    title: {
                        text: "Patient vital data"
                    },
                    xAxis: {
                        type: 'category',
                        allowDecimals: false,
                        title: {
                            text: ""
                        }
                    },
                    yAxis: {
                        title: {
                            text: "Temperatures(\xB0C)"
                        }
                    },
				tooltip : {
     				 valueSuffix: '\xB0C'
   				},

                    series: [{
	                    name: 'Variation of Temperature with Dates',
                        data: processed_json
                    }]
                }); 
            });
        });
    </script>
</head>
<body>
       <div id="container" style="height: 400px"></div>
    
</body>
</html>
    