package com.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.dao.CustomerDao;
import com.dao.Hotel_cityDao;
import com.dao.Hotel_roomDao;
import com.dao.OrderlistDao;
import com.entity.Customer;
import com.entity.Hotel_city;
import com.entity.Hotel_room;
import com.entity.Orderlist;
import com.opensymphony.xwork2.ActionContext;

public class OrderlistAction {
	
	private Orderlist orderlist;
	private OrderlistDao orderlistDao;
	private String startdate;
	private String enddate;
	private String score_use;
	private String pay_type;
	private int r_no;
	private Hotel_cityDao hotel_cityDao;
	private Hotel_roomDao hotel_roomDao;
	private CustomerDao customerDao;
//==============================================================================
	//日期选择处理
	public String choosedate(){
		if(ActionContext.getContext().getSession().get("id")==null)
			return "no_login";
		else{
			ActionContext.getContext().getSession().put("r_no", r_no);
			return "choose";
			}
	}
//==============================================================================
	public String date_score(){
		ActionContext.getContext().getSession().put("startdate", startdate);
		ActionContext.getContext().getSession().put("enddate", enddate);
		if(score_use.isEmpty())
			score_use = "0";
		ActionContext.getContext().getSession().put("score_use", score_use);
		if(pay_type.equals("0"))
			pay_type = "在线支付";
		else
			pay_type = "到店支付";
		ActionContext.getContext().getSession().put("pay_type", pay_type);

		String id = (String)ActionContext.getContext().getSession().get("id");
		Hotel_room hotel_room = hotel_roomDao.findHotel_room((int)ActionContext.getContext().getSession().get("r_no"));
		Hotel_city hotel_city = hotel_cityDao.findHotel_city(hotel_room.getHotel_city().getH_id());
		Customer customer = customerDao.findcustomer(id);
		ActionContext.getContext().getSession().put("hotel_city", hotel_city);
		ActionContext.getContext().getSession().put("hotel_room", hotel_room);
		ActionContext.getContext().getSession().put("customer", customer);
		return "order";
	}
//==============================================================================
	public String cancel1(){
		String id = (String)ActionContext.getContext().getSession().get("id");
		String password = (String)ActionContext.getContext().getSession().get("password");
		ActionContext.getContext().getSession().clear();
		ActionContext.getContext().getSession().put("id", id);
		ActionContext.getContext().getSession().put("password", password);
		return "cancel";
	}
//==============================================================================
	public String cancel2(){
		String id = (String)ActionContext.getContext().getSession().get("id");
		String password = (String)ActionContext.getContext().getSession().get("password");
		int ocd_id = (int)ActionContext.getContext().getSession().get("ocd_id");
		int status = (int)ActionContext.getContext().getSession().get("status");
		
		if(status == 1){
			Customer c = customerDao.findcustomer(id);
			int score = (int)ActionContext.getContext().getSession().get("score");
			Orderlist o = (Orderlist)ActionContext.getContext().getSession().get("ordl");
			int score2 = Integer.parseInt(c.getC_score())-Integer.parseInt(o.getOd_price())/100+score;
			if(score2<0)
				score2 = 0;
			c.setC_score(Integer.toString(score2));
			int money = Integer.parseInt(c.getC_money())+Integer.parseInt(o.getOd_price());
			c.setC_money(Integer.toString(money));
			customerDao.addOrUpdateCustomer(c);
		}
		orderlistDao.deleteOrderlist(ocd_id);
		Hotel_room hotel_room = (Hotel_room)ActionContext.getContext().getSession().get("hotel_room_cus");
		hotel_room.setR_status(0);
		hotel_roomDao.addOrUpdateHotel_room(hotel_room);
		ActionContext.getContext().getSession().clear();
		ActionContext.getContext().getSession().put("id", id);
		ActionContext.getContext().getSession().put("password", password);
		return "cancel";
	}
//==============================================================================	
	public String affirm(){
		Hotel_room hotel_room = (Hotel_room)ActionContext.getContext().getSession().get("hotel_room");
		hotel_room.setR_status(1);
		hotel_roomDao.addOrUpdateHotel_room(hotel_room);
		Customer c = (Customer)ActionContext.getContext().getSession().get("customer");
		orderlist.setOd_price(Integer.toString((int)ActionContext.getContext().getSession().get("price")));
		orderlist.setOd_time((String)ActionContext.getContext().getSession().get("date"));
		if(orderlist.getOd_paytype().equals("在线支付")){
			String score_use = (String)ActionContext.getContext().getSession().get("score_use");
			if(Integer.parseInt(c.getC_money())<Integer.parseInt(orderlist.getOd_price())){
				orderlist.setOd_status(2);
				orderlist.setHotel_room(hotel_room);
				orderlist.setCustomer(c);
				orderlistDao.addOrUpdateorderlist(orderlist);
				return "affirm_fail";
			}
			else{
				c.setC_money(Integer.toString(Integer.parseInt(c.getC_money())-Integer.parseInt(orderlist.getOd_price())));
				c.setC_score(Integer.toString(Integer.parseInt(c.getC_score())-Integer.parseInt(score_use)+Integer.parseInt(orderlist.getOd_price())/100));
				customerDao.addOrUpdateCustomer(c);
				orderlist.setOd_status(3);
				orderlist.setHotel_room(hotel_room);
				orderlist.setCustomer(c);
				orderlistDao.addOrUpdateorderlist(orderlist);
				return "affirm_success_status2";	
			}
		}
		else{
			c.setC_score(Integer.toString(Integer.parseInt(c.getC_score())-Integer.parseInt(score_use)));
			customerDao.addOrUpdateCustomer(c);
			orderlist.setOd_status(1);
			orderlist.setHotel_room(hotel_room);
			orderlist.setCustomer(c);
			orderlistDao.addOrUpdateorderlist(orderlist);
			return "affirm_success_status1";
		}
	}
//==============================================================================
	public String pay(){
		Orderlist o = (Orderlist)ActionContext.getContext().getSession().get("ordl");
		String id = (String)ActionContext.getContext().getSession().get("id");
		Hotel_room hotel_room = (Hotel_room)ActionContext.getContext().getSession().get("hotel_room_cus");
		Customer c = customerDao.findcustomer(id);
		int score = (int)ActionContext.getContext().getSession().get("score");
		if(Integer.parseInt(c.getC_money())<Integer.parseInt(o.getOd_price())){
			return "affirm_fail";
		}else{
			c.setC_money(Integer.toString(Integer.parseInt(c.getC_money())-Integer.parseInt(o.getOd_price())));
			c.setC_score(Integer.toString(Integer.parseInt(c.getC_score())-score+Integer.parseInt(o.getOd_price())/100));
			customerDao.addOrUpdateCustomer(c);
			o.setOd_status(3);
			o.setHotel_room(hotel_room);
			o.setCustomer(c);
			orderlistDao.addOrUpdateorderlist(o);
			return "affirm_success_status2";	
		}
	}
//==============================================================================
	//评价订单处理
	public String review(){
		int ocd_id = (int)ActionContext.getContext().getSession().get("ocd_id");
		String od_review = orderlist.getCus_review();
		orderlist = orderlistDao.findOrderlistById(ocd_id);
		orderlist.setCus_review(od_review);
		orderlist.setOd_status(4);
		orderlistDao.addOrUpdateorderlist(orderlist);
		return "review";
	}
//==============================================================================
	public String list(){
		List<Orderlist> o_list=orderlistDao.list();
		ActionContext.getContext().getSession().put("o_list", o_list);
		return "orderlistInfo";
	}
//==============================================================================
	public String findHotelOrderlist(){
		String id = (String)ActionContext.getContext().getSession().get("id");
		List<Hotel_room> hr = hotel_roomDao.query(id);
		List<Orderlist> o = new ArrayList<Orderlist>();
		for(int i = 0;i<hr.size();i++){
			int r_no = hr.get(i).getR_no();
			List<Orderlist> ol = orderlistDao.findOrderlistHotel(r_no);
			for(int j = 0;j<ol.size();j++){
//				if(o.isEmpty())
//					o.set(0, ol.get(j));
//				else
					o.add(ol.get(j));
			}
		}
		ActionContext.getContext().getSession().put("h_orderlist",o);
		return "hotel_my_list";
	}
//==============================================================================
	public String od_affirm(){
		Orderlist orderlist2 = orderlistDao.findOrderlistById(orderlist.getOd_id());
		orderlist2.setOd_status(0);
		int r_no = orderlist2.getHotel_room().getR_no();
		Hotel_room hr = hotel_roomDao.findHotel_room(r_no);
		hr.setR_status(0);
		hotel_roomDao.addOrUpdateHotel_room(hr);
		orderlistDao.addOrUpdateorderlist(orderlist2);
		return "od_affirm";
	}
	public Orderlist getOrderlist() {
		return orderlist;
	}
	public void setOrderlist(Orderlist orderlist) {
		this.orderlist = orderlist;
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
	public CustomerDao getCustomerDao() {
		return customerDao;
	}
	@Resource
	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getScore_use() {
		return score_use;
	}
	public void setScore_use(String score_use) {
		this.score_use = score_use;
	}
	public String getPay_type() {
		return pay_type;
	}
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}
	public Hotel_cityDao getHotel_cityDao() {
		return hotel_cityDao;
	}
	@Resource
	public void setHotel_cityDao(Hotel_cityDao hotel_cityDao) {
		this.hotel_cityDao = hotel_cityDao;
	}
//==============================================================================
}
