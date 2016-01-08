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
	 * @param year 查询的年份
	 * @param company 查询的公司
	 * @return  返回该公司该年份下12个月的公司申请专利数量
	 */
	public Map<String, String> queryApplyData(String year,String company){
		Map<String, String> map=new HashMap<String, String>();
		ArrayList<Patent> patents = new ArrayList<Patent>();
		for(int i=1;i<=12;i++){
			int num = patentMapper.getPatentByCompany("科大讯飞股份有限公司",year,String.valueOf(i));
			map.put(String.valueOf(i), String.valueOf(num));
		}
		return map;
	}
}
