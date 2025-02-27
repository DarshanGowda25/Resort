package com.MVC.Model;

import java.sql.Date;
import java.util.ArrayList;

public class roomBooking {
	private int BID;
	private int  UID;
	private String uName;
	private String roomType;
	private int totalRoom;
	private ArrayList<Integer> roomNos;
	private int totalDays;
	private  Date checkIn;
	private Date checkOut;
	private int totalAmount;
	private String payType;
	private String status;
	private Date BookingDate;
	private String RoomsBooked;
	public int getBID() {
		return BID;
	}
	public void setBID(int bID) {
		BID = bID;
	}
	public int getUID() {
		return UID;
	}
	public void setUID(int uID) {
		UID = uID;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public int getTotalRoom() {
		return totalRoom;
	}
	public void setTotalRoom(int totalRoom) {
		this.totalRoom = totalRoom;
	}
	public ArrayList<Integer> getRoomNos() {
		return roomNos;
	}
	public void setRoomNos(ArrayList<Integer> roomNos) {
		this.roomNos = roomNos;
	}
	public int getTotalDays() {
		return totalDays;
	}
	public void setTotalDays(int totalDays) {
		this.totalDays = totalDays;
	}
	public Date getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}
	public Date getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getBookingDate() {
		return BookingDate;
	}
	public void setBookingDate(Date bookingDate) {
		BookingDate = bookingDate;
	}
	public String getRoomsBooked() {
		return RoomsBooked;
	}
	public void setRoomsBooked(String roomsBooked) {
		RoomsBooked = roomsBooked;
	}
	
	
	
}