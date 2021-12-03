package com.bteam.project.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bteam.project.service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	private static final Logger logger = LogManager.getLogger(UserController.class);
	
	@Autowired
	SearchService searchService;
	
	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public ModelAndView search(@RequestParam(defaultValue = "", required = false) String searchText){
		ModelAndView mv = new ModelAndView("Search");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchText", searchText);

		List<Map<String, Object>> search = searchService.selectByShop(paramMap);
		
		
		mv.addObject("search", search);
		
		return mv;
	}
	

	@RequestMapping(value="/location", method = RequestMethod.GET)
	public ModelAndView location(@RequestParam(defaultValue = "", required = false) String searchText, @RequestParam String location){
		ModelAndView mv = new ModelAndView("Search");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("saddress", location);
		paramMap.put("searchText", searchText);
		
		List<Map<String, Object>> search = searchService.selectByLocation(paramMap);
		
		mv.addObject("search",search);
		
		return mv;
	}
	
	@RequestMapping(value="/topview1", method = RequestMethod.GET)
	public ModelAndView topview1(@RequestParam(defaultValue = "", required = false) String searchText, @RequestParam String location){
		ModelAndView mv = new ModelAndView("Search");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("saddress", location);
		paramMap.put("searchText", searchText);
		
		List<Map<String, Object>> search = searchService.selectTopView1(paramMap);
		
		mv.addObject("search",search);
		mv.addObject("orderby", "viewTop");
		
		return mv;
	}
	
	@RequestMapping(value="/topview2", method = RequestMethod.GET)
	public ModelAndView topview2(@RequestParam(defaultValue = "", required = false) String searchText){
		ModelAndView mv = new ModelAndView("Search");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchText", searchText);
		
		List<Map<String, Object>> search = searchService.selectTopView2(paramMap);
		
		mv.addObject("search",search);
		mv.addObject("orderby", "viewTop");
		
		return mv;
	}
	
	@RequestMapping(value="/bottomview1", method = RequestMethod.GET)
	public ModelAndView bottomview1(@RequestParam(defaultValue = "", required = false) String searchText, @RequestParam String location){
		ModelAndView mv = new ModelAndView("Search");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("saddress", location);
		paramMap.put("searchText", searchText);
		
		List<Map<String, Object>> search = searchService.selectBottomView1(paramMap);
		
		mv.addObject("search",search);
		mv.addObject("orderby", "viewBottom");
		
		return mv;
	}
	
	@RequestMapping(value="/bottomview2", method = RequestMethod.GET)
	public ModelAndView bottomview2(@RequestParam(defaultValue = "", required = false) String searchText){
		ModelAndView mv = new ModelAndView("Search");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchText", searchText);
		
		List<Map<String, Object>> search = searchService.selectBottomView2(paramMap);
		
		mv.addObject("search",search);
		mv.addObject("orderby", "viewBottom");
		
		return mv;
	}
	
	@RequestMapping(value="/topprice1", method = RequestMethod.GET)
	public ModelAndView topprice1(@RequestParam(defaultValue = "", required = false) String searchText, @RequestParam String location){
		ModelAndView mv = new ModelAndView("Search");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("saddress", location);
		paramMap.put("searchText", searchText);
		
		List<Map<String, Object>> search = searchService.selectTopPrice1(paramMap);
		
		mv.addObject("search",search);
		mv.addObject("orderby", "priceTop");
		
		return mv;
	}
	
	@RequestMapping(value="/topprice2", method = RequestMethod.GET)
	public ModelAndView topprice2(@RequestParam(defaultValue = "", required = false) String searchText){
		ModelAndView mv = new ModelAndView("Search");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchText", searchText);
		
		List<Map<String, Object>> search = searchService.selectTopPrice2(paramMap);
		
		mv.addObject("search",search);
		mv.addObject("orderby", "priceTop");
		
		return mv;
	}
	
	@RequestMapping(value="/bottomprice1", method = RequestMethod.GET)
	public ModelAndView bottomprice1(@RequestParam(defaultValue = "", required = false) String searchText, @RequestParam String location){
		ModelAndView mv = new ModelAndView("Search");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("saddress", location);
		paramMap.put("searchText", searchText);
		
		List<Map<String, Object>> search = searchService.selectBottomPrice1(paramMap);
		
		mv.addObject("search",search);
		mv.addObject("orderby", "priceBottom");
		
		return mv;
	}
	
	@RequestMapping(value="/bottomprice2", method = RequestMethod.GET)
	public ModelAndView bottomprice2(@RequestParam(defaultValue = "", required = false) String searchText){
		ModelAndView mv = new ModelAndView("Search");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchText", searchText);
		
		List<Map<String, Object>> search = searchService.selectBottomPrice2(paramMap);
		
		mv.addObject("search",search);
		mv.addObject("orderby", "priceBottom");
		
		return mv;
	}
	
	
}
