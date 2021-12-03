package com.bteam.project.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bteam.project.common.security.bean.AuthUser;
import com.bteam.project.service.MainService;
import com.bteam.project.service.SearchService;
import com.bteam.project.service.ShopService;

@Secured({"ROLE_USER"})
@Controller
@RequestMapping("/")
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@Autowired
	SearchService searchService;
	
	@Autowired
	ShopService shopService;
	
	private static final Logger logger = LogManager.getLogger(UserController.class);
	
	@GetMapping("")
	public ModelAndView main() throws UnsupportedEncodingException {
		ModelAndView mv = new ModelAndView("Main");

		return mv;
	}
	
	@GetMapping("join")
	public ModelAndView joinin() throws UnsupportedEncodingException {
		ModelAndView mv = new ModelAndView("Joinin");
		
		return mv;
	}
	
	@GetMapping("find")
	public ModelAndView find() throws UnsupportedEncodingException {
		ModelAndView mv = new ModelAndView("Find");
		
		return mv;
	}

	@RequestMapping(value="my-page", method = RequestMethod.GET)
	public ModelAndView mypage(@RequestParam Integer uidx) {
		ModelAndView mv = new ModelAndView("Mypage");
		
		List<Map<String, Object>> mypage = shopService.selectReservationByuidx(uidx);
		mv.addObject("mypage", mypage);
		
		int point = mainService.selectByPoint(uidx);
		mv.addObject("mypoint",point);
		
		return mv;
	}

}
