package edu.zju.cst.beans;

import java.sql.Date;

public class DateDim {
	private int date_sk;
	private Date date_value;
	private String date_full;
	private int day_in_year;
	private int day_in_month;
	private String day_name;
	private int week_in_year;
	private int week_in_month;
	private int month_number;
	private String month_name;
	private int year_number;
	private String quarter_name;
	private int quarter_number;
	private String year_quarter;
	private String year_month_number;
	private String year_month_abbreviation;
	public int getDate_sk() {
		return date_sk;
	}
	public void setDate_sk(int date_sk) {
		this.date_sk = date_sk;
	}
	public Date getDate_value() {
		return date_value;
	}
	public void setDate_value(Date date_value) {
		this.date_value = date_value;
	}
	public String getDate_full() {
		return date_full;
	}
	public void setDate_full(String date_full) {
		this.date_full = date_full;
	}
	public int getDay_in_year() {
		return day_in_year;
	}
	public void setDay_in_year(int day_in_year) {
		this.day_in_year = day_in_year;
	}
	public int getDay_in_month() {
		return day_in_month;
	}
	public void setDay_in_month(int day_in_month) {
		this.day_in_month = day_in_month;
	}
	public String getDay_name() {
		return day_name;
	}
	public void setDay_name(String day_name) {
		this.day_name = day_name;
	}
	public int getWeek_in_year() {
		return week_in_year;
	}
	public void setWeek_in_year(int week_in_year) {
		this.week_in_year = week_in_year;
	}
	public int getWeek_in_month() {
		return week_in_month;
	}
	public void setWeek_in_month(int week_in_month) {
		this.week_in_month = week_in_month;
	}
	public int getMonth_number() {
		return month_number;
	}
	public void setMonth_number(int month_number) {
		this.month_number = month_number;
	}
	public String getMonth_name() {
		return month_name;
	}
	public void setMonth_name(String month_name) {
		this.month_name = month_name;
	}
	public int getYear_number() {
		return year_number;
	}
	public void setYear_number(int year_number) {
		this.year_number = year_number;
	}
	public String getQuarter_name() {
		return quarter_name;
	}
	public void setQuarter_name(String quarter_name) {
		this.quarter_name = quarter_name;
	}
	public int getQuarter_number() {
		return quarter_number;
	}
	public void setQuarter_number(int quarter_number) {
		this.quarter_number = quarter_number;
	}
	public String getYear_quarter() {
		return year_quarter;
	}
	public void setYear_quarter(String year_quarter) {
		this.year_quarter = year_quarter;
	}
	public String getYear_month_number() {
		return year_month_number;
	}
	public void setYear_month_number(String year_month_number) {
		this.year_month_number = year_month_number;
	}
	public String getYear_month_abbreviation() {
		return year_month_abbreviation;
	}
	public void setYear_month_abbreviation(String year_month_abbreviation) {
		this.year_month_abbreviation = year_month_abbreviation;
	}
}
