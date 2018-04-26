package com.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.dao.MessageDao;
import com.entity.Message;
import com.opensymphony.xwork2.ActionContext;

public class MessageAction {
	private Message message;
	private MessageDao messageDao;
	String receive_id;
	String me_text;
	public String getReceive_id() {
		return receive_id;
	}
	public void setReceive_id(String receive_id) {
		this.receive_id = receive_id;
	}
	public String getMe_text() {
		return me_text;
	}
	public void setMe_text(String me_text) {
		this.me_text = me_text;
	}
	public String register(){
		messageDao.addMessage(message);
		return "success";
	}
	public String add()
	{
		Message m=new Message();
		String s_id=(String)ActionContext.getContext().getSession().get("id");//�����id����session
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		m.setSend_id(s_id);
		m.setMe_text(me_text);
		m.setReceive_id(receive_id);
		m.setMe_time(time);
		messageDao.addMessage(m);
		return "add_success";
	}

	public String delete(){
		messageDao.deleteMessage(message.getMe_id());
		return "delete_success";
	}
	public String update(){
		messageDao.updateMessage(message);
		return "success";
	}
	public String findc(){
		Message c = messageDao.findMessage(message.getMe_id());
		System.out.print(c.getMe_id());
		return "success";
	}
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public MessageDao getMessageDao() {
		return messageDao;
	}
	@Resource
	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}
	public String queryMessage()
	{
		String r_id=(String)ActionContext.getContext().getSession().get("id");
		List<Message> m_list=messageDao.query(r_id);
		ActionContext.getContext().getSession().put("m_list", m_list);
		return "showMessageList";
	}
	public String list()
	{
		List<Message> ma_list=messageDao.list();
		ActionContext.getContext().getSession().put("ma_list", ma_list);
		return "messageList";
	}
}
