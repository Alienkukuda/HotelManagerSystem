package com.entity;

import javax.persistence.Entity;

@Entity
public class Customer {
	private String c_id;
	private String c_name;
	private String c_password;
	private String c_sex;
	private String c_idnumber;//身份证
	private String c_phone;
	private String c_email;
	private String c_score;//积分
	private String c_money;//余额	
	public Customer(){}
	public Customer(String c_id) {
		super();
		this.c_id = c_id;
	}
	public Customer(String c_id, String c_name, String c_password, String c_sex, String c_idnumber, String c_phone,
			String c_email, String c_score, String c_money) 
	{
		super();
		this.c_id = c_id;
		this.c_name = c_name;
		this.c_password = c_password;
		this.c_sex = c_sex;
		this.c_idnumber = c_idnumber;
		this.c_phone = c_phone;
		this.c_email = c_email;
		this.c_score = c_score;
		this.c_money = c_money;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_password() {
		return c_password;
	}
	public void setC_password(String c_password) {
		this.c_password = c_password;
	}
	public String getC_sex() {
		return c_sex;
	}
	public void setC_sex(String c_sex) {
		this.c_sex = c_sex;
	}
	public String getC_idnumber() {
		return c_idnumber;
	}
	public void setC_idnumber(String c_idnumber) {
		this.c_idnumber = c_idnumber;
	}
	public String getC_phone() {
		return c_phone;
	}
	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}
	public String getC_email() {
		return c_email;
	}
	public void setC_email(String c_email) {
		this.c_email = c_email;
	}
	public String getC_score() {
		return c_score;
	}
	public void setC_score(String c_score) {
		this.c_score = c_score;
	}
	public String getC_money() {
		return c_money;
	}
	public void setC_money(String c_money) {
		this.c_money = c_money;
	}
	
}
