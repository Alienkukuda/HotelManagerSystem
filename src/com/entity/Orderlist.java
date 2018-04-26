package com.entity;

import java.io.Serializable;

import javax.persistence.Entity;

@Entity
public class Orderlist implements Serializable{
	private int od_id;
	private Hotel_room hotel_room;
	private Customer customer;
	private String od_price;
	private String od_time;
	private String od_startdate;
	private String od_enddate;
	private String cus_review;//”√ªß∆¿¬€
	private int od_status;
	private String od_paytype;
	public Orderlist() {
		super();
	}
	public Orderlist(int od_id, Hotel_room hotel_room, Customer customer,
			String od_price, String od_time, String od_startdate,
			String od_enddate, String cus_review, int od_status,  String od_paytype) {
		super();
		this.od_id = od_id;
		this.hotel_room = hotel_room;
		this.customer = customer;
		this.od_price = od_price;
		this.od_time = od_time;
		this.od_startdate = od_startdate;
		this.od_enddate = od_enddate;
		this.cus_review = cus_review;
		this.od_status = od_status;
		this.od_paytype = od_paytype;
	}
	public int getOd_id() {
		return od_id;
	}
	public void setOd_id(int od_id) {
		this.od_id = od_id;
	}
	public Hotel_room getHotel_room() {
		return hotel_room;
	}
	public void setHotel_room(Hotel_room hotel_room) {
		this.hotel_room = hotel_room;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getOd_price() {
		return od_price;
	}
	public void setOd_price(String od_price) {
		this.od_price = od_price;
	}
	public String getOd_time() {
		return od_time;
	}
	public void setOd_time(String od_time) {
		this.od_time = od_time;
	}
	public String getOd_startdate() {
		return od_startdate;
	}
	public void setOd_startdate(String od_startdate) {
		this.od_startdate = od_startdate;
	}
	public String getOd_enddate() {
		return od_enddate;
	}
	public void setOd_enddate(String od_enddate) {
		this.od_enddate = od_enddate;
	}
	public String getCus_review() {
		return cus_review;
	}
	public void setCus_review(String cus_review) {
		this.cus_review = cus_review;
	}
	public int getOd_status() {
		return od_status;
	}
	public void setOd_status(int od_status) {
		this.od_status = od_status;
	}
	public String getOd_paytype() {
		return od_paytype;
	}
	public void setOd_paytype(String od_paytype) {
		this.od_paytype = od_paytype;
	}
}
