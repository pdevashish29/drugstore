package com.drugstore.pdp.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.drugstore.pdp.entity.User;


@Repository
public class LoginDao {

	
	@Autowired
	private SessionFactory factory;
	
	
	@SuppressWarnings({ "unchecked", "unused" })
	public User getUser(String userName){
			User user = null;
			Session session=null;
			List<User> users=null;
			try{
			session = factory.openSession();
			user=	(User) session.createCriteria(User.class)
					   .add(Restrictions.eq("userName", userName))
					   .add(Restrictions.eqOrIsNull("deleteFlag", "N"))
					   .add(Restrictions.eq("invalidFlag","N"))
					   .uniqueResult();
				/*if(user!=null && !users.isEmpty()){
					user= users.get(0);
				}*/
			}catch(Exception e){
				e.printStackTrace();
			}finally{
			if(session!=null){
				session.close();
			}
			}
		
		return user;
	}

	

}
