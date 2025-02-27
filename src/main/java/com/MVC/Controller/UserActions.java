package com.MVC.Controller;

import java.io.IOException;

import com.MVC.Model.User;
import com.MVC.Model.UserImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userAction")
public class UserActions extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		UserImpl c = new UserImpl();
		// TODO Auto-generated method stub
		
		
		
		
		
		
		
		try {
			
		
			
			if(req.getParameter("action").equals("signUp")) {
			
				UserImpl ui = new UserImpl();
				System.out.println(req.getParameter("action"));
				String name = req.getParameter("name");
				String email = req.getParameter("email");
				String phoneno = req.getParameter("phoneNo");
				long phoneNo = Long.parseLong(phoneno);
				String gender = req.getParameter("gender");
				String location = req.getParameter("location");
				String password = req.getParameter("password");
				String cPassword = req.getParameter("confirmpassword");
				if(password.equals(cPassword)) {
					String res = ui.Registration(name, email, phoneNo,gender,location, password);
					if(res.equals("success")) {
						req.setAttribute("success", "Successfully Signed Up");
						
					}
					else {
						req.setAttribute("failure", "Failed To Signed Up");
						
					}
					
				}
				else {
					
					req.setAttribute("failure", "Password MissMatch");
				}
				
				RequestDispatcher rd = req.getRequestDispatcher("UserLogin.jsp");
				rd.forward(req, resp);
					
				
			}else if(req.getParameter("action").equals("login")) {
				String email = req.getParameter("email");
				String password = req.getParameter("password");
				
				
				UserImpl ui1 = new UserImpl();
				User res =  ui1.login(email, password);
				
				
				
				
				if(res!=null) {
				
					session.setAttribute("USession", res);
				
					
					RequestDispatcher rd = req.getRequestDispatcher("userDashboard.jsp");
					rd.forward(req, resp);
					
				}else {
					req.setAttribute("failure", "Failed To Logged In");
					RequestDispatcher rd = req.getRequestDispatcher("UserLogin.jsp");
					rd.forward(req, resp);
					
				}
				
				
			}else if(req.getParameter("action").equals("Logout")) {
		
				System.out.println("stage1");
				
				
				if(session.getAttribute("USession")!=null) {
					System.out.println("stage2");
					session.removeAttribute("USession");
					session.invalidate();
					RequestDispatcher rd = req.getRequestDispatcher("userDashboard.jsp");
					rd.forward(req, resp);
				}
				
			}else if (req.getParameter("action").equals("contact")) {
				
				String name = req.getParameter("name");
				String cphone = req.getParameter("phone");
				String email = req.getParameter("email");
				String address = req.getParameter("address");
				String message = req.getParameter("message");

				long phone = Long.parseLong(cphone);
				if(session.getAttribute("USession")!=null) {
				String status = c.contact(name, phone, email, address, message);

				if (status.equals("success")) {
					req.setAttribute("success", "Successfull");
				} else if (status.equals("failure")) {
					req.setAttribute("failure", "Please check once");
				}
				RequestDispatcher rd = req.getRequestDispatcher("contact.jsp");
				rd.forward(req, resp);

			}else {
				req.setAttribute("failure", "Please Login To Contact");
				RequestDispatcher rd = req.getRequestDispatcher("UserLogin.jsp");
				rd.forward(req, resp);
			}
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
