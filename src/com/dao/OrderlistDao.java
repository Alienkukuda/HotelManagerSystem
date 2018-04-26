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
import com.entity.Orderlist;

@Component("orderlistDao") 
@Service @Transactional
public class OrderlistDao {
	
	@Resource SessionFactory factory;

	public SessionFactory getFactory() {
		return factory;
	}

	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	public boolean addOrUpdateorderlist(Orderlist orderlist){
		factory.getCurrentSession().saveOrUpdate(orderlist);
		return true;
	}
	public List<Orderlist> findOrderlistCustomer(String c_id){
		String hql="from Orderlist as o where o.customer.c_id=?";
		Query query = factory.getCurrentSession().createQuery(hql);
		query.setString(0, c_id);
		List result = query.list();
		return result;
	}
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Orderlist> findOrderlistHotel(int r_no){
			String hql="from Orderlist as o where o.hotel_room.r_no=?";
			Query query = factory.getCurrentSession().createQuery(hql);
			query.setInteger(0, r_no);
			List<Orderlist> result = query.list();
		return result;
	}
	public Orderlist findOrderlistById(int od_id){
		return (Orderlist)factory.getCurrentSession().get(Orderlist.class, od_id);
	}
	public void deleteOrderlist(int... od_ids){
		for(int od_id:od_ids)
		{
			factory.getCurrentSession().delete(factory.getCurrentSession().load(Orderlist.class, od_id));
		}
	}
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Orderlist> list(){
		Query query=factory.getCurrentSession().createQuery("from Orderlist");
		return query.list();
	}
}
