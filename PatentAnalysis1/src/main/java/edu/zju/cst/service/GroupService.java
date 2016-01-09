package edu.zju.cst.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.zju.cst.mapper.GroupDimMapper;

@Service("groupService")
public class GroupService {
	@Autowired
	private GroupDimMapper groupDimMapper;
	/**
	 * 查询某公司某年份/全部年份根据“大组”数据统计的技术类型的数量，技术类型分别“inventPatent”（发明专利）、“practicPatent”（实用新型）
	 * @param company 查询的公司名称
	 * @param year 查询的年份，若为“全部年份”，则查询所有的年份，除此之外，则查询year所指的年份，如“2014”
	 * @return 返回一个HashMap，其key值为大组值，value值为HashMap,其key值为专利类型名称，value为技术类型分别对应的数量
	 * e.g：{F16D55：{inventPatent：10,practicPatent：15}}
	 */
	public Map<String, Map<String,String>> queryTechnologyByBigGroup(String company,String year){
		Map<String, Map<String,String>> technologyData=new HashMap<String, Map<String,String>>();
		return technologyData;

	}
	/**
	 * 查询某公司某年份/全部年份根据“小组”数据统计的技术类型的数量，技术类型分别“inventPatent”（发明专利）、“practicPatent”（实用新型）
	 * @param company 查询的公司名称
	 * @param year 查询的年份，若为“全部年份”，则查询所有的年份，除此之外，则查询year所指的年份，如“2014”
	 * @return 返回一个HashMap，其key值为大组值，value值为HashMap,其key值为专利类型名称，value为技术类型分别对应的数量
	 * e.g：{F16D55/224：{inventPatent：10,practicPatent：15}}
	 */
	public Map<String, Map<String,String>>queryTechnologyBySmallGroup(String company,String year){
		Map<String, Map<String,String>> technologyData=new HashMap<String, Map<String,String>>();
		return technologyData;

	}
}
