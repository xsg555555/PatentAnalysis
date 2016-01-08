
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.zju.cst.beans.Patent;
import edu.zju.cst.mapper.PatentMapper;

import java.io.IOException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MapperTest {
	
	ApplicationContext  ac;
	@Before
	public void setup(){
		ac = new ClassPathXmlApplicationContext("classpath:configs/spring-dao.xml");
}
	
	@Test
	public void selectFileTest(){
		PatentMapper userMapper = (PatentMapper)ac.getBean("PatentMapper");
		System.out.println(userMapper.getPatentByCompany("科大讯飞股份有限公司", "2014", "10"));
	}

}
