package com.entity;
import javax.persistence.Entity;
import com.entity.Hotel_city;
@Entity
public class Hotel_room implements java.io.Serializable{
	private int r_no;
	private String r_id;
	private Hotel_city hotel_city;
	private String r_name;
	private int r_status;//״̬
	private int r_price;
	public Hotel_room(){}
	public Hotel_room(int r_no) {
		super();
		this.r_no = r_no;
	}
	public Hotel_room(int r_no, String r_id, Hotel_city hotel_city, String r_name, int r_status, int r_price) {
		super();
		this.r_no = r_no;
		this.r_id = r_id;
		this.hotel_city=hotel_city;
		this.r_name = r_name;
		this.r_status = r_status;
		this.r_price = r_price;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public Hotel_city getHotel_city() {
		return hotel_city;
	}
	public void setHotel_city(Hotel_city hotel_city) {
		this.hotel_city = hotel_city;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public int getR_status() {
		return r_status;
	}
	public void setR_status(int r_status) {
		this.r_status = r_status;
	}
	public int getR_price() {
		return r_price;
	}
	public void setR_price(int r_price) {
		this.r_price = r_price;
	}
	
}