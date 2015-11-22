<html>
  <head>
    <script type='text/javascript' src='https://www.google.com/jsapi'></script>
    <script type='text/javascript'>
    
      google.load('visualization', '1', {'packages':['annotatedtimeline']});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
    	  var data = google.visualization.arrayToDataTable([
                                                            ['value', 'Temperature'],
                                                             <c:forEach items="${chartDataList}" var="entry" 
                                                              var="i" begin="1" end="5">
                                                            [ ${i}, ${entry.temperature}],
                                                            </c:forEach>                                                          

                                                      ]);

                    

        var chart = new google.visualization.AnnotatedTimeLine(document.getElementById('chart_div'));
        chart.draw(data, {displayAnnotations: true});
      }
    </script>
  </head>

  <body>
   <div id='chart_div' style='width: 700px; height: 
   240px;'></div>

  </body>
</html>