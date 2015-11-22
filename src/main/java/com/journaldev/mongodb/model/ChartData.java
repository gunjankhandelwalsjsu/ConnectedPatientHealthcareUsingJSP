package com.journaldev.mongodb.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ChartData {
	
int y;
public int getY() {
	return y;
}
public void setY(int y) {
	this.y = y;
}
public int getM() {
	return m;
}
public void setM(int m) {
	this.m = m;
}
public int getDa() {
	return da;
}
public void setDa(int da) {
	this.da = da;
}
int m;
int da;
	public Double getTemperature() {
		return temperature;
	}
	public void setTemperature(Double temperature) {
		this.temperature = temperature;
	}
	Double temperature;
	
	
	}