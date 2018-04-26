package com.entity;

import javax.persistence.Entity;

@Entity
public class Manager {
	private int m_id;
	private String m_account;
	private String m_password;
	private String m_name;
	public Manager(){}
	public Manager(int m_id, String m_account, String m_password, String m_name) {
		super();
		this.m_id = m_id;
		this.m_account = m_account;
		this.m_password = m_password;
		this.m_name = m_name;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_account() {
		return m_account;
	}
	public void setM_account(String m_account) {
		this.m_account = m_account;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	
}