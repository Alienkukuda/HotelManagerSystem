package com.action;
import java.util.List;

import javax.annotation.Resource;

import com.dao.Hotel_cityDao;
import com.dao.Hotel_roomDao;
import com.entity.Hotel_city;
import com.entity.Hotel_room;
import com.opensymphony.xwork2.ActionContext;
public class Hotel_roomAction {
	private Hotel_room hotel_room;
	private Hotel_roomDao hotel_roomDao;
	private Hotel_cityDao hotel_cityDao;
	private int r_no;
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public Hotel_room getHotel_room() {
		return hotel_room;
	}
	public void setHotel_room(Hotel_room hotel_room) {
		this.hotel_room = hotel_room;
	}
	public Hotel_roomDao getHotel_roomDao() {
		return hotel_roomDao;
	}
	@Resource
	public void setHotel_roomDao(Hotel_roomDao hotel_roomDao) {
		this.hotel_roomDao = hotel_roomDao;
	}
	public String register(){
		String id = (String)ActionContext.getContext().getSession().get("id");
		Hotel_city hc =new Hotel_city(id);
		hotel_room.setHotel_city(hc);
		hotel_roomDao.addOrUpdateHotel_room(hotel_room);
		return "register_success";
	}
	public String delete(){
		hotel_roomDao.deleteHotel_room(r_no);
		return "delete_success";
	}
	public String queryHotel_room()
	{
		String h_id=(String)ActionContext.getContext().getSession().get("id");
		List<Hotel_room> hr_list=hotel_roomDao.query(h_id);
		ActionContext.getContext().getSession().put("hr_list", hr_list);
		return "showHotel_roomInfo";
	}
	public String find()
	{
		Hotel_room hr=hotel_roomDao.findHotel_room(r_no);
		ActionContext.getContext().getSession().put("hr", hr);
		return "updateHotel_roomInfo";
	}
}
