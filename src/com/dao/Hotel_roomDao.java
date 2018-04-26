package com.dao;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Hotel_room;
@Component("hotel_roomDao") 
@Service @Transactional
public class Hotel_roomDao {
	@Resource SessionFactory factory;
	public SessionFactory getFactory() {
		return factory;
	}
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	public boolean addOrUpdateHotel_room(Hotel_room hotel_room)
	{
		factory.getCurrentSession().saveOrUpdate(hotel_room);
		return true;
	}
	public void deleteHotel_room(int... r_nos)
	{
		for(int r_no:r_nos)
		{
			factory.getCurrentSession().delete(factory.getCurrentSession().load(Hotel_room.class, r_no));
		}
	}
	public Hotel_room findHotel_room(int r_no) {
		return (Hotel_room)factory.getCurrentSession().get(Hotel_room.class, r_no);
	}
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Hotel_room> list() {		
		return factory.getCurrentSession().createQuery("from Hotel_room").list();
	}
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Hotel_room> query(String h_id)
	{
		Query query=factory.getCurrentSession().createQuery("from Hotel_room as hr where hr.hotel_city.h_id=:hr_id");
		 query.setString("hr_id", h_id);
		 return query.list();
	}

}