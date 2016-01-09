package edu.zju.cst.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		return peopleQuantityData;
	}
}
