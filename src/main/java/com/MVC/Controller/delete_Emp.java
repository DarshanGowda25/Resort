package com.MVC.Controller;

import java.io.IOException;

import com.MVC.Model.Admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "delete_Emp", urlPatterns = { "/delete_Emp" })
public class delete_Emp extends HttpServlet{
	
	protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=ISO-8859-1");
		
		try {
			if(req.getParameter("submit").equals("removeEmp")) {
			int id = Integer.parseInt(req.getParameter("removeEmploye"));
			Admin e=new Admin();
			String status = e.delete(id);
			
			if (status.equals("success")) {
				String action = "fire";
				req.setAttribute("FireStatus", "Successfully Fired");
				req.setAttribute("action", action);
				RequestDispatcher rd =req.getRequestDispatcher("adminBody.jsp");
				rd.forward(req, resp);
			}
			if (status.equals("failure")) {
				req.setAttribute("FireStatus", "Deletion failure");
				RequestDispatcher rd =req.getRequestDispatcher("adminBody.jsp");
				rd.forward(req, resp);
			}
			
			
		}
		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		processRequest(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		processRequest(req, resp);
	}

	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
