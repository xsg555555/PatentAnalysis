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
	 * @return  返回该公司该年份区间内12个月的公司申请专利数量
	 */
	public Map<String, String> queryApplyData(String startYear,String endYear,String company){
		Map<String, String> map=new HashMap<String, String>();
		int endy = Integer.parseInt(endYear);
		int starty = Integer.parseInt(startYear);
		int range = endy-starty;
		for(int j = 0;j<=range;j++){
			for(int i=1;i<=12;i++){
				int key = j*12+i;
				int num = patentMapper.getApplyNumByCompany(company,String.valueOf(starty+j),String.valueOf(i));
				map.put(String.valueOf(key), String.valueOf(num));
			}
		}
		return map;
	}
	
	/**
	 * 以月份为精度的公司公开专利数量
	 * @param startYear 查询的起始年份
	 * @param endYear 查询的终止年份
	 * @param company 查询的公司
	 * @return  返回该公司该年份区间内12个月的公司公开专利数量
	 */
	public Map<String, String> queryPublicityData(String startYear,String endYear,String company){
		Map<String, String> map=new HashMap<String, String>();
		int endy = Integer.parseInt(endYear);
		int starty = Integer.parseInt(startYear);
		int range = endy-starty;
		for(int j = 0;j<=range;j++){
			for(int i=1;i<=12;i++){
				int key = j*12+i;
				int num = patentMapper.getPublicNumByCompany(company,String.valueOf(starty+j),String.valueOf(i));
				map.put(String.valueOf(key), String.valueOf(num));
			}
		}
		return map;
	}
	/**
	 * 以年为精度，查询该公司该年份公开的各个专利类型的专利个数。分为发明专利、外观设计、实用新型
	 * @param year
	 * @param company
	 * @return 一个HashMap，key为专利类型名称，value为该专利类型的个数
	 */
	public Map<String, String> queryPublicPatentCatagory(String year,String company){
		Map<String, String> map=new HashMap<String, String>();
		ArrayList<String> num = new ArrayList<String>();
		String[] Category={"发明专利","外观设计","实用新型"};
		num = patentMapper.queryPublicPatentCatagoryNum(company, year);
		int index = 0;
		for (String n : num) {
			map.put(Category[index++], n);
		}
		return map;
	}
}
