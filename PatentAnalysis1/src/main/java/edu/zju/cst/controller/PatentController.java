package edu.zju.cst.controller;

import java.util.HashMap;
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
	 * ��ѯ���·�Ϊ���ȵĹ�˾����ר������
	 * @param request
	 * @param year
	 * @param company
	 * @return  ����applyData,applyDataΪHashMap,keyΪ�·ݣ�valueΪ����ר������
	 */
	@RequestMapping(value="/queryApplyData",method=RequestMethod.POST)
	public @ResponseBody String queryApplyData(HttpServletRequest request,@RequestParam("year")String year,@RequestParam("company")String company){
		Map<String, String> applyData=new HashMap<String, String>();
		applyData=patentService.queryApplyData(year,company);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("applyData", JSONObject.wrap(applyData).toString());
		return JSONObject.wrap(map).toString();
		
	}
}
