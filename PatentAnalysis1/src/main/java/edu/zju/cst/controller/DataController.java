package edu.zju.cst.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/DataController")
public class DataController {
	@RequestMapping(value = "/test", method = RequestMethod.POST)
	public ModelAndView test() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/test2.jsp");
		return mv;
	}
}
