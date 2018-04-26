package com.entity;
import javax.persistence.Entity;

@Entity
public class Message {
	private int me_id;
	private String send_id;
	private String receive_id;
	private String me_text;
	private String me_time;
	public Message(){}
	public Message(int me_id, String send_id, String receive_id, String me_text, String me_time) {
		super();
		this.me_id = me_id;
		this.send_id = send_id;
		this.receive_id = receive_id;
		this.me_text = me_text;
		this.me_time = me_time;
	}
	public int getMe_id() {
		return me_id;
	}
	public void setMe_id(int me_id) {
		this.me_id = me_id;
	}
	public String getSend_id() {
		return send_id;
	}
	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}
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
	public String getMe_time() {
		return me_time;
	}
	public void setMe_time(String me_time) {
		this.me_time = me_time;
	}
	
}