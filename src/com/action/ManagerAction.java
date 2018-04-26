package com.action;

import javax.annotation.Resource;

import com.dao.ManagerDao;
import com.entity.Hotel_city;
import com.entity.Manager;
import com.opensymphony.xwork2.ActionContext;

public class ManagerAction {
	private Manager manager;
	private ManagerDao managerDao;
	
	public String login(){
		return managerDao.login((String)ActionContext.getContext().getSession().get("id"),(String)ActionContext.getContext().getSession().get("password"));
	}
	public String register(){
		managerDao.addOrUpdateManager(manager);
		return "register_success";
	}public String delete(){
		managerDao.deleteManager(manager.getM_id());
		return "success";
	}
	public String findc(){
		Manager c = managerDao.findManager(manager.getM_id());
		System.out.print(c.getM_id()+" "+c.getM_name()+" ");
		return "success";
	}
	public String findManager(){
			String id=(String)ActionContext.getContext().getSession().get("id");
			Manager m = managerDao.findName(id);
			ActionContext.getContext().getSession().put("manager", m);
			return "showManagerInfo";	
	}
	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	public ManagerDao getManagerDao() {
		return managerDao;
	}
	@Resource
	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}
	
}
