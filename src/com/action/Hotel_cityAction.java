package com.action;


import java.io.*;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.Hotel_cityDao;
import com.entity.Hotel_city;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Hotel_cityAction{
	private Hotel_city hotel_city;
	private Hotel_cityDao hotel_cityDao;
	private String h_name;
	private File licensefile;
	private String licensefileFileName;
	private File picture;
	private String pictureFileName;
	private String contentType;

	public String login(){
		if(hotel_cityDao.login((String)ActionContext.getContext().getSession().get("id"),(String)ActionContext.getContext().getSession().get("password")).equals("login_success")){
			Hotel_city h = hotel_cityDao.findHotel_city((String)ActionContext.getContext().getSession().get("id"));
			String name = h.getH_name();
			ActionContext.getContext().getSession().put("hc_name", name);
			return "login_success";
		}else 
			return "login_fail";
	}
	public String register() throws IOException, ServletException{
		int status=(int)ActionContext.getContext().getSession().get("status");
		HttpServletRequest request = ServletActionContext.getRequest();
		String city = request.getParameter("city");
		String root = ServletActionContext.getServletContext().getRealPath("/lisences");
		FileInputStream inputStream = new FileInputStream(licensefile);
		File destFile = new File(root, this.getLicensefileFileName());
		OutputStream os= new FileOutputStream(destFile);
		byte[] buffer = new byte[400];
		int length = 0;
		while ((length = inputStream.read(buffer)) > 0) {
			os.write(buffer, 0, length);
		}
		inputStream.close();
		os.close();
		if(status==2){
			String root2 = ServletActionContext.getServletContext().getRealPath("/hotel_pictures");
			FileInputStream inputStream2 = new FileInputStream(picture);
			File destFile2 = new File(root2, this.getPictureFileName());
			OutputStream os2= new FileOutputStream(destFile2);
			byte[] buffer2 = new byte[400];
			int length2 = 0;
			while ((length2 = inputStream2.read(buffer2)) > 0) {
				os2.write(buffer2, 0, length2);
			}
			inputStream2.close();
			os2.close();
			hotel_city.setH_picture("hotel_pictures/"+pictureFileName);
		}
		hotel_city.setCi_name(city);
		hotel_city.setH_license("lisences/"+licensefileFileName);
		hotel_cityDao.addHotel_cityOrUpdate(hotel_city);
		String id = hotel_city.getH_id();
		String password = hotel_city.getH_password();
		String name = hotel_city.getH_name();
		ActionContext.getContext().getSession().put("id", id);
		ActionContext.getContext().getSession().put("password", password);
		ActionContext.getContext().getSession().put("hc_name", name);
		if(status==2)
			return "register_success2";
		else
			return "register_success";
	}
	public String findHotel(){
		String id=(String)ActionContext.getContext().getSession().get("id");
		Hotel_city hc = hotel_cityDao.findHotel_city(id);
		ActionContext.getContext().getSession().put("hc", hc);
		return "showHotelInfo";
	}
	public String FindRoomsById(){
		List result = hotel_cityDao.findHotel_room(hotel_city.getH_id());
		ActionContext.getContext().getSession().put("hr_list", result);
		ActionContext.getContext().getSession().put("hc_name", h_name);
		return "find_success";
	}
	public String message(){
		String s = hotel_city.getH_id();
		ActionContext.getContext().getSession().put("ss", s);
		return "message1";
	}
	public String list()
	{
		List<Hotel_city> hc_list=hotel_cityDao.list();
		ActionContext.getContext().getSession().put("hc_list", hc_list);
		return "hotelInfo";
	}
	public String delete(){
		hotel_cityDao.deleteHotel_city(hotel_city.getH_id());
		return "delete_success";
	}
	public File getLicensefile() {
		return licensefile;
	}
	public void setLicensefile(File licensefile) {
		this.licensefile = licensefile;
	}
	public String getLicensefileFileName() {
		return licensefileFileName;
	}
	public void setLicensefileFileName(String licensefileFileName) {
		this.licensefileFileName = licensefileFileName;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public Hotel_city getHotel_city() {
		return hotel_city;
	}
	public void setHotel_city(Hotel_city hotel_city) {
		this.hotel_city = hotel_city;
	}
	public Hotel_cityDao getHotel_cityDao() {
		return hotel_cityDao;
	}
	@Resource
	public void setHotel_cityDao(Hotel_cityDao hotel_cityDao) {
		this.hotel_cityDao = hotel_cityDao;
	}
	public String getH_name() {
		return h_name;
	}
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	public File getPicture() {
		return picture;
	}
	public void setPicture(File picture) {
		this.picture = picture;
	}
	public String getPictureFileName() {
		return pictureFileName;
	}
	public void setPictureFileName(String pictureFileName) {
		this.pictureFileName = pictureFileName;
	}
	
	
}
