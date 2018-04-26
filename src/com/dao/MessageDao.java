package com.dao;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;



import com.entity.Message;
@Component("messageDao") 
@Service @Transactional
public class MessageDao {
	@Resource SessionFactory factory;

	
	public boolean addMessage(Message message){
		factory.getCurrentSession().save(message);
		return true;
	}
	public SessionFactory getFactory() {
		return factory;
	}
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	public void deleteMessage(int... me_ids) {
		for(int me_id : me_ids){
			factory.getCurrentSession().delete(factory.getCurrentSession().load(Message.class, me_id));
		}
	}
	public void updateMessage(Message message) {
		factory.getCurrentSession().merge(message);//saveOrUpdate
	}
	public Message findMessage(int me_id) {
		return (Message)factory.getCurrentSession().get(Message.class, me_id);
	}
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Message> query(String r_id) {		
		 Query query=factory.getCurrentSession().createQuery("from Message as m where m.receive_id=:re_id");
		 query.setString("re_id", r_id);
		 return query.list();
	}
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Message> list()
	{
		Query query=factory.getCurrentSession().createQuery("from Message");
		return query.list();
	}
}
