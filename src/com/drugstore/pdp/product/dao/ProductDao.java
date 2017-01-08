package com.drugstore.pdp.product.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.drugstore.pdp.dao.UtilityDao;
import com.drugstore.pdp.product.entity.ProductInfo;


@Repository
public class ProductDao {

	@Autowired
	private SessionFactory factory;
	
	@Autowired
	private UtilityDao utilityDao;
	
	@SuppressWarnings("unchecked")
	public List<ProductInfo> searchProductByProductName(String str){
		List<ProductInfo> listOfProduct=null;
			Session session=	factory.openSession();
			if(str!=null && !str.equals("")){
				listOfProduct=	session.createCriteria(ProductInfo.class)
								.add(Restrictions.like("productName", str, MatchMode.START))
								.list();
			}
		return listOfProduct;
	}
	
	
	public void AddProduct(ProductInfo productInfo){
		utilityDao.saveObject(productInfo);
	}
}
