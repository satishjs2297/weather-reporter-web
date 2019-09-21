package com.weather.info.exception;

public class WeatherReportException extends RuntimeException {
	private static final long serialVersionUID = 4319031573929248634L;

	public WeatherReportException(Exception ex) {
		super(ex);
	}

	public WeatherReportException(String message) {
		super(message);
	}
}
