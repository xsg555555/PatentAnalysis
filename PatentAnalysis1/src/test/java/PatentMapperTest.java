
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.zju.cst.beans.SQLCompanyYearPatentNumber;
import edu.zju.cst.beans.SQLPatentNumByGroupAndType;
import edu.zju.cst.beans.SQLPatentTypeNumber;
import edu.zju.cst.mapper.GroupDimMapper;
import edu.zju.cst.mapper.PatentMapper;

public class PatentMapperTest {
	
	ApplicationContext  ac;
	@Before
	public void setup(){
		ac = new ClassPathXmlApplicationContext("classpath:configs/spring-dao.xml");
	}
	
	@Test
	public void getPatentByCompanyTest(){
		PatentMapper patentMapper = (PatentMapper)ac.getBean("PatentMapper");
		Map<String, String> map = new HashMap<String, String>();
		ArrayList<SQLCompanyYearPatentNumber> result = new ArrayList<SQLCompanyYearPatentNumber>();
		result = patentMapper.getApplyNumByCompany("科大讯飞股份有限公司","2014","2015");
		int endy = Integer.parseInt("2015");
		int starty = Integer.parseInt("2014");
		int range = endy-starty;
		int index = 0;
		for(int j = 0;j<=range;j++){
			for(int i=1;i<=12;i++){
				int key = j*12+i;
				if (index < result.size() && result.get(index).getYear_number().equals(String.valueOf(starty+j)) 
						&&result.get(index).getMonth_number().equals(String.valueOf(i))) {
					map.put(String.valueOf(key), result.get(index).getCount());
					System.out.println(key+":"+map.get(String.valueOf(key)));
					index++;
				}else{
					map.put(String.valueOf(key), new String("0"));
					System.out.println(key+":"+map.get(String.valueOf(key)));
				}
			}
		}
		
//		ArrayList<SQLCompanyYearPatentNumber> result = new ArrayList<SQLCompanyYearPatentNumber>();
//		result = patentMapper.getApplyNumByCompany("科大讯飞股份有限公司", "2014", "2015");
//		for (SQLCompanyYearPatentNumber sqlCompanyYearPatentNumber : result) {
//			System.out.println(sqlCompanyYearPatentNumber.getYear_number()+" "
//								+sqlCompanyYearPatentNumber.getMonth_number()+" "
//								+sqlCompanyYearPatentNumber.getCount());
//		}
	}
	
	@Test
	public void getPublicNumByCompanyTest(){
		PatentMapper patentMapper = (PatentMapper)ac.getBean("PatentMapper");
		Map<String, String> map = new HashMap<String, String>();
		ArrayList<SQLCompanyYearPatentNumber> result = new ArrayList<SQLCompanyYearPatentNumber>();
		result = patentMapper.getPublicNumByCompany("科大讯飞股份有限公司","2014","2015");
		int endy = Integer.parseInt("2015");
		int starty = Integer.parseInt("2014");
		int range = endy-starty;
		int index = 0;
		for(int j = 0;j<=range;j++){
			for(int i=1;i<=12;i++){
				int key = j*12+i;
				if (index < result.size() && result.get(index).getYear_number().equals(String.valueOf(starty+j)) 
						&&result.get(index).getMonth_number().equals(String.valueOf(i))) {
					map.put(String.valueOf(key), result.get(index).getCount());
					System.out.println(key+":"+map.get(String.valueOf(key)));
					index++;
				}else{
					map.put(String.valueOf(key),String.valueOf(0));
					System.out.println(key+":"+map.get(String.valueOf(key)));
				}
			}
		}
	}

	@Test
	public void queryPublicPatentCatagoryTest(){
		PatentMapper patentMapper = (PatentMapper)ac.getBean("PatentMapper");
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
				System.out.println(englishCategory[index]+":"+map.get(englishCategory[index]));
				n++;
			}else{
				map.put(englishCategory[index],"0");
				System.out.println(englishCategory[index]+":"+map.get(englishCategory[index]));
			}
			index++;
		}
		if (index<=3) {
			map.put(englishCategory[index],"0");
			System.out.println(englishCategory[index]+":"+map.get(englishCategory[index]));
			index++;
		}
	}
}
