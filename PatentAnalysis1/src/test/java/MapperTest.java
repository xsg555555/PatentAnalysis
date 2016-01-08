
import org.junit.Before;
import org.junit.Test;

import edu.zju.cst.beans.Patent;
import edu.zju.cst.mapper.PatentMapper;

import java.io.IOException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MapperTest {
	SqlSession sqlSession;
	PatentMapper fileMapper;
	
	@Before
	public void setup(){
	sqlSession = getSessionFactory().openSession();  
	fileMapper = sqlSession.getMapper(PatentMapper.class);  
}
	
	@Test
	public void selectFileTest(){
		int num = fileMapper.getPatentByCompany("科大讯飞股份有限公司", "2014", "10");
		System.out.println(num);
		sqlSession.commit(); 
	}
	/** 
	  * 获得MyBatis SqlSessionFactory 
	  * SqlSessionFactory负责创建SqlSession，一旦创建成功，就可以用SqlSession实例来执行映射语句，commit，rollback，close等方法。 
	  * @return 
	  */  
	 private SqlSessionFactory getSessionFactory() {  
		 SqlSessionFactory sessionFactory = null;  
		 String resource = "spring-dao.xml";  
		 try {  
			 sessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader(resource));  
		 } catch (IOException e) {  
		   // TODO Auto-generated catch block  
		   e.printStackTrace();  
		  }  
		  return sessionFactory;  
	}
}
