package com.ajai.crm;

import java.util.List;


import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class CustomerServiceImpl implements CustomerService{
	
	private SessionFactory sessionFactory;

	// create session
	private Session session;

	@Autowired
	public CustomerServiceImpl(SessionFactory sessionFactory)
	{
		this.sessionFactory=sessionFactory;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			session = sessionFactory.openSession();
		}

	}

	@Transactional
	public List<Customer> findAllCustomer() {
		Transaction tx = session.beginTransaction();
		List<Customer> cList = session.createQuery("from Customer").list();
		tx.commit();
		return cList;
	}

	@Transactional
	public void saveCustomerServ(Customer c) {
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(c);
		tx.commit();
	}

	@Transactional
	public Customer searchCustomerServ(int id) {
		Transaction tx = session.beginTransaction();
		Customer c = session.get(Customer.class, id);
 		tx.commit();
		return c;
	}

	@Transactional
	public void deleteCustomerServ(int id) {
		Transaction tx = session.beginTransaction();
		Customer c = session.get(Customer.class, id);
		session.delete(c);
 		tx.commit();
	}

	@Transactional
	public List<Customer> searchCustomerByNameCustomerServ(String firstName) {
		Transaction tx = session.beginTransaction();
		String query = "from Customer where firstName like '%" + firstName + "%'";
		List<Customer> cList = session.createQuery(query).list();
 		tx.commit();		
 		return cList;
	}
	
	

}
