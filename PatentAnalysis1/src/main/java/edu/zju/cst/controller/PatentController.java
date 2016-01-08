package edu.zju.cst.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.zju.cst.service.PatentService;

@Controller
@RequestMapping("/patent")
public class PatentController {
	@Autowired
	private PatentService  patentService;
	/**
	 * 查询以月份为精度的公司申请专利数量
	 * @param request
	 * @param year
	 * @param company
	 * @return  返回applyData,applyData为HashMap,key为月份，value为申请专利数量
	 */
	@RequestMapping(value="/queryApplyData",method=RequestMethod.POST)
	public @ResponseBody String queryApplyData(HttpServletRequest request){
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
		Map<String, String> applyData=new HashMap<String, String>();		
		applyData=patentService.queryApplyData(startYear,endYear,company);
//		for(int i=1;i<13;i++){
//			System.out.println(i+":"+applyData.get(String.valueOf(i)));
//		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("applyData", JSONObject.wrap(applyData).toString());
		return JSONObject.wrap(map).toString();
		
	}
	/**
	 * 查询以月份为精度的公司公开专利数量
	 * @param request
	 * @param year
	 * @param company
	 * @return  返回publicityData,publicityData为HashMap,key为月份，value为公开专利数量
	 */
	@RequestMapping(value="/queryPublicity",method=RequestMethod.POST)
	public @ResponseBody String queryPublicity(HttpServletRequest request){
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
		Map<String, String> applyData=new HashMap<String, String>();		
		applyData=patentService.queryPublicityData(startYear,endYear,company);
//		for(int i=1;i<13;i++){
//			System.out.println(i+":"+applyData.get(String.valueOf(i)));
//		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("publicityData", JSONObject.wrap(applyData).toString());
		return JSONObject.wrap(map).toString();
		
	}
	/**
	 * 以年为精度，查询该公司概念各个专利类型的专利个数。分为发明专利、实用新型、外观设计
	 * year:年份
	 * company：公司
	 * @param request
	 * @return Json：patentCatagory；一个HashMap，key为专利类型名称，value为该专利类型的个数
	 */
	@RequestMapping(value="/queryPatentCatagory",method=RequestMethod.POST)
	public @ResponseBody String queryPatentCatagory(HttpServletRequest request){
		String year = request.getParameter("year");
		String company = request.getParameter("company");
		try {
			byte[] bytes = company.getBytes("ISO-8859-1");
			company = new String(bytes,"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		System.out.println(year+":"+company);
		Map<String, String> applyData=new HashMap<String, String>();		
		applyData=patentService.queryPatentCatagory(year,company);
		for(int i=1;i<13;i++){
			System.out.println(i+":"+applyData.get(String.valueOf(i)));
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("patentCatagory", JSONObject.wrap(applyData).toString());
		return JSONObject.wrap(map).toString();
		
	}
}
