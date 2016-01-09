package edu.zju.cst.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.zju.cst.service.PeopleService;

@Controller
@RequestMapping("/people")
public class PeopleController {
	@Autowired
	private PeopleService peopleService;
	/**
	 * 查询以月份为精度的公司公开专利数量
	 * @param request
	 * @param startYear
	 * @param endYear
	 * @param company
	 * @return  返回publicityData,publicityData为HashMap,key为月份，value为公开专利数量
	 */
	@RequestMapping(value="/queryPeopleQuantity",method=RequestMethod.POST)
	public @ResponseBody String queryPeopleQuantity(HttpServletRequest request){
		String startYear = request.getParameter("startYear");
		String endYear = request.getParameter("endYear");
		String company = request.getParameter("company");
		try {
			byte[] bytes = company.getBytes("ISO-8859-1");
			company = new String(bytes,"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
//		System.out.println(year+":"+company);
		List<String> peopleQuantityData=new ArrayList<String>();		
		peopleQuantityData=peopleService.queryPeopleQuantity(startYear,endYear,company);
		Map<String, Object> map = new HashMap<String, Object>();
			
		map.put("peopleQuantityData", peopleQuantityData);
		return JSONObject.wrap(map).toString();
		
	}
}
