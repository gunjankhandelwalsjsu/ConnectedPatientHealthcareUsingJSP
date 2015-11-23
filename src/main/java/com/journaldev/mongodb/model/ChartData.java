package com.journaldev.mongodb.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ChartData {
	
String time;
	public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
	public Double getTemperature() {
		return temperature;
	}
	public void setTemperature(Double temperature) {
		this.temperature = temperature;
	}
	Double temperature;
	
	
	}