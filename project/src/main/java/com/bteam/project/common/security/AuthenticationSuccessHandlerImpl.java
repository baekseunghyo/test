package com.bteam.project.common.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Repository;

import com.bteam.project.common.security.bean.AuthUser;
import com.bteam.project.service.LoginService;

@Repository
public class AuthenticationSuccessHandlerImpl extends SavedRequestAwareAuthenticationSuccessHandler {

	private static final Logger logger = LoggerFactory.getLogger(AuthenticationSuccessHandlerImpl.class);

	@Autowired
	LoginService loginService;

	private String defaultUrl;

	public String getDefaultUrl() {
		return defaultUrl;
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

	public AuthenticationSuccessHandlerImpl() {
		defaultUrl = "/";
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res, Authentication auth)
			throws IOException, ServletException {

		String userUrl = "/";

		AuthUser authUser = (AuthUser) auth.getPrincipal();

		System.out.println("req.type" + req.getParameter("type"));

		logger.info("---------------------------------------------------");
		logger.info("---------------------------------------------------");
		logger.info("---------------------------------------------------");
		logger.info("###LoginUser Id: " + authUser.getUser().getIdx());
		logger.info("###LoginUser Name: " + authUser.getUser().getUname());
		logger.info("---------------------------------------------------");
		logger.info("---------------------------------------------------");
		logger.info("---------------------------------------------------");

		res.setContentType("application/json");
		res.setCharacterEncoding("utf-8");

		String url = userUrl;

		HttpSession session = req.getSession();
        if (session != null) {
            String redirectUrl = (String) session.getAttribute("prevPage");

            String referrer = req.getHeader("Referer");
            req.getSession().setAttribute("prevPage", referrer);

            if (redirectUrl != null) {
                url = redirectUrl;
            }
        }

		
		JSONObject responseJson = new JSONObject();
		JSONObject responseDataJson = new JSONObject();
		responseDataJson.put("error", false);
		responseDataJson.put("url", url);
		responseJson.put("response", responseDataJson);
		
		PrintWriter out = res.getWriter();
		out.print(responseJson.toString());
		out.flush();
		out.close();

	}

}
