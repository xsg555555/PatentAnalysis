package edu.zju.cst.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping( value = "/companyList", method = RequestMethod.POST)
	public ModelAndView companyList(){
		System.out.println("OK");
		ModelAndView mv=new ModelAndView();
		List<CompanyDim> companyDims=this.getCompanyService().getCompanyList();
		for(CompanyDim companyDim:companyDims){
			System.out.println(companyDim.getCompany_name());
		}
		mv.addObject("companyList",companyDims);
//		mv.setViewName("companyList");
		mv.setViewName("redirect:/test2.jsp");
		return mv;
	}
	
}
