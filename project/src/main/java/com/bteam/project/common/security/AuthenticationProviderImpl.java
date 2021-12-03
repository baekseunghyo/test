package com.bteam.project.common.security;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;

import com.bteam.project.bean.User;
import com.bteam.project.common.security.bean.AuthUser;
import com.bteam.project.service.LoginService;

@Component("AuthenticationProviderImpl")
public class AuthenticationProviderImpl implements AuthenticationProvider {
	private static final Logger logger = LoggerFactory.getLogger(AuthenticationProviderImpl.class);

	@Autowired
	LoginService loginService;

	@SuppressWarnings("deprecation")
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String loginId = authentication.getName();
		String passwd = authentication.getCredentials().toString();

		WebAuthenticationDetails wad = (WebAuthenticationDetails) authentication.getDetails();
		String userIPAddress = wad.getRemoteAddress();
		
		boolean bSuccess = false;
		String errorMsg = "";
		List<GrantedAuthority> grantedAuths = new ArrayList<GrantedAuthority>();

		User user = null;
		AuthUser authUser = null;

		String loginType ="";
		HashMap<String, Object> userMap = new HashMap<String, Object>();
		do {
			
			user = loginService.SelectUserByIdAndPassword(loginId, passwd);
			if (user == null) {
				errorMsg = "ERROR_NOT_FOUND_USER";
				loginType= "존재하지 않는 계정";
				break;
			}

			grantedAuths.add(new SimpleGrantedAuthority(User.ROLE_USER));

			authUser = new AuthUser(user);
			bSuccess = true;

			
		} while (false);
		

		if (bSuccess) {
			userMap.put("userIdx", user.getIdx());
			userMap.put("userId", loginId);
			userMap.put("loginIp", userIPAddress);
			userMap.put("loginType", "로그인 성공");
			
			return new UsernamePasswordAuthenticationToken(authUser, passwd, grantedAuths);
		} 
		else {
			userMap.put("userIdx", -1);
			userMap.put("userId", loginId);
			userMap.put("loginIp", userIPAddress);
			userMap.put("loginType", loginType);
			
			HashMap<String, Object> failMap = new HashMap<String, Object>();
			failMap.put("loginId", passwd);
			throw new BadCredentialsException(errorMsg, failMap);
		}
	}


	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
}
