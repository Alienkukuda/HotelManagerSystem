package com.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;

@Entity
public class Hotel_city implements Serializable{
	private String h_id;
	private String h_password;
	private String h_name;
	private String h_address;
	private String h_intro;//¼ò½é
	private String h_phone;
	private String h_license;
	private String ci_name;
	private String h_picture;
	public Hotel_city(){}
	public Hotel_city(String h_id) {
		super();
		this.h_id = h_id;
	}
	public Hotel_city(String h_id, String h_password, String h_name,
			String h_address, String h_intro, String h_phone, String h_license,
			String ci_name, String h_picture) {
		super();
		this.h_id = h_id;
		this.h_password = h_password;
		this.h_name = h_name;
		this.h_address = h_address;
		this.h_intro = h_intro;
		this.h_phone = h_phone;
		this.h_license = h_license;
		this.ci_name = ci_name;
		this.h_picture = h_picture;
	}
	public String getH_id() {
		return h_id;
	}
	public void setH_id(String h_id) {
		this.h_id = h_id;
	}
	public String getH_password() {
		return h_password;
	}
	public void setH_password(String h_password) {
		this.h_password = h_password;
	}
	public String getH_name() {
		return h_name;
	}
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	public String getH_address() {
		return h_address;
	}
	public void setH_address(String h_address) {
		this.h_address = h_address;
	}
	public String getH_intro() {
		return h_intro;
	}
	public void setH_intro(String h_intro) {
		this.h_intro = h_intro;
	}
	public String getH_phone() {
		return h_phone;
	}
	public void setH_phone(String h_phone) {
		this.h_phone = h_phone;
	}
	public String getH_license() {
		return h_license;
	}
	public void setH_license(String h_license) {
		this.h_license = h_license;
	}
	public String getCi_name() {
		return ci_name;
	}
	public void setCi_name(String ci_name) {
		this.ci_name = ci_name;
	}
	public String getH_picture() {
		return h_picture;
	}
	public void setH_picture(String h_picture) {
		this.h_picture = h_picture;
	}

}
