package edu.zju.cst.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import edu.zju.cst.beans.SQLCompanyYearPatentNumber;

public interface PeopleDimMapper {
	public ArrayList<SQLCompanyYearPatentNumber> getPeopleNumByCompany(@Param("company") String company,
			@Param("start_year") String start_year,
			@Param("end_year") String end_year);
}
