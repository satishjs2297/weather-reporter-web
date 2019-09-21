# Weather Reporter

Weather reporter Display the weather information on the page.

  - It takes city names as common separatted values
  - It makes the Async Ajax call with selected city names and get the weather information from https://api.openweathermap.org/data/2.5/weather
  - Display the infromation as a widget on the screen.
  - Enabled i18n and default to English. 

### Tech

Weather Reporteruses a number of open source projects to work properly:

* Spring Boot - Spring Boot MVC enabled Configuration!
* jQuery - Used JQuery lib for Validation, Animation & Ajax Calls .
* Bootstrap - Used for CSS styling.
* Maven - Maven build tool for project building and deployment.
* Junit - JUnit & Mockito for unit Testing

### Installation

Weather reporter requires Java 8 need to be installed.

Install the dependencies and devDependencies and start the server.

```sh
$ git clone <Weather Reporter git url> weather-reportor
$ cd weather-reportor
$ mvn clean install 
$ Post success of build runt this ::-->  mvn jetty:run
$ Open web browser & hit the url: http://localhost:8080/weather/home
```

### Development
- Clone the project and Import the project as Maven project.
- Clean and Reslove the maven dependency
- Open WeatherReporterApplication.java and right click and Run as Java Application.

### Contributors
- Pratap
