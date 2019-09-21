package com.weather.info.service;

import java.util.List;

import com.weather.info.model.WeatherReport;

public interface WeatherReportService {

	List<WeatherReport> getWeatherReportsByCities(List<String> cities);

}
