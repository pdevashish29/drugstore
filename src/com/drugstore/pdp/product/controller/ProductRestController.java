package com.drugstore.pdp.product.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import oracle.net.aso.p;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.drugstore.pdp.entity.User;
import com.drugstore.pdp.product.dao.ProductDao;
import com.drugstore.pdp.product.entity.ProductInfo;
import com.drugstore.pdp.util.DateUtility;
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
	
	
	
	@RequestMapping(value="/addProductInfo", method=RequestMethod.POST)
	public @ResponseBody ProductInfo addProductInfo(@RequestBody Map<String , String> map){
		
		ProductInfo productInfo=new ProductInfo();
		
		
		productInfo.setProductName(map.get("productName"));
		productInfo.setProductCategoryName(map.get("productCategoryName"));
		productInfo.setQuantity(Long.parseLong(map.get("quantity")));
		productInfo.setCostPrice(Float.parseFloat(map.get("costPrice")));
		productInfo.setSellingPrice(Float.parseFloat(map.get("sellingPrice")));
		productInfo.setExpDate(DateUtility.getDate(map.get("expDate"), "dd/MM/yyyy"));
		productInfo.setMfgDate(DateUtility.getDate(map.get("mfgDate"), "dd/MM/yyyy"));
		productInfo.setPackaging(map.get("packaging"));
		productInfo.setCompanyName(map.get("companyName"));
		
		
				//productInfo.setId(101);
				productInfo.setCreatedBy("1");
				productInfo.setCreationDate(new Date());
				productInfo.setDeleteFlag('N');
				productInfo.setInvalidFlag('N');
				productInfo.setLastUpdatedBy("1");
				productInfo.setLastUpdatedDate(new Date());
				
				productDao.AddProduct(productInfo);
				
		
		
		return productInfo;
	}

}
