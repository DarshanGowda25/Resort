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

@WebServlet("/activityAction")
public class Activity_func extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		UserImpl c = new UserImpl();
		

		try {
			if (req.getParameter("submit").equals("Book")) {
				if (session.getAttribute("USession") != null) {
					User u = (User) session.getAttribute("USession");
					
					String status = c.bookActivity(req,u);
					
					
					if (status.equals("success")) {
						
						session.setAttribute("success", "Booking successful");
						resp.sendRedirect("activityStatus.jsp");
					} else if (status.equals("failure")) {

						session.setAttribute("failure", "Booking failed");
						resp.sendRedirect("activityBooking.jsp");
					}
				} else {
					RequestDispatcher rd = req.getRequestDispatcher("UserLogin.jsp");
					rd.forward(req, resp);

				}

			}

			else if (req.getParameter("submit").equals("Cancel")) {
			
				String uid = req.getParameter("id");
				int id = Integer.parseInt(uid);
			
				int status = c.cancleActivity(id);
				if (status > 0) {
					
					session.removeAttribute("success");
					session.removeAttribute("failure");
					RequestDispatcher rd = req.getRequestDispatcher("activityStatus.jsp");
					rd.forward(req, resp);
				}
			}

			

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
