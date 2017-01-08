package com.drugstore.pdp.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public class UtilityDao {
	
	@Autowired
	private SessionFactory factory;
	
	public void saveObject(Object object){
		Session session = null;
		Transaction tx = null;
		try {
			session= factory.openSession();
			tx= session.beginTransaction();
			session.save(object);
			tx.commit();

		} catch (DataAccessException e) {
			e.printStackTrace();
			tx.rollback();
		}catch (Exception e) {
		}finally{
			if(session!=null)
				session.close();
		}
			
		
		
	}

}
