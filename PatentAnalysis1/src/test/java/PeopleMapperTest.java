import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.zju.cst.beans.SQLCompanyYearPatentNumber;
import edu.zju.cst.mapper.PeopleDimMapper;



public class PeopleMapperTest {
	ApplicationContext  ac;
	@Before
	public void setup(){
		ac = new ClassPathXmlApplicationContext("classpath:configs/spring-dao.xml");
	}
	
	@Test
	public void getPeopleNumByCompanyTest(){
		PeopleDimMapper peopleDimMapper= (PeopleDimMapper)ac.getBean("PeopleDimMapper");
		List<String> peopleQuantityData=new ArrayList<String>();
		ArrayList<SQLCompanyYearPatentNumber> result = new ArrayList<SQLCompanyYearPatentNumber>();
		result = peopleDimMapper.getPeopleNumByCompany("科大讯飞股份有限公司" , "2014", "2015");
		int endy = Integer.parseInt("2015");
		int starty = Integer.parseInt("2014");
		int range = endy-starty;
		int index = 0;
		for(int j = 0;j<=range;j++){
			for(int i=1;i<=12;i++){
				int key = j*12+i;
				if (index < result.size() && result.get(index).getYear_number().equals(String.valueOf(starty+j)) 
						&&result.get(index).getMonth_number().equals(String.valueOf(i))) {
					peopleQuantityData.add(key-1,result.get(index).getCount());
					System.out.println(peopleQuantityData.get(key-1));
					index++;
				}else{
					peopleQuantityData.add(key-1,"0");
					System.out.println(peopleQuantityData.get(key-1));
				}
			}
		}
//		ArrayList<SQLCompanyYearPatentNumber> list = new ArrayList<SQLCompanyYearPatentNumber>();
//		list = peopleDimMapper.getPeopleNumByCompany("科大讯飞股份有限公司" , "2014", "2015");
//		System.out.println(list.size());
//		for (SQLCompanyYearPatentNumber ll : list) {
//			System.out.println(ll.getYear_number()+" "
//								+ll.getMonth_number()+" "
//								+ll.getCount());
//		}

	}
}
