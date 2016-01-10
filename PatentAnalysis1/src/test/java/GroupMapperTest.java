import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.zju.cst.beans.SQLPatentNumByGroupAndType;
import edu.zju.cst.mapper.GroupDimMapper;

public class GroupMapperTest {
	ApplicationContext  ac;
	@Before
	public void setup(){
		ac = new ClassPathXmlApplicationContext("classpath:configs/spring-dao.xml");
	}
	
	@Test
	public void testqueryTechnologyByBigGroup(){
		GroupDimMapper groupDimMapper = (GroupDimMapper)ac.getBean("GroupDimMapper");
		Map<String, Map<String,String>> technologyData=new HashMap<String, Map<String,String>>();
		ArrayList<SQLPatentNumByGroupAndType> list = new ArrayList<SQLPatentNumByGroupAndType>();
		list = groupDimMapper.queryTechnologyByBigGroup("杭州海康威视数字技术股份有限公司","2015");
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
		int n = 0;
		if (technologyData.get("IsNull").get("IsNull").equals("false")) {
			System.out.println("------------");
			for (String string : technologyData.keySet()) {
				Map<String, String> data = new HashMap<String, String>();
				data = technologyData.get(string);
				for(String string2:data.keySet()){
					System.out.println(string+"  "+string2+"  "+data.get(string2));
					n++;
				}
			}
			System.out.println(n);
		}else{
			System.out.println("NO data");
		}
	}
	
	@Test
	public void testqueryTechnologyBySmallGroup(){

		GroupDimMapper groupDimMapper = (GroupDimMapper)ac.getBean("GroupDimMapper");
		Map<String, Map<String,String>> technologyData=new HashMap<String, Map<String,String>>();
		ArrayList<SQLPatentNumByGroupAndType> list = new ArrayList<SQLPatentNumByGroupAndType>();
		list = groupDimMapper.queryTechnologyBySmallGroup("杭州海康威视数字技术股份有限公司","2015");
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
		int n = 0;
		if (technologyData.get("IsNull").get("IsNull").equals("false")) {
			System.out.println("------------");
			for (String string : technologyData.keySet()) {
				Map<String, String> data = new HashMap<String, String>();
				data = technologyData.get(string);
				for(String string2:data.keySet()){
					System.out.println(string+"  "+string2+"  "+data.get(string2));
					n++;
				}
			}
			System.out.println(n);
		}else{
			System.out.println("NO data");
		}
	}
}
