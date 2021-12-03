package com.bteam.project.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.AntPathRequestMatcher;

import com.bteam.project.common.security.AuthenticationSuccessHandlerImpl;
import com.bteam.project.common.security.AuthenticationFailureHandlerImpl;
import com.bteam.project.common.security.AuthenticationLogoutSuccessHandler;
import com.bteam.project.common.security.AuthenticationProviderImpl;

@Configuration
@EnableWebSecurity
@EnableGlobalAuthentication
@ComponentScan(basePackages = { "com.bteam.project.*" })
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    // 로그인과 관련된 Provider 의존성 주입
    @Autowired
    AuthenticationProviderImpl authProvider;

    // 로그인 실패시 이동할 Handler 의존성 주입
    @Autowired
    AuthenticationFailureHandlerImpl authFailureHandler;

    // 로그인 성공시 이동할 Handler 의존성 주입
    @Autowired
    AuthenticationSuccessHandlerImpl authSuccessHandler;

    // 로그아룻 성공시 이동할 Handler 의존성 주입
    @Autowired
    AuthenticationLogoutSuccessHandler logoutSuccessHandler;

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        // 로그인 설정
        http.authorizeRequests()
                // permitAll() 메소드는 어떠한 보안 요구 없이 요청을 허용해준다.
                .antMatchers("/","/login", "/login/**","find/**","/join/**", "/users/**", "/error", "/error/**",
                			"/search/**","/img/**","/reservation/**","/user/findid/**","/user/findpw/**","/reservation/review/**").permitAll()
                // hasAnyRole() 메소드는 여러개의 권한 설정가능
                //.antMatchers("/**").hasAnyRole("ROLE_USER")
                // hasRole() 메소드는 하나의 권한만 설정가능
                .and()
                // csrf 비활성화
                .csrf().disable()
                // 로그인 폼 사용
                .formLogin()
                // 로그인 URL 설정 이 설정이 없으면 스프링 시큐리티에서 제공해주는 로그인 페이지로 이동
                .loginPage("/login")
                // authProvider에서 로그인 성공시 이동할 Handler 설정
                .successHandler(authSuccessHandler)
                // authProvider에서 로그인 실패시 이동할 Handler 설정
                .failureHandler(authFailureHandler)
                // 해당 URL 요청이 들어오면 authProvider로 로그인 정보를 전달하여 로그인 로직 수행될 수 있도록 설정
                .loginProcessingUrl("/j_spring_security_check")
                // 이 설정을 통해 사용자가 전달한 key 값이 아이디인지 알 수 있다.(login.jsp 정의)
                .usernameParameter("uid")
                // 이 설정을 통해 사용자가 전달한 key 값이 패스워드인지 알 수 있다.(login.jsp 정의)
                .passwordParameter("upw").and()
                // 로그아웃 관련 설정
                .logout()
                // 로그아웃을 요청할 URL
                .logoutUrl("/logout")
                .logoutSuccessHandler(logoutSuccessHandler)
                .invalidateHttpSession(true)
                // 로그아웃 성공시 보낼 페이지 설정
                .logoutSuccessUrl("/").and()
                // 로그인 프로세스가 진행될 provider 설정
                .authenticationProvider(authProvider);
        
    }
    
}
