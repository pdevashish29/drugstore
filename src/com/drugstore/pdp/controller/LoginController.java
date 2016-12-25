package com.drugstore.pdp.controller;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drugstore.pdp.dao.LoginDao;
import com.drugstore.pdp.entity.Address;
import com.drugstore.pdp.entity.User;
import com.drugstore.pdp.entity.UserRole;
import com.drugstore.pdp.util.ApplicationConstant;
import com.drugstore.pdp.util.DateUtility;

@Controller
public class LoginController {
	@Autowired
	private LoginDao loginDao;
	
	@Autowired
	private SessionFactory factory;
	
	
	@RequestMapping(value={"/","/handleLogin"},method={RequestMethod.GET})
	public String handle(HttpSession session){
		if(session.getAttribute(ApplicationConstant.LOGIN_SESSION)!=null){
			return "sales/sale";
		}else{
			return "login";
		}
	}
	
	
	
	@RequestMapping(value="/handleLogin",method={RequestMethod.POST})
	public String handleLogin(@RequestParam(value="userName" ,required=false, defaultValue="xx" )String userName, @RequestParam(value="password", required=false, defaultValue="xx")String password, HttpSession session, Model model){
		User user=null;
		
		if(!userName.equals("xx") && !password.equals("xx")){
			user=loginDao.getUser(userName);
			if(user!=null){
				if(user.getPassword().equals(password.trim())){
					session.setAttribute(ApplicationConstant.LOGIN_SESSION, user);
					return "sales/sale";
				}else{
					model.addAttribute(ApplicationConstant.LOGIN_MESSAGE, "Invalid credentials");
					session.setAttribute(ApplicationConstant.LOGIN_SESSION, null);
					return "login";
					
				}
			}else{
				model.addAttribute(ApplicationConstant.LOGIN_MESSAGE, "user does not exit");
				session.setAttribute(ApplicationConstant.LOGIN_SESSION, null);
				return "login";
			}
		}else{
			model.addAttribute(ApplicationConstant.LOGIN_MESSAGE, "please provides valid credentials");
			session.setAttribute(ApplicationConstant.LOGIN_SESSION, null);
			return "login";
		}
	
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "login";
	}

	
}


