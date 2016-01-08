package edu.zju.cst.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import edu.zju.cst.beans.Patent;

public interface PatentMapper {
	public Patent getPatent(String id);
	//查询某公司某年某月申请的专利个数
	public int getPatentByCompany(@Param("company") String company,@Param("year") String year,
			@Param("month") String month);
}
