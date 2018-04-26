package com.dao;

import java.util.*;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Hotel_city;
import com.entity.Hotel_room;

@Component("hotel_cityDao")
@Service @Transactional
public class Hotel_cityDao {

@Resource SessionFactory factory;

	public SessionFactory getFactory() {
		return factory;
	}
	
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
		
	public String login(String h_id,String h_password){
		String hql = "from Hotel_city as h where h.h_id=:hh_id";
		Query query = factory.getCurrentSession().createQuery(hql);
		query.setString("hh_id", h_id);
		List result = query.list();
		Iterator it = result.iterator();
		while(it.hasNext()){
			Hotel_city h = (Hotel_city)it.next();
			if(h.getH_password().equals(h_password)){
					return "login_success";
				}
		}
			return "login_fail";
	}
	
	public boolean addHotel_cityOrUpdate(Hotel_city hotel_city){
		factory.getCurrentSession().saveOrUpdate(hotel_city);
		return true;
	}

	public Hotel_city findHotel_city(String string) {
		// TODO Auto-generated method stub
		
		return (Hotel_city)factory.getCurrentSession().get(Hotel_city.class, string);
	}

	public List<Hotel_room> findHotel_room(String h_id) {
		// TODO Auto-generated method stub
		String hql = "from Hotel_room as hr where hr.hotel_city.h_id=:hh_id";
		Query query = factory.getCurrentSession().createQuery(hql);
		query.setString("hh_id", h_id);
		List result = query.list();
		return result;
	}
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Hotel_city> list() {		
		return factory.getCurrentSession().createQuery("from Hotel_city").list();
	}	
	public void deleteHotel_city(String... h_ids)
	{
		for(String h_id:h_ids)
		{
			factory.getCurrentSession().delete(factory.getCurrentSession().load(Hotel_city.class, h_id));
		}
	}
}
