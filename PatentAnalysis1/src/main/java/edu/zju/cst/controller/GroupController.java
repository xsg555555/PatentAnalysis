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
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.zju.cst.service.GroupService;

@Controller
@RequestMapping("/group")
public class GroupController {
	@Autowired
	private GroupService groupService;
	@RequestMapping(value="/queryTechnologyCompare",method=RequestMethod.POST)
	public @ResponseBody String queryTechnologyCompare(HttpServletRequest request){		
		String company = request.getParameter("company");
		String year = request.getParameter("year");
		String type = request.getParameter("type");
		Map<String, Map<String,String>> technologyData=new HashMap<String, Map<String,String>>();
		try {
			byte[] bytes = company.getBytes("ISO-8859-1");
			company = new String(bytes,"utf-8");
			year = new String(bytes,"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(type.equals("大组")){
			technologyData=groupService.queryTechnologyByBigGroup(company,year);
		}else{
			technologyData=groupService.queryTechnologyBySmallGroup(company,year);
		}
		return JSONObject.wrap(technologyData).toString();
	}
	
}
