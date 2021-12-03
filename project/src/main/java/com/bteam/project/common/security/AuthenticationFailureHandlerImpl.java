package com.bteam.project.common.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Repository;

@Repository
public class AuthenticationFailureHandlerImpl extends SimpleUrlAuthenticationFailureHandler {

	private static final Logger logger = LoggerFactory.getLogger(AuthenticationFailureHandlerImpl.class);

	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public void onAuthenticationFailure(HttpServletRequest req, HttpServletResponse res, AuthenticationException ex)
			throws IOException, ServletException {
		logger.info("onAuthenticationFailure");

		String msg = ex.getMessage();

		res.setContentType("application/json");
		res.setCharacterEncoding("utf-8");

		String data = "{\"response\" : {" + "\"error\" : true, " + "\"msg\":\"" + msg + "\"" + "}}";

		PrintWriter out = res.getWriter();
		out.print(data);
		out.flush();
		out.close();
	}

}
