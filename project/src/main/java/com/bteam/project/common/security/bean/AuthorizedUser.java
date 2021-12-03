package com.bteam.project.common.security.bean;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.lang.annotation.RetentionPolicy;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;

@Target({java.lang.annotation.ElementType.PARAMETER, java.lang.annotation.ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@AuthenticationPrincipal
public @interface AuthorizedUser {}