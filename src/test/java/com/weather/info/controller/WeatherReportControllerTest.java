package com.weather.info.controller;

import java.util.Collections;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;

import com.weather.info.model.WeatherReport;
import com.weather.info.service.WeatherReportService;

public class WeatherReportControllerTest {

	@Mock
	private WeatherReportService weatherReportServiceMock;

	@InjectMocks
	private WeatherReportController weatherReportController;

	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}

	@Test
	public void testHomePage() {
		String homePage = weatherReportController.homePage();
		Assert.assertNotNull(homePage);
	}

	@SuppressWarnings("unchecked")
	@Test
	public void testGetWeathersByCities() {
		Mockito.when(weatherReportServiceMock.getWeatherReportsByCities(Mockito.any(List.class)))
				.thenReturn(Collections.singletonList(new WeatherReport()));
		List<WeatherReport> weathersByCities = weatherReportController.getWeathersByCities(Collections.emptyList());
		Assert.assertNotNull(weathersByCities);
	}

}
