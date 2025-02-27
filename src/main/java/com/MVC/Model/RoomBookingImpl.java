package com.MVC.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class RoomBookingImpl {
	private Connection con;
	
	public RoomBookingImpl() {
		// TODO Auto-generated constructor stub
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resort", "root", "Ravana2525");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public boolean Book(roomBooking r) {
		PreparedStatement ps=null;
		int res = 0;
		ArrayList<Integer> list = r.getRoomNos();
		try {
				Statement st = null;
		
				ps=con.prepareStatement("INSERT INTO roombooking VALUES (0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'Booked', SYSDATE())");
				ps.setInt(1, r.getUID());
				ps.setString(2, r.getuName());
				ps.setString(3, r.getRoomType());
				ps.setInt(4, r.getTotalRoom());
				
				String roomNos = list.toString().replaceAll("[\\[\\]]", "");
				ps.setString(5, roomNos);
				ps.setInt(6, r.getTotalDays());
				ps.setDate(7, r.getCheckIn());
				ps.setDate(8, r.getCheckOut());
				ps.setInt(9,r.getTotalAmount());
				ps.setString(10, r.getPayType());
				
				res = ps.executeUpdate();
				
				
				
				
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
			if(res>0) {
				return true;
			}else {
				return false;
			}
		
	}
	

	public int getDays(String CheckIn, String CheckOut) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		int days = 0;
		
		try {
			ps= con.prepareStatement("SELECT DATEDIFF(?,?) as days ;");
			ps.setString(1, CheckOut);
			ps.setString(2, CheckIn);
			rs=ps.executeQuery();
			if(rs.next()) {
				days = rs.getInt("Days");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return days;
	}
	
	public ArrayList<roomBooking> getAllRoomBooking(){
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<roomBooking> list = new ArrayList<>();
		
		try {
			ps = con.prepareStatement("select * from roombooking;");
			rs = ps.executeQuery();
			while (rs.next()) {
			roomBooking r = new roomBooking();
			
			r.setBID(rs.getInt("BID"));
			r.setuName(rs.getString("uName"));
			r.setRoomType(rs.getString("room_Type"));
			r.setRoomsBooked(rs.getString("RNos"));
			r.setTotalRoom(rs.getInt("totalRooms"));
			r.setTotalDays(rs.getInt("noDays"));
			r.setCheckIn(rs.getDate("CheckIN"));
			r.setCheckOut(rs.getDate("CheckOut"));
			r.setBookingDate(rs.getDate("BookingDate"));
			r.setTotalAmount(rs.getInt("totalAmount"));
			r.setStatus(rs.getString("status"));
			
			
			list.add(r);
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	public ArrayList<roomBooking> getRoomBooking(int UID){
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<roomBooking> list = new ArrayList<>();
		
		try {
			ps = con.prepareStatement("select * from roombooking where UID = ?;");
			ps.setInt(1, UID);
			rs = ps.executeQuery();
			while (rs.next()) {
			roomBooking r = new roomBooking();
			
			r.setBID(rs.getInt("BID"));
			r.setuName(rs.getString("uName"));
			r.setRoomType(rs.getString("room_Type"));
			r.setRoomsBooked(rs.getString("RNos"));
			r.setTotalRoom(rs.getInt("totalRooms"));
			r.setTotalDays(rs.getInt("noDays"));
			r.setCheckIn(rs.getDate("CheckIN"));
			r.setCheckOut(rs.getDate("CheckOut"));
			r.setBookingDate(rs.getDate("BookingDate"));
			r.setTotalAmount(rs.getInt("totalAmount"));
			r.setStatus(rs.getString("status"));
			
			
			list.add(r);
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean updateRoomBookingToCancel(int BID) {
		int count=0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("update  roombooking  set status ='Cancelled'where BID="+BID+";");
			if (count > 0) {
				status = "success";
			} else {
				status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (count > 0) {
			return true;
		} else {
			return false;
		}
		
	}
	
	
	

}
