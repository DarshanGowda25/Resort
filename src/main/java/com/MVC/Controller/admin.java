package com.MVC.Controller;

import java.io.IOException;

import com.MVC.Model.Admin;
import com.MVC.Model.Employee;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(name = "admin", urlPatterns = { "/admin" })
public class admin  extends HttpServlet{
	
	protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html");
		String action = req.getParameter("action");
		Admin emp = new Admin();
		
		
		

		try {

			if (action != null) {
				req.setAttribute("action", action);
				RequestDispatcher rd = req.getRequestDispatcher("adminBody.jsp");
				rd.forward(req, resp);

			}
			else if(req.getParameter("submit").equals("login")) {
				
				String email=req.getParameter("email");
				String password=req.getParameter("password");
				
				
				
				
				Employee status = emp.login(email, password);
				
				
				
				
				if(status!=null) {
					HttpSession session = req.getSession();
					session.setAttribute("ESession", status);
					
					Employee e = (Employee) session.getAttribute("ESession");
					int Eid = e.getId();
					String id = Integer.toString(Eid);
					
					
					if(id.equals("1")) {
						
					req.setAttribute("status", "Login Successfull");
					RequestDispatcher rd =req.getRequestDispatcher("adminBody.jsp");
					rd.forward(req, resp);
					}
					else {
						System.out.println("not a admin");
						req.setAttribute("status", "Cannot access");
						RequestDispatcher rd =req.getRequestDispatcher("EmpLogin.jsp");
						rd.forward(req, resp);
					}
					
				}
				else{
					req.setAttribute("status", "Login failed");
					RequestDispatcher rd = req.getRequestDispatcher("EmpLogin.jsp");
					rd.forward(req, resp);
				}

			}else if(req.getParameter("submit").equals("Logout")){
				HttpSession session = req.getSession(false);
				
				
				if(session!=null) {
					
					session.invalidate();
					RequestDispatcher rd = req.getRequestDispatcher("userDashboard.jsp");
					rd.forward(req, resp);
				}
			}
		
			else if(req.getParameter("submit").equals("Hire")) {
				String name=req.getParameter("name");
				String phoneNo=req.getParameter("phone");
				long phone = Long.parseLong(phoneNo);
				String email=req.getParameter("email");
				String agee=req.getParameter("age");
				int age = Integer.parseInt(agee);
				String gender=req.getParameter("gender");
				String job=req.getParameter("job");
				String salary=req.getParameter("sal");
				int sal = Integer.parseInt(salary);
				String address=req.getParameter("address");
				
				String status=emp.registration(name,phone,email,age,gender,job,sal,address);
				
			if(status.equals("existed")) {
					req.setAttribute("status", "Existed Record");
					RequestDispatcher rd1=req.getRequestDispatcher("adminBody.jsp");
					rd1.forward(req, resp);
				}
				else if(status.equals("success")) {
					action = "hire";
					req.setAttribute("status", "Successfully Registered");
					req.setAttribute("action", action);
					RequestDispatcher rd=req.getRequestDispatcher("adminBody.jsp");
					rd.forward(req, resp);
				}
				else if(status.equals("failure")) {
					req.setAttribute("status", "Registration Failed");
					RequestDispatcher rd = req.getRequestDispatcher("adminBody.jsp");
					rd.forward(req, resp);
				}
				
			}
			else if(req.getParameter("submit").equals("Add Room")){
				
				String bedType=req.getParameter("bedType");
				String prices = req.getParameter("bedPrice");
				int price = Integer.parseInt(prices);
				String room_img=null;
				if(bedType.equalsIgnoreCase("dulex")) {
					room_img = "Images/dulex.jpg";
				}
				else if(bedType.equalsIgnoreCase("normal")) {
					room_img = "Images/normal.jpg";
				}
				
				
				String status=emp.roomRegistration(bedType, price,room_img);
				
			
				if(status.equals("success")) {
					action = "addRooms";
					req.setAttribute("status", "Room added Successfull");
					req.setAttribute("action", action);
					RequestDispatcher rd=req.getRequestDispatcher("adminBody.jsp");
					rd.forward(req, resp);
				}
				else if(status.equals("failure")) {
					req.setAttribute("status", "Failed to add room");
					RequestDispatcher rd = req.getRequestDispatcher("adminBody.jsp");
					rd.forward(req, resp);
				}
				
			}		

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}

}
