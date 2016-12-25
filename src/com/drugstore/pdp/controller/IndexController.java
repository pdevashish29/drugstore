package com.drugstore.pdp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	
	
	@RequestMapping("/signUp")
	public String signUpGet(){
		return "signUp";
	}
	
	
	@RequestMapping("/purchase")
	public String purchase(){
		return "sales/purchase";
	}
	
	
	
}
