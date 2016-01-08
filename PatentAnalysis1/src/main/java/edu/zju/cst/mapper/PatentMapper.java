package edu.zju.cst.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import edu.zju.cst.beans.Patent;

public interface PatentMapper {
	public Patent getPatent(String id);
	//查询某公司某年某月申请的专利个数
	public int getApplyNumByCompany(@Param("company") String company,@Param("year") String year,
			@Param("month") String month);
	
	//查询某公司某年某月公开的专利个数
	public int getPublicNumByCompany(@Param("company") String company,@Param("year") String year,
			@Param("month") String month);
	//查询某公司某年公开的专利个数,按照专利类型排序
	public ArrayList<String> queryPublicPatentCatagoryNum(@Param("company") String company,
			@Param("year") String year);
	
}
