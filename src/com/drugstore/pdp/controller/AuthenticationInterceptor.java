package com.drugstore.pdp.controller;
import javax.servlet.Registration;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.drugstore.pdp.entity.User;
import com.drugstore.pdp.util.ApplicationConstant;


@Component
public class AuthenticationInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request,
	   HttpServletResponse response, Object handler) throws Exception
	 {
		User user = (User) request.getSession().getAttribute(ApplicationConstant.LOGIN_SESSION);
		if(user == null)
		   {
		    response.sendRedirect(request.getContextPath()+"/handleLogin");
	           return false;
		   }
		  return true;
		 }
}
