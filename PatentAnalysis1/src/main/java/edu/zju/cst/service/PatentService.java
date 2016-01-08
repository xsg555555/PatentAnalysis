package edu.zju.cst.service;

import java.awt.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.zju.cst.beans.Patent;
import edu.zju.cst.mapper.PatentMapper;

@Service("patentService")
public class PatentService {
	@Autowired
	private PatentMapper patentMapper;
	/**
	 * 以月份为精度的公司申请专利数量
	 * @param startYear 查询的起始年份
	 * @param endYear 查询的终止年份
	 * @param company 查询的公司
	 * @return  返回该公司该年份下12个月的公司申请专利数量
	 */
	public Map<String, String> queryApplyData(String startYear,String endYear,String company){
		Map<String, String> map=new HashMap<String, String>();
		ArrayList<Patent> patents = new ArrayList<Patent>();
		for(int i=1;i<=12;i++){
			int num = patentMapper.getPatentByCompany(company,startYear,String.valueOf(i));
			map.put(String.valueOf(i), String.valueOf(num));
		}
		return map;
	}
	/**
	 * 以月份为精度的公司公开专利数量
	 * @param startYear 查询的起始年份
	 * @param endYear 查询的终止年份
	 * @param company 查询的公司
	 * @return  返回该公司该年份下12个月的公司公开专利数量
	 */
	public Map<String, String> queryPublicityData(String startYear,String endYear,String company){
		Map<String, String> map=new HashMap<String, String>();
		return map;
	}
	/**
	 * 以年为精度，查询该公司概念各个专利类型的专利个数。分为发明专利、实用新型、外观设计
	 * @param year
	 * @param company
	 * @return 一个HashMap，key为专利类型名称，value为该专利类型的个数
	 */
	public Map<String, String> queryPatentCatagory(String year,String company){
		Map<String, String> map=new HashMap<String, String>();
		return map;
	}
}
