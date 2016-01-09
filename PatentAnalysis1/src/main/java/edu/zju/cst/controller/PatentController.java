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
		System.out.println(startYear+":::"+endYear+":::"+company);
//		try {
//			byte[] bytes = company.getBytes("ISO-8859-1");
//			company = new String(bytes,"utf-8");
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}	
		System.out.println(startYear+":::"+endYear+":::"+company);
		Map<String, String> applyData=new HashMap<String, String>();		
		applyData=patentService.queryApplyData(startYear,endYear,company);
		Map<String, Object> map=new HashMap<String, Object>();
		List<String> applyDataList=new ArrayList<String>();
		
		for(int i=1;i<=applyData.size();i++){
			applyDataList.add(applyData.get(String.valueOf(i)));
		}
		System.out.println("//////////////////////////");
		for(int i=0;i<applyDataList.size();i++){
			System.out.println(applyDataList.get(i));
		}
		map.put("applyData", applyDataList);
//		return JSONObject.wrap(applyData).toString();
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
		Map<String, String> publicityData=new HashMap<String, String>();		
		publicityData=patentService.queryPublicityData(startYear,endYear,company);
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> publicityDataList=new ArrayList<String>();
		for(int i=1;i<=publicityData.size();i++){
			publicityDataList.add(publicityData.get(String.valueOf(i)));			
	    }		
		map.put("publicityData", publicityDataList);
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
		Map<String, String> catagoryData=new HashMap<String, String>();		
		catagoryData=patentService.queryPublicPatentCatagoryNum(year,company);
//		Map<String, Object> map = new HashMap<String, Object>();
//		for(int i=0;i<catagoryData.size();i++){
//			map.put("i", JSONObject.wrap(catagoryData.get(String.valueOf(i))).toString());
//	    }	
		return JSONObject.wrap(catagoryData).toString();
		
	}
}
