package com.bteam.project.controller;

import com.bteam.project.service.LoginService;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

	@Autowired
	LoginService loginService;

	   @RequestMapping(value = "", method = RequestMethod.GET)
	    public ModelAndView login(HttpServletRequest request) {
	        ModelAndView mv = new ModelAndView("Login");

	        String referrer = request.getHeader("Referer");
	        request.getSession().setAttribute("prevPage", referrer);

	        return mv;
	    }

	@RequestMapping(value="/findid", method= RequestMethod.POST)
	@ResponseBody
	public String findid(String uname, String umobile) {

		
		Map<String, Object> paramMap = new HashMap();
		
		paramMap.put("uname", uname);
		paramMap.put("umobile", umobile);
		
		String result = loginService.selectForId(paramMap);
		
		
		return result;
	}
	
	@RequestMapping(value="/findpw", method= RequestMethod.POST)
	@ResponseBody
	public String findpw(String uname, String uid) {
		
		
		Map<String, Object> paramMap = new HashMap();
		
		paramMap.put("uname", uname);
		paramMap.put("uid", uid);
		
		String result = loginService.selectForPw(paramMap);
		
		
		return result;
	}
}
