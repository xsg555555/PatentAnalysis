package edu.zju.cst.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import edu.zju.cst.beans.SQLPatentNumByGroupAndType;

public interface GroupDimMapper {
	public ArrayList<SQLPatentNumByGroupAndType> queryTechnologyByBigGroup(@Param("company") String company,
			@Param("year")String year);
	public ArrayList<SQLPatentNumByGroupAndType> queryTechnologyBySmallGroup(@Param("company") String company,
			@Param("year")String year);

}
