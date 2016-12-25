package com.drugstore.pdp.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.drugstore.pdp.entity.Address;
import com.drugstore.pdp.entity.BussinesDetails;
import com.drugstore.pdp.entity.User;
import com.drugstore.pdp.entity.UserRole;

@RestController
public class TestRestController {

	@Autowired
	private SessionFactory factory;
	
	
	
	
	
	
	
	@RequestMapping(value="/test3", method=RequestMethod.POST)
	public String  test3(){
		Session session= factory.openSession();
		
		
		return "OK";
		
	}
	
	
	
	
	@RequestMapping("/test")
	public List<User> testMe(){
		Session session= factory.openSession();
		List<User> list=session.createCriteria(User.class,"user")
					.list();	
		return list;
		
	}
	
	@RequestMapping("/test2")
	public String testMe2(){
		Session session= factory.openSession();
			
		
		
		
			User user  = new User();
			//user.setId(1); hibernate will autoGenrate the id
			user.setFirstName("Parashar");
			user.setMiddleName("devashish");
			user.setLastName("Pandey");
			user.setBussinessName("Paney Medical Hall");
			user.setGender("M");
			user.setMobileNo("9560862975");
			user.setPhoneNo("956055555");
			user.setEmail("devdewance@gmail.com");
			user.setUserName("devashish123");
			user.setPassword("devashish123");
			
			user.setCreationDate(new Date());
			user.setCreatedBy(1);
			user.setLastUpdated(new Date());
			user.setLastUpdatedBy(1);
			user.setInvalidFlag("N");
			user.setDeleteFlag("N");
			
								Address address= new Address();
								//address.setId(1);
								address.setLineNo1("1200c/10");
								address.setStreet("gali no 10");
								address.setCity("Govindpuri");
								address.setState("DELHI");
								address.setCountry("India");
								address.setZip("841234");
			user.setAddress(address);
				
					BussinesDetails bd = new BussinesDetails();
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
			
			/*UserRole userRole=(UserRole) session.get(UserRole.class, 1L);
			user.setUserRole(userRole);*/
			
			UserRole role = new UserRole();
			role.setId(7);
			role.setRoleName("SUPERADMIN");
			user.setUserRole(role);
		try {
			
			//Transaction tx =	session.beginTransaction();
				//session.save(role);
		//	tx.commit();
			return "OK";
		} catch (Exception e) {
			return e.getMessage();
		}
		
	}
}
