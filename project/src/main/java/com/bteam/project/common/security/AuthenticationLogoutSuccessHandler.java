package com.bteam.project.common.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.stereotype.Repository;

import com.bteam.project.common.security.bean.AuthUser;
import com.bteam.project.service.LoginService;

@Repository
public class AuthenticationLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {

	@Autowired
	LoginService loginService;

	private static final Logger logger = LoggerFactory.getLogger(AuthenticationLogoutSuccessHandler.class);

	@Override
	public void onLogoutSuccess(HttpServletRequest req, HttpServletResponse res, Authentication auth)
			throws IOException, ServletException {

		
		logger.info("onLogoutSuccess");
		String rUrl = "/";

		if (auth != null) {
			AuthUser authUser = (AuthUser) auth.getPrincipal();
			if (authUser.getConcurrency() == 1)
				rUrl = "/";
		}

		setDefaultTargetUrl(rUrl);
		super.onLogoutSuccess(req, res, auth);
	}
}
