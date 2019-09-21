package com.weather.info.service;

import java.util.List;

import java.util.stream.Collectors;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.weather.info.model.WeatherReport;

@Service
public class WeatherReportServiceImpl implements WeatherReportService {
	private static final Logger LOG = LogManager.getLogger(WeatherReportServiceImpl.class);

	private RestTemplate restTemplate;

	@Value("${weather_by_city_url}")
	private String weatherByCityUrl;

	@Autowired
	public WeatherReportServiceImpl(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}

	@Override
	public List<WeatherReport> getWeatherReportsByCities(List<String> cities) {
		List<WeatherReport> weathers = cities.stream().map(this::getWeatherReport).collect(Collectors.toList());
		LOG.info("weathers :: {}", weathers);
		return weathers;
	}

	private WeatherReport getWeatherReport(String city) {
		return restTemplate.getForObject(weatherByCityUrl.concat(city.trim()), WeatherReport.class);
	}

}
