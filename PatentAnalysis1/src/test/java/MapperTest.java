
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.zju.cst.mapper.PatentMapper;

public class MapperTest {
	
	ApplicationContext  ac;
	@Before
	public void setup(){
		ac = new ClassPathXmlApplicationContext("classpath:configs/spring-dao.xml");
}
	
	@Test
	public void getPatentByCompanyTest(){
		PatentMapper patentMapper = (PatentMapper)ac.getBean("PatentMapper");
		int endy = Integer.parseInt("2015");
		int starty = Integer.parseInt("2014");
		int range = endy-starty;
		for(int j = 0;j<=range;j++){
			for(int i=1;i<=12;i++){
				int key = j*12+i;
				int num = patentMapper.getApplyNumByCompany("科大讯飞股份有限公司",String.valueOf(starty+j),String.valueOf(i));
				System.out.println("年："+(starty+j)+"  "+"月："+i+"  "+"专利数："+num);
			}
		}
		
	}
	
	@Test
	public void getPublicNumByCompanyTest(){
		PatentMapper patentMapper = (PatentMapper)ac.getBean("PatentMapper");
		int endy = Integer.parseInt("2015");
		int starty = Integer.parseInt("2014");
		int range = endy-starty;
		for(int j = 0;j<=range;j++){
			for(int i=1;i<=12;i++){
				int key = j*12+i;
				int num = patentMapper.getPublicNumByCompany("科大讯飞股份有限公司",String.valueOf(starty+j),String.valueOf(i));
				System.out.println("年："+(starty+j)+"  "+"月："+i+"  "+"专利数："+num);
			}
		}
	}

	@Test
	public void queryPublicPatentCatagoryTest(){
		PatentMapper patentMapper = (PatentMapper)ac.getBean("PatentMapper");
		Map<String, String> map=new HashMap<String, String>();
		ArrayList<String> num = new ArrayList<String>();
		String[] Category={"发明专利","外观设计","实用新型"};
		num = patentMapper.queryPublicPatentCatagoryNum("科大讯飞股份有限公司", "2015");
		int index = 0;
		for (String n : num) {
			map.put(Category[index], n);
			System.out.println(Category[index]+":"+map.get(Category[index++]));
		}	
//		PatentMapper patentMapper = (PatentMapper)ac.getBean("PatentMapper");
//		//Map<String, String> map = new HashMap<String, String>();
//		ArrayList<String> listC = new ArrayList<String>();
//		listC = patentMapper.queryPublicPatentCatagoryNum("科大讯飞股份有限公司","2015");
//		if (listC == null) {
//			System.out.println("no data");
//			return ;
//		}
//		for (String string : listC) {
//			System.out.println(string);
//		}
	}
}
