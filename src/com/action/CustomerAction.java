package com.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.dao.*;
import com.entity.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CustomerAction {
	private Customer customer;
	private CustomerDao customerDao;
	private String h_name;
	private String chargetype;
	private String chargemoney;
	private OrderlistDao orderlistDao;
	private Hotel_roomDao hotel_roomDao;
	private Hotel_cityDao hotel_cityDao;

	public String login(){
		return customerDao.login((String)ActionContext.getContext().getSession().get("id"),(String)ActionContext.getContext().getSession().get("password"));
	}
	
	public String register(){
		customer.setC_money("0");
		if(customerDao.addOrUpdateCustomer(customer)==true){
			String id = customer.getC_id();
			String password = customer.getC_password();
			ActionContext.getContext().getSession().put("id", id);
			ActionContext.getContext().getSession().put("password", password);
			ActionContext.getContext().getSession().put("customer", customer);
			return "register_success";	
			}
		else
			return "register_fail";
	}
		
	public String ListHotel_city(){
		List l = customerDao.listHotel_city();
		ActionContext.getContext().getSession().put("hc_list", l);
		return "c_list";
	}

	public String FindHotel_CityByH_name(){
		List result = customerDao.findHotel_city(h_name);
		ActionContext.getContext().getSession().put("hc_list", result);
		return "c_list";
	}
	public String list()
	{
		List<Customer> c_list=customerDao.list();
		ActionContext.getContext().getSession().put("c_list", c_list);
		return "customerInfo";
	}
	public String charge(){
		Customer customer = (Customer)ActionContext.getContext().getSession().get("customer");
		customer.setC_money(Integer.toString(Integer.parseInt(customer.getC_money())+Integer.parseInt(chargemoney)));
		customerDao.addOrUpdateCustomer(customer);
		return "charge_success";
	}
	public String showorderlist(){
		String id = (String)ActionContext.getContext().getSession().get("id");
		List<Orderlist> r = orderlistDao.findOrderlistCustomer(id);
		ArrayList<Hotel_room> hr = new ArrayList<Hotel_room>();
		ArrayList<Hotel_city> hc = new ArrayList<Hotel_city>();
		for(int i = 0;i<r.size();i++){
			Hotel_room hotel_room = hotel_roomDao.findHotel_room(r.get(i).getHotel_room().getR_no());
			Hotel_city hotel_city = hotel_cityDao.findHotel_city(hotel_room.getHotel_city().getH_id());
			hr.add(hotel_room);
			hc.add(hotel_city);
		}
		ActionContext.getContext().getSession().put("hcity", hc);
		ActionContext.getContext().getSession().put("hroom", hr);
		ActionContext.getContext().getSession().put("orderlist_c",r);
		return "o_show";
	}
	public String delete(){
		customerDao.deletecustomer(customer.getC_id());
		return "delete_success";
	}
	public String getH_name() {
		return h_name;
	}

	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public CustomerDao getCustomerDao() {
		return customerDao;
	}
	
	@Resource
	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}
	public String getChargetype() {
		return chargetype;
	}

	public void setChargetype(String chargetype) {
		this.chargetype = chargetype;
	}

	public String getChargemoney() {
		return chargemoney;
	}

	public void setChargemoney(String chargemoney) {
		this.chargemoney = chargemoney;
	}

	public OrderlistDao getOrderlistDao() {
		return orderlistDao;
	}
	@Resource
	public void setOrderlistDao(OrderlistDao orderlistDao) {
		this.orderlistDao = orderlistDao;
	}
	public Hotel_roomDao getHotel_roomDao() {
		return hotel_roomDao;
	}
	@Resource
	public void setHotel_roomDao(Hotel_roomDao hotel_roomDao) {
		this.hotel_roomDao = hotel_roomDao;
	}

	public Hotel_cityDao getHotel_cityDao() {
		return hotel_cityDao;
	}
	@Resource
	public void setHotel_cityDao(Hotel_cityDao hotel_cityDao) {
		this.hotel_cityDao = hotel_cityDao;
	}
}
