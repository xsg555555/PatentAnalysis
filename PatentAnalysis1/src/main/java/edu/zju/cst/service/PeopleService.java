package edu.zju.cst.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.zju.cst.beans.SQLCompanyYearPatentNumber;
import edu.zju.cst.mapper.PeopleDimMapper;

@Service("peopleService")
public class PeopleService {
	@Autowired
	private PeopleDimMapper peopleDimMapper;
	/**
	 * 查询从开始年份到终止年份，以月份为精度的该公司的技术人员数量
	 * @param startYear 开始的年份
	 * @param endYear   终止的年份
	 * @param company 查询的公司
	 * @return 返回List<String>,顺序存储从起始年1月开始到终止年12月的所有月份的人员数量
	 */
	public List<String> queryPeopleQuantity(String startYear,String endYear,String company) {
		List<String> peopleQuantityData=new ArrayList<String>();
		ArrayList<SQLCompanyYearPatentNumber> result = new ArrayList<SQLCompanyYearPatentNumber>();
		result = peopleDimMapper.getPeopleNumByCompany(company , startYear, endYear);
		int endy = Integer.parseInt(endYear);
		int starty = Integer.parseInt(startYear);
		int range = endy-starty;
		int index = 0;
		for(int j = 0;j<=range;j++){
			for(int i=1;i<=12;i++){
				int key = j*12+i;
				if (index < result.size() && result.get(index).getYear_number().equals(String.valueOf(starty+j)) 
						&&result.get(index).getMonth_number().equals(String.valueOf(i))) {
					peopleQuantityData.add(key-1,result.get(index).getCount());
					index++;
				}else{
					peopleQuantityData.add(key-1,"0");
				}
			}
		}
		return peopleQuantityData;
	}
}
