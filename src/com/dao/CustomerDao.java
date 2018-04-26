package com.dao;

import java.util.*;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Customer;
import com.entity.Hotel_city;
import com.entity.Hotel_room;


@Component("customerDao") 
@Service @Transactional
public class CustomerDao {
	@Resource SessionFactory factory;

	public SessionFactory getFactory() {
		return factory;
	}

	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	public String login(String c_id,String c_password){
		String hql = "from Customer as c where c.c_id=:cc_id";
		Query query = factory.getCurrentSession().createQuery(hql);
		query.setString("cc_id", c_id);
		List result = query.list();
		Iterator it = result.iterator();
		while(it.hasNext()){
			Customer c = (Customer)it.next();
			if(c.getC_password().equals(c_password)){
					return "login_success";
				}
		}
			return "login_fail";
	}
	public Customer findcustomer(String c_id) {
		return (Customer)factory.getCurrentSession().get(Customer.class, c_id);
	}
	
	public boolean addOrUpdateCustomer(Customer customer){
			factory.getCurrentSession().saveOrUpdate(customer);
			return true;
	}
	public void deletecustomer(String... c_ids) {
		for(String c_id : c_ids){
			factory.getCurrentSession().delete(factory.getCurrentSession().load(Customer.class, c_id));
		}
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Hotel_city> findHotel_city(String h_name){
		String hql = "from Hotel_city as hc where hc.h_name like ?";
		Query query = factory.getCurrentSession().createQuery(hql);
		query.setString(0, "%"+h_name+"%");
		List result = query.list();
		return result;
	}
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Hotel_city> listHotel_city() {		
		return factory.getCurrentSession().createQuery("from Hotel_city").list();
	}
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Customer> list() {		
		return factory.getCurrentSession().createQuery("from Customer").list();
	}
}

