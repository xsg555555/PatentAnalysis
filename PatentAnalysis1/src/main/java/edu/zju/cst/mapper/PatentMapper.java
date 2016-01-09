package edu.zju.cst.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import edu.zju.cst.beans.Patent;
import edu.zju.cst.beans.SQLCompanyYearPatentNumber;

public interface PatentMapper {
	public Patent getPatent(String id);
	
	//查询某公司某年某月申请的专利个数
	public ArrayList<SQLCompanyYearPatentNumber> getApplyNumByCompany(@Param("company") String company,@Param("start_year") String start_year,
			@Param("end_year") String end_year);
	
	//查询某公司某年某月公开的专利个数
	public ArrayList<SQLCompanyYearPatentNumber> getPublicNumByCompany(@Param("company") String company,@Param("start_year") String start_year,
			@Param("end_year") String end_year);
	//查询某公司某年公开的专利个数,按照专利类型排序
	public ArrayList<String> queryPublicPatentCatagoryNum(@Param("company") String company,
			@Param("year") String year);
	
}
