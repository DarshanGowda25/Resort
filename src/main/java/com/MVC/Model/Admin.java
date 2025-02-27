package com.MVC.Model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jakarta.servlet.http.HttpSession;

public class Admin {
	private Connection con;
	
	
	public Admin() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/resort","root","Ravana2525" );
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
     }
	
	public String registration(String name,long phone,String email,int age,String gender,String job,int sal,String address) {
		PreparedStatement ps=null;
		String status="";
		String query="SELECT * FROM employee WHERE phone='"+phone + "'or email='"+email+"';";
		try {
			Statement st = null;
			ResultSet rs = null;
			st=con.createStatement();
			rs=st.executeQuery(query);
			boolean b = rs.next();
			if(b) {
				status="existed";
			}
			else {
				ps=con.prepareStatement("insert into employee values(0,?,?,?,?,?,?,now(),?,'xxx',?);");
				ps.setString(1, name);
				ps.setLong(2, phone);
				ps.setString(3, email);
				ps.setInt(4, age);
				ps.setString(5, gender);
				ps.setString(6, job);
				ps.setInt(7, sal);
				ps.setString(8, address);
				
				int a=ps.executeUpdate();
				if(a>0) {
					status="success";
				}else {
					status="failure";
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return status;

	}
	public Employee login(String email, String pass) {
	    Employee emp = null;
	    String query = "SELECT * FROM employee WHERE EMAIL = ? AND Password = ?";

	    try {
	    	PreparedStatement ps = con.prepareStatement(query);
	        ps.setString(1, email);
	        ps.setString(2, pass);
	        
	        ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                emp = new Employee();
	                emp.setId(rs.getInt("id"));
	                emp.setName(rs.getString("name"));  
	                emp.setEmail(rs.getString("email")); 
	                
	            }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	   
	    return emp; 
	}

	
	public ArrayList<Employee> getEmployee() {
		ArrayList<Employee> al = new ArrayList<Employee>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select *,date_format(DOJ,'%d %b,%Y') as date1 from employee where Id not in(1);";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Employee e=new Employee(); // 1..r---db 2.. pass the data or value to Employee class set method
				e.setId(rs.getInt("Id"));
				e.setName(rs.getString("Name"));
				e.setPhone(rs.getLong("Phone"));
				e.setEmail(rs.getString("Email"));
				e.setAge(rs.getInt("Age"));
				e.setGender(rs.getString("Gender"));
				e.setJob(rs.getString("JOB"));
				e.setDoj(rs.getString("date1"));
				e.setSal(rs.getInt("Sal"));
				e.setAddress(rs.getString("Address"));
				al.add(e);;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
	public String delete(int id) {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from employee where " + "Id='" + id + "'");
			if (count > 0) {
				status = "success";
			} else {
				status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	
	
	//room
	
	public String roomRegistration(String bedType,int price,String room_img) {
		PreparedStatement ps=null;
		String status="";
		
		try {
			
				
				ps=con.prepareStatement("insert into room values(0,'available','clean',?,?,?,?);");
				ps.setInt(1, price);
				ps.setString(2, bedType);
				ps.setString(3, room_img);
				String date = "1111-11-11";
				Date d = Date.valueOf(date);
				ps.setDate(4, d);
				
				
				
				int a=ps.executeUpdate();
				if(a>0) {
					status="success";
				}else {
					status="failure";
				}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return status;

	}
	
	public ArrayList<Integer> getRoomId(String roomType, int noRooms , String checkIn) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Integer> ids = new ArrayList<>();
		
		try {
			ps = con.prepareStatement("select * from room where  bed_type=? and accupied_till <= ? limit ?;");
			ps.setString(1, roomType);
			ps.setString(2, checkIn);
			ps.setInt(3, noRooms);
			rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				ids.add(id);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ids;
	}
	
	public ArrayList<Room> getRooms(){
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Room> list = new ArrayList<>();
		
		try {
			ps = con.prepareStatement("select * from room;");
			rs = ps.executeQuery();
			while (rs.next()) {
			Room r = new Room();
			r.setRoomNo(rs.getInt("room_no"));
			
			r.setCleanStatus(rs.getString("clean_status"));
			r.setPrice(rs.getInt("price"));
			r.setBedtype(rs.getString("bed_type"));
			r.setRoomImg(rs.getString("room_img"));
			r.setAccupiedTill(rs.getDate("accupied_till"));
			list.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public String deleteRoom(int roomNo) {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from room where " + "room_no='" + roomNo + "'");
			if (count > 0) {
				status = "success";
			} else {
				status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public String updateRoom(int roomNo,String bedType,int price) {
		int count=0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("update  room  set bed_type ='"+bedType+"', price='"+price+"' where room_no="+roomNo+";");
			if (count > 0) {
				status = "success";
			} else {
				status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
		
	}
	
	public boolean updateAccupiedTill(int roomNo,Date accupied_Till) {
		
		Statement st = null;
		int res = 0;
		try {
			
			st = con.createStatement();
			res = st.executeUpdate("update  room  set accupied_till ='"+accupied_Till+"' where room_no="+roomNo+";");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (res > 0) {
			return true;
		} else {
			return false;
		}
		
	}
	
	//Contact
	
	public ArrayList<Contact> getContacts(){
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Contact> list = new ArrayList<>();
		
		try {
			ps = con.prepareStatement("select * from contact;");
			rs = ps.executeQuery();
			while (rs.next()) {
			Contact c= new Contact();
			c.setId(rs.getInt(1));
			c.setName(rs.getString(2));
			c.setPhone(rs.getLong(3));
			c.setEmail(rs.getString(4));
			c.setAddress(rs.getString(5));
			c.setMsg(rs.getString(6));
			
			
			list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	

}
	
