package com.MVC.Model;

import java.sql.Date;

public class Room {
	
	private int roomNo;

	private String cleanStatus;
	private int price;
	private String bedtype;
	private String roomImg;
	private Date AccupiedTill;
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getCleanStatus() {
		return cleanStatus;
	}
	public void setCleanStatus(String cleanStatus) {
		this.cleanStatus = cleanStatus;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getBedtype() {
		return bedtype;
	}
	public void setBedtype(String bedtype) {
		this.bedtype = bedtype;
	}
	public String getRoomImg() {
		return roomImg;
	}
	public void setRoomImg(String roomImg) {
		this.roomImg = roomImg;
	}
	public Date getAccupiedTill() {
		return AccupiedTill;
	}
	public void setAccupiedTill(Date accupiedTill) {
		this.AccupiedTill = accupiedTill;
	}
	

}
