package com.bteam.project.common.controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.bteam.project.common.security.bean.AuthUser;

@ControllerAdvice
public class GlobalControllerAdvice {
	
		
	@ModelAttribute
	public void setAttribute(HttpServletRequest request, Authentication auth, Model model) {
		
		if (auth != null) {
			AuthUser authUser = (AuthUser) auth.getPrincipal();
			model.addAttribute("userData", authUser.getUser());
		} else {
			model.addAttribute("userData", null);
			StringBuffer reqUrl = request.getRequestURL();
			String[] url = reqUrl.toString().split("/");
			String lastUrl = url[url.length - 1];
			if(lastUrl.equals("myHome")) {
				request.getSession().setAttribute("prevPage", "/myPage/myHome");
			}
		}
		model.addAttribute("URI", request.getRequestURI());
	}
}
