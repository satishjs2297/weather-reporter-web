<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>	

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Weather Report Portal</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="<spring:url value="/resources/css/weather.png"/>">
    <link href='<spring:url value="/resources/css/style.css"/>' rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
        	$(".spinner-border").hide();
        	$("#errorDiv").hide();        	
            $("#get-report").click(function (event) {  
            	
            	event.preventDefault()
        		$(".spinner-border").show();
        		var form = $("#weather-report-form")
        		var cities = $("#cities").val();
        		if(!allLetter(cities)) {			
        			$("#errorDiv").show();
        			return;
        		}

        		$("#errorDiv").hide();
        		form.addClass('was-validated');               
                $.get("/weather/getWeathersByCities/"+cities, function(data, status){
        			$(".spinner-border").hide();
        		    if(status === 'success' && data.length > 0) {        			 
        				 createWidgets(data);
        		    } else {
        		    	alert('No Data found for the city :: '+ cities);
        		    }
          		});	                
                return;               
            });
        });

        function createWidgets(reports) {
            //reports = JSON.parse(reports);
            $(".report-widgets").empty();
            $(reports).each(function(index,report){
                $(".report-widgets").append(createWidget(report));
            });
            $(".report-widgets").find(".report-widget").each(function(index, element){
                $(element).delay((index + 1) * 100).animate({opacity: 1}); 
            });
        }

        function createWidget(report) {
            $report_widget = $("<div />").addClass("report-widget").addClass("col-md-2");
            $city = $("<div />").addClass("city").text(report.name);
            $data_holder = $("<div />").addClass("data-holder");
            $primary_data_holder = $("<div />").addClass("primary-data-holder");
            var img_src = "https://ssl.gstatic.com/onebox/weather/64/partly_cloudy.png";
            $temperature = $("<div />").addClass("data").append($("<div />").addClass("temperature").addClass("pt-3").text(report.main.temp));
            $clouds = $("<div />").addClass("clouds").append("Clouds: ").append(report.clouds.all);
            $humidity = $("<div />").addClass("humidity").append("Humidity: ").append(report.main.humidity);
            $wind = $("<div />").addClass("wind").append("Wind: ").append(report.wind.speed);
            $pressure = $("<div />").addClass("pressure").append("Pressure: ").append(report.main.pressure);

            $report_widget.append($city);
            $report_widget.append($data_holder);
            $data_holder.append($primary_data_holder);
            $primary_data_holder.append($temperature);
            $report_widget.append($clouds).append($humidity).append($wind).append($pressure);
            return $report_widget;
        }

        /*Validate City Name*/
        function allLetter(inputtxt) {
         var characterReg = /^\s*[a-zA-Z,\s]+\s*$/;
         if(characterReg.test(inputtxt)) {
            return true;
           } else {
          	 return false;
           }
        }
    </script>
</head>

<body>
    <div class="jumbotron text-center py-4">
        <h1>Welcome to Weather Report</h1>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <form id="weather-report-form" action="#">
                    <div class="form-group">
                        <label class="font-weight-bold" for="cities"><spring:message code="lbl.cityName"/></label>
                        <input type="text" class="form-control" id="cities" name="cities"
                            placeholder="Eg: Chicago (or) Chicago,Las Vegas" required />
                        <div class="invalid-feedback">Please enter city name(s).</div>
                        <div id="errorDiv" class="text-danger">Invalid City. Please enter the valid city.</div>	
                    </div>
                    <button class="btn btn-primary" id="get-report">Get Report</button>
                </form>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="report-widgets d-flex justify-content-center flex-wrap" >

        </div>
    </div>
</body>

</html>