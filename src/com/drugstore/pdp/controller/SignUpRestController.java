package com.drugstore.pdp.controller;

import java.util.Date;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.drugstore.pdp.entity.Address;
import com.drugstore.pdp.entity.User;
import com.drugstore.pdp.entity.UserRole;
import com.drugstore.pdp.util.DateUtility;

@RestController
public class SignUpRestController {	

	@Autowired
	private SessionFactory factory;
	
	
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public @ResponseBody User sign2(@RequestBody Map<String , String> map){
		

		User user  = new User();
		//user.setId(1); hibernate will autoGenrate the id
		user.setFirstName(map.get("fName"));
		user.setMiddleName(map.get("mName"));
		user.setLastName(map.get("lName"));
		user.setGender(map.get("gender"));
		user.setDateOfBirth(DateUtility.getDate(map.get("dateOfBirth"), "MM/dd/yyyy"));
		user.setMobileNo(map.get("mobileNo"));
		user.setPhoneNo(map.get("phoneNo"));
		user.setEmail(map.get("email"));
		user.setUserName(map.get("userName"));
		user.setPassword(map.get("password1"));
		user.setBussinessName(map.get("businessName"));
		
		user.setCreationDate(new Date());
		user.setCreatedBy(1);
		user.setLastUpdated(new Date());
		user.setLastUpdatedBy(1);
		user.setInvalidFlag("N");
		user.setDeleteFlag("N");
		
							Address address= new Address();
							//address.setId(1);
							address.setLineNo1(map.get("lineNo1"));
							address.setStreet(map.get("street"));
							address.setCity(map.get("city"));
							address.setState(map.get("state"));
							address.setCountry(map.get("country"));
							address.setZip(map.get("zip"));
		user.setAddress(address);
			
			/*	BussinesDetails bd = new BussinesDetails();
				//bd.setId(101);
				bd.setLicense1("101/101A");
				bd.setLicense2("102/102A");
				bd.setLicense3("103/103A");
				bd.setLicense4("104/104A");
				bd.setDiscountInINR(10.f);
				bd.setDiscoutInPercentage(25.02f);
				bd.setTinNo("12563289");
				bd.setNotes("notes  nai h ");
				bd.setVat(14.5f);
				bd.setOther_charges(2.5f);
				
		user.setBussinesDetails(bd);		
		*/
		Session session = factory.openSession();
		if(map.get("bussinessType").toString().equals("1")){
			
			UserRole userRole=(UserRole) session.get(UserRole.class, 1L);
			user.setUserRole(userRole);
		}
		try {
		
		Transaction tx =	session.beginTransaction();
		//session.save(user);
		tx.commit();
	} catch (Exception e) {
	}
		return user;
		
		
		
		
	}


	
	
	
	
	
}
