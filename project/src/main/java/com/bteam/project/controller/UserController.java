package com.bteam.project.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bteam.project.service.MainService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	private static final Logger logger = LogManager.getLogger(UserController.class);
	
	@Autowired
	MainService mainService;
	
	@PostMapping("/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("uid") String uid) {

        int result = mainService.checkSelectUser(uid);
 
        
        if(result != 0) {
        	return "fail"; // 중복값 있음
        } else {
        	return "success";	// 중복값 없음
        }
		
	};
	
	@PostMapping("/joinup")
	@ResponseBody
	public void joinup(String uid, String upw, String uname, Integer uage, String uaddress, String umobile) {
		
		Map<String, Object> map = new HashMap();
		map.put("uid", uid);
		map.put("upw", upw); 
		map.put("uname", uname);
		map.put("uage", uage);
		map.put("uaddress",uaddress);
		map.put("umobile", umobile);
		
		logger.info("가져온 정보 : "+map);
		
		mainService.joinSite(map);
		
	};
	
	
	
	
	
}
