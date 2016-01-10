package edu.zju.cst.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.stylesheets.LinkStyle;

import edu.zju.cst.beans.SQLPatentNumByGroupAndType;
import edu.zju.cst.mapper.GroupDimMapper;

@Service("groupService")
public class GroupService {
	@Autowired
	private GroupDimMapper groupDimMapper;
	
	/**
	 * 查询某公司某年份/全部年份根据“大组”数据统计的技术类型的数量，技术类型分别“inventPatent”（发明专利）、“practicPatent”（实用新型）
	 * 若查询没有相对应的结果，则在返回map中的IsNUll字段进行设置
	 * @param company 查询的公司名称
	 * @param year 查询的年份，若为“全部年份”，则查询所有的年份，除此之外，则查询year所指的年份，如“2014”
	 * @return 返回一个HashMap，其key值为大组值，value值为HashMap,其key值为专利类型名称，value为技术类型分别对应的数量
	 * e.g：{F16D55：{inventPatent：10,practicPatent：15}}
	 */
	public Map<String, Map<String,String>> queryTechnologyByBigGroup(String company,String year){
		Map<String, Map<String,String>> technologyData=new HashMap<String, Map<String,String>>();
		ArrayList<SQLPatentNumByGroupAndType> list = new ArrayList<SQLPatentNumByGroupAndType>();
		list = groupDimMapper.queryTechnologyByBigGroup(company, year);
		Map<String, String> flag = new HashMap<String, String>();
		if (list.size() == 0) {
			flag.put("IsNull", "true");
			technologyData.put("IsNull",flag );
		}else {
			flag.put("IsNull", "false");
			technologyData.put("IsNull",flag );
			Map<String, String> InventPatent = new HashMap<String, String>();
			Map<String, String> PracticalPatent = new HashMap<String, String>();
			for (SQLPatentNumByGroupAndType result : list) {
				if (result.getType().equals("发明专利")) {
					InventPatent.put(result.getGroup(), result.getCount());
				}else{
					PracticalPatent.put(result.getGroup(), result.getCount());
				}
			}
			technologyData.put("inventPatent", InventPatent);
			technologyData.put("practicPatent", PracticalPatent);
		}
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
		ArrayList<SQLPatentNumByGroupAndType> list = new ArrayList<SQLPatentNumByGroupAndType>();
		list = groupDimMapper.queryTechnologyBySmallGroup(company, year);
		Map<String, String> flag = new HashMap<String, String>();
		if (list.size() == 0) {
			flag.put("IsNull", "true");
			technologyData.put("IsNull",flag );
		}else {
			flag.put("IsNull", "false");
			technologyData.put("IsNull",flag );
			Map<String, String> InventPatent = new HashMap<String, String>();
			Map<String, String> PracticalPatent = new HashMap<String, String>();
			for (SQLPatentNumByGroupAndType result : list) {
				if (result.getType().equals("发明专利")) {
					InventPatent.put(result.getGroup(), result.getCount());
				}else{
					PracticalPatent.put(result.getGroup(), result.getCount());
				}
			}
			technologyData.put("inventPatent", InventPatent);
			technologyData.put("practicPatent", PracticalPatent);
		}
		return technologyData;
	}
}
