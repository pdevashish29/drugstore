package com.drugstore.pdp.product.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.drugstore.pdp.product.dao.ProductDao;
import com.drugstore.pdp.product.entity.ProductInfo;
import com.fasterxml.jackson.databind.util.BeanUtil;

@RestController
public class ProductRestController {
	
	@Autowired
	private ProductDao productDao;
	@RequestMapping(value ="/productInfo", method=RequestMethod.GET)
	public List<ProductInfo> searchProductByProductName(@RequestParam(value="str",required=false) String str){
	List<ProductInfo> list=	productDao.searchProductByProductName(str);
		List<ProductInfo> finalList = new ArrayList<ProductInfo>();
		if(list!=null && !list.isEmpty()){
		for(ProductInfo p1 : list){
				p1.setSearchKeyOfProduct(p1.getProductName()+"&nbsp; "+p1.getProductCategoryName() +"&nbsp;"+p1.getCompanyName());
				finalList.add(p1);
			}
		}else{
			ProductInfo info = new ProductInfo();
			info.setSearchKeyOfProduct("NoRecords..");
			finalList.add(info);
		}
		return finalList;
	}

}
