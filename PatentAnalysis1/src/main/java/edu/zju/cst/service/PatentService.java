package edu.zju.cst.service;

import java.awt.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.maven.artifact.resolver.filter.AndArtifactFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.zju.cst.beans.Patent;
import edu.zju.cst.beans.SQLCompanyYearPatentNumber;
import edu.zju.cst.beans.SQLPatentTypeNumber;
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
		Map<String, String> map = new HashMap<String, String>();
		ArrayList<SQLCompanyYearPatentNumber> result = new ArrayList<SQLCompanyYearPatentNumber>();
		result = patentMapper.getApplyNumByCompany(company,startYear,endYear);
		int endy = Integer.parseInt(endYear);
		int starty = Integer.parseInt(startYear);
		int range = endy-starty;
		int index = 0;
		for(int j = 0;j<=range;j++){
			for(int i=1;i<=12;i++){
				int key = j*12+i;
				if (index < result.size() && result.get(index).getYear_number().equals(String.valueOf(starty+j)) 
						&&result.get(index).getMonth_number().equals(String.valueOf(i))) {
					map.put(String.valueOf(key), result.get(index).getCount());
					//System.out.println(key+":"+map.get(String.valueOf(key)));
					index++;
				}else{
					map.put(String.valueOf(key),String.valueOf(0));
					//System.out.println(key+":"+map.get(key));
				}
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
		Map<String, String> map = new HashMap<String, String>();
		ArrayList<SQLCompanyYearPatentNumber> result = new ArrayList<SQLCompanyYearPatentNumber>();
		result = patentMapper.getPublicNumByCompany(company,startYear,endYear);
		int endy = Integer.parseInt(endYear);
		int starty = Integer.parseInt(startYear);
		int range = endy-starty;
		int index = 0;
		for(int j = 0;j<=range;j++){
			for(int i=1;i<=12;i++){
				int key = j*12+i;
				if (index < result.size() && result.get(index).getYear_number().equals(String.valueOf(starty+j)) 
						&&result.get(index).getMonth_number().equals(String.valueOf(i))) {
					map.put(String.valueOf(key), result.get(index).getCount());
					//System.out.println(key+":"+map.get(String.valueOf(key)));
					index++;
				}else{
					map.put(String.valueOf(key),String.valueOf(0));
					//System.out.println(key+":"+map.get(key));
				}
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
	public Map<String, String> queryPublicPatentCatagoryNum(String year,String company){
		Map<String, String> map=new HashMap<String, String>();
		ArrayList<SQLPatentTypeNumber> numList = new ArrayList<SQLPatentTypeNumber>();
		String[] chineseCategory={"发明专利","外观专利","实用新型"};
		String[] englishCategory={"inventPatent","outlookPatent","practicPatent"};
		numList = patentMapper.queryPublicPatentCatagoryNum("科大讯飞股份有限公司", "2014");
		for (SQLPatentTypeNumber string : numList) {
			System.out.println(string.getType()+":"+string.getCount());
		}
		int index = 0;
		for (int n=0;n<numList.size();) {
			SQLPatentTypeNumber result = numList.get(n);
			if (result.getType().equals(chineseCategory[index])) {
				map.put(englishCategory[index],result.getCount());
				//System.out.println(englishCategory[index]+":"+map.get(englishCategory[index]));
				n++;
			}else{
				map.put(englishCategory[index],"0");
				//System.out.println(englishCategory[index]+":"+map.get(englishCategory[index]));
			}
			index++;
		}
		if (index<=3) {
			map.put(englishCategory[index],"0");
			//System.out.println(englishCategory[index]+":"+map.get(englishCategory[index]));
			index++;
		}
		return map;
	}
}
