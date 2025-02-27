package com.MVC.Model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class UserImpl {
	
	private Connection con;
	
	public UserImpl() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/resort","root","Ravana2525" );
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
     }
	
	public String Registration(String name,String email,long phoneNo,String gender,String location,String password) {
		PreparedStatement ps=null;
		String status="";
		String query="SELECT * FROM USER WHERE phone='"+phoneNo + "'or email='"+email+"';";
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
				ps=con.prepareStatement("insert into user values(0,?,?,?,?,?,?);");
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setLong(3, phoneNo);
				ps.setString(4, gender);
				ps.setString(5, location);
				ps.setString(6, password);
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
	
	public User login(String email,String pass) {
		User u =null;
		String query="SELECT * FROM USER WHERE EMAIL='"+email +"'and Password='"+pass+"';";

		try {
		Statement st=null;
		ResultSet rs=null;
		st=con.createStatement();
		rs=st.executeQuery(query);
		if(rs.next()) {
			u = new User();
			u.setId(rs.getInt("Id"));
			u.setName(rs.getString("name"));  
            u.setEmail(rs.getString("email")); 
            
          

			
		}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return u;
	}
	
	public ArrayList<Customer> getCustomer() {
		ArrayList<Customer> al = new ArrayList<Customer>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select * from user;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Customer c=new Customer();
				c.setId(rs.getString("id"));
				c.setName(rs.getString("name"));
				c.setEmail(rs.getString("email"));
				c.setPhone(rs.getString("phone"));
				c.setGender(rs.getString("gender"));
				c.setAddress(rs.getString("Location"));
	
				al.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
	
	//==================================================
	
	
//	
//	se.setAttribute("cname", uname);
//	se.setAttribute("email", emails);
//	se.setAttribute("id", id);
	

	

	
	public ArrayList<Activity> getActivityList(){
		ArrayList<Activity> al=new ArrayList<>();
		PreparedStatement ps=null;
		String query="select * from activity;";
		Activity a=null;
		ResultSet rs=null;
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				a=new Activity();
				a.setId(rs.getInt(1));
				a.setAname(rs.getString(2));
				a.setImage(rs.getString(3));
				a.setAbout(rs.getString(4));
				a.setPrice(rs.getInt(5));
				al.add(a);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
	public ArrayList<Activity> getActivityList(int id){
		ArrayList<Activity> al=new ArrayList<>();
		PreparedStatement ps=null;
		String query="select * from activity where id=?;";
		Activity a=null;
		ResultSet rs=null;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				a=new Activity();
				a.setId(rs.getInt(1));
				a.setAname(rs.getString(2));
				a.setImage(rs.getString(3));
				a.setAbout(rs.getString(4));
				a.setPrice(rs.getInt(5));
				al.add(a);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
	public String bookActivity(HttpServletRequest req,User u) {
		String status="";
		System.out.println("Enter");
	
		System.out.println(u.getId());
		try {
			String query = "INSERT INTO activitybook (a_image, aname, people, aprice, uid, uname, uemail, status, adate) "
		             + "SELECT Image, Aname, ?, ?,'"+u.getId()+"','"+u.getName()+"','"+u.getEmail()+"',"+" 'Pending', ? "
		             + "FROM activity WHERE id = ?";
			
	

		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1, Integer.parseInt(req.getParameter("NoPeople")));  
		ps.setInt(2, Integer.parseInt(req.getParameter("price"))); 	  
		ps.setDate(3, Date.valueOf(req.getParameter("date"))); 
		ps.setInt(4, Integer.parseInt(req.getParameter("id")));  

		int result = ps.executeUpdate();

			if (result > 0) {
				status = "success";
			} else {
				status = "failure";
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return status;
		
	}
	
	public ArrayList<ActivityBooking> getActivityStatus(String email){
		ArrayList<ActivityBooking> al=new ArrayList<>();
		
		PreparedStatement ps=null;
		ResultSet rs=null;
		ActivityBooking ab=null;
		String query="Select * from activitybook where uemail=?";
		
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, email);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				ab=new ActivityBooking();
				
				ab.setBookid(rs.getInt(1));
				ab.setAimage(rs.getString(2));
				ab.setAname(rs.getString(3));
				ab.setPeople(rs.getInt(4));
				ab.setAprice(rs.getInt(5));
				ab.setUid(rs.getInt(6));
				ab.setUname(rs.getString(7));
				ab.setUemail(rs.getString(8));
				ab.setStatus(rs.getString(9));
				ab.setAdate(rs.getDate(10));
				al.add(ab);
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return al;
	}
	
	
	public ArrayList<ActivityBooking> getALLActivityStatus(){
		ArrayList<ActivityBooking> al=new ArrayList<>();
		
		PreparedStatement ps=null;
		ResultSet rs=null;
		ActivityBooking ab=null;
		String query="Select * from activitybook";
		
		try {
			ps=con.prepareStatement(query);
		
			rs=ps.executeQuery();
			
			while(rs.next()) {
				ab=new ActivityBooking();
				
				ab.setBookid(rs.getInt(1));
				ab.setAimage(rs.getString(2));
				ab.setAname(rs.getString(3));
				ab.setPeople(rs.getInt(4));
				ab.setAprice(rs.getInt(5));
				ab.setUid(rs.getInt(6));
				ab.setUname(rs.getString(7));
				ab.setUemail(rs.getString(8));
				ab.setStatus(rs.getString(9));
				ab.setAdate(rs.getDate(10));
				al.add(ab);
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return al;
	}
	
	public int cancleActivity(int id) {
		PreparedStatement ps=null;
		int res=0;
		String query="update activitybook set status='Cancelled' where book_id=?";
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1, id);
			
			res=ps.executeUpdate();
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
		
		
	}
	
	public String contact(String name,long phone,String email,String address,String message) {
		PreparedStatement ps=null;
		String query="insert into contact values(0,?,?,?,?,?);";
		String status="";
		
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, name);
			ps.setLong(2, phone);
			ps.setString(3, email);
			ps.setString(4, address);
			ps.setString(5, message);
			int res=ps.executeUpdate();
			
			if(res>=1) {
				status="success";
			}
			else {
				status="failure";
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
}

