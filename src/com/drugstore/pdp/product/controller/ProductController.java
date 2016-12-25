package com.drugstore.pdp.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

	@RequestMapping("/sale")
	public String daliySaleInvoice(){
		return "sales/sale";
	}
}
