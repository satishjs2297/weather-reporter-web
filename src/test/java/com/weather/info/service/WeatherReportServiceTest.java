package com.weather.info.service;

import java.util.Arrays;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.web.client.RestTemplate;

import com.weather.info.model.WeatherReport;

public class WeatherReportServiceTest {

	@Mock
	private RestTemplate restTemplateMock;

	@InjectMocks
	private WeatherReportServiceImpl weatherReportService;

	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
		ReflectionTestUtils.setField(weatherReportService, "weatherByCityUrl", "http://localhost:8080/weatherReport");
	}

	@Test
	public void testGetWeatherReportsByCities() {

		Mockito.when(restTemplateMock.getForObject(Mockito.any(String.class), Mockito.eq(WeatherReport.class)))
				.thenReturn(new WeatherReport());
		List<WeatherReport> weatherReportsByCities = weatherReportService
				.getWeatherReportsByCities(Arrays.asList("USA", "London"));
		Assert.assertNotNull(weatherReportsByCities);
		Assert.assertEquals(2, weatherReportsByCities.size());
	}
}
