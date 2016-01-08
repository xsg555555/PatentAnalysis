package edu.zju.cst.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import edu.zju.cst.beans.CompanyDim;
import edu.zju.cst.service.CompanyService;

@Controller
@RequestMapping("/company")
@SessionAttributes("companyList")
public class CompanyController {
	private CompanyService companyService;

	public CompanyService getCompanyService() {
		return companyService;
	}
	@Resource
	public void setCompanyService(CompanyService companyService) {
		this.companyService = companyService;
	}
	@RequestMapping( value = "/getCompanyList", method = RequestMethod.POST)
	public @ResponseBody String getCompanyList(HttpServletRequest request,HttpServletResponse response){
		System.out.println("OK");
		List<String> companyList=companyService.getCompanyList();
		for (String company : companyList) {
			System.out.println(company);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("companyList", JSONObject.wrap(companyList).toString());
		response.setContentType("text/json;charset=utf-8");
		return JSONObject.wrap(map).toString();
	}
	
}
