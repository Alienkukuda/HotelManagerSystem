package com.dao;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Hotel_room;
import com.entity.Manager;

@Component("managerDao") 
@Service @Transactional
public class ManagerDao {
	@Resource SessionFactory factory;

	public SessionFactory getFactory() {
		return factory;
	}

	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	public String login(String m_id,String m_password){
		String hql = "from Manager as m where m.m_account=:mm_id";
		Query query = factory.getCurrentSession().createQuery(hql);
		query.setString("mm_id", m_id);
		List result = query.list();
		Iterator it = result.iterator();
		while(it.hasNext()){
			Manager m = (Manager)it.next();
			if(m.getM_password().equals(m_password)){
					return "login_success";
				}
		}
			return "login_fail";
	}
	public boolean addOrUpdateManager(Manager manager){
		factory.getCurrentSession().saveOrUpdate(manager);
		return true;
	}
	public void deleteManager(int... m_ids) {
		for(int m_id : m_ids){
			factory.getCurrentSession().delete(factory.getCurrentSession().load(Manager.class, m_id));
		}
	}
	public Manager findManager(int m_id) {
		return (Manager)factory.getCurrentSession().get(Manager.class, m_id);
	}
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Manager> list() {		
		return factory.getCurrentSession().createQuery("from Manager").list();
	}
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public Manager findName(String id)
	{
		Query query=factory.getCurrentSession().createQuery("from Manager as ma where ma.m_account=:m_ac");
		 query.setString("m_ac", id);
		 List m = query.list();
		 return (Manager)m.get(0);
	}
}
