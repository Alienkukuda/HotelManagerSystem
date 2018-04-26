package com.action;

import com.opensymphony.xwork2.ActionContext;

public class BaseAction {
	private String type;
	private String id;
	private String password;
	public String loginforward(){
		ActionContext.getContext().getSession().put("type", type);
		ActionContext.getContext().getSession().put("id", id);
		ActionContext.getContext().getSession().put("password", password);
		return type;
	}
	public String logout(){
		ActionContext.getContext().getSession().clear();
		return "success";
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
