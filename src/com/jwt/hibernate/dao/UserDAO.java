package com.jwt.hibernate.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.jwt.hibernate.bean.User;

public class UserDAO {
	
	List<User> allUsers = new ArrayList<User>();

	public void userOperation(int id, String name, String email,
			String phone, String dob, String city,String button) {
		try {
			// 1. configuring hibernate
			Configuration configuration = new Configuration().configure();

			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			// 3. Get Session object
			Session session = sessionFactory.openSession();

			// 4. Starting Transaction
			Transaction transaction = session.beginTransaction();
			
			User user = new User();
			User userBean = (User)session.get(User.class, id); 
			if (!(userBean==null)) {
				user = (User)session.get(User.class, id);
			}
			
			user.setName(name);
			user.setEmail(email);
			user.setCity(city);
			user.setDob(dob);
			user.setPhone(phone);
			
			// 5. Insert/Update/Delete new record into User table
			if (!(userBean==null)) {
				if ("edit".equals(button)) {
	        		 System.out.println("Editing student record with ID : , "+id);
	        		 session.update(user); 
	    	        }else if ("delete".equals(button)) {
	    	        	System.out.println("Deleting student record with ID : , "+id);
	    	        	user.setId(id);
	    	        	session.delete(user); 
	    	        }
			}else {
				user.setId(id);
				session.save(user);
			}
			
			transaction.commit();
			
			System.out.println("\n\n Details Added \n");

		} catch (HibernateException e) {
			System.out.println(e.getMessage());
			System.out.println("error");
		}
		
	}
		
		
		 @SuppressWarnings("unchecked")
		public List<User> getUsers() {
			 
				Configuration configuration = new Configuration().configure();

				SessionFactory sessionFactory = configuration.buildSessionFactory();

				Session session = sessionFactory.openSession();

				Transaction t = session.beginTransaction();
			 	
		        allUsers = (List<User>)session.createQuery("from User").list();
		        t.commit();
		        session.close();
		        System.out.print(allUsers);
		        return allUsers;
		    }
		 
}
