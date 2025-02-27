package com.MVC.Controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;

import com.MVC.Model.Admin;
import com.MVC.Model.RoomBookingImpl;
import com.MVC.Model.User;
import com.MVC.Model.roomBooking;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/room_func")
public class Room_func extends HttpServlet {
	protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=ISO-8859-1");
		HttpSession se = req.getSession(false);
		Admin e1 = new Admin();
		RoomBookingImpl bk = new RoomBookingImpl();
		try {
			if (req.getParameter("submit").equals("removeRoom")) {

				int roomNo = Integer.parseInt(req.getParameter("remove"));

				String status = e1.deleteRoom(roomNo);

				if (status.equals("success")) {
					String action = "viewRooms";
					req.setAttribute("roomStatus", "Successfully Removed");
					req.setAttribute("action", action);
					req.getRequestDispatcher("adminBody.jsp").forward(req, resp);
				}
				if (status.equals("failure")) {
					req.setAttribute("roomStatus", "Failed To Remove");
					req.getRequestDispatcher("adminBody.jsp").forward(req, resp);

				}

			} else if (req.getParameter("submit").equals("updateRoom")) {

				int roomNo = Integer.parseInt(req.getParameter("remove"));
				System.out.println(roomNo);
				String roomType = req.getParameter("room_Type");
				System.out.println(roomType);
				String prices = req.getParameter("roomPrice");
				int price = Integer.parseInt(prices);
				System.out.println(price);

				String status = e1.updateRoom(roomNo, roomType, price);

				if (status.equals("success")) {
					String action = "viewRooms";
					req.setAttribute("roomStatus", "Successfully Updated");
					req.setAttribute("action", action);
					req.getRequestDispatcher("adminBody.jsp").forward(req, resp);
				}
				if (status.equals("failure")) {
					req.setAttribute("roomStatus", "Failed To Update");
					req.getRequestDispatcher("adminBody.jsp").forward(req, resp);

				}

			} else if (req.getParameter("submit").equals("Check Out")) {
				
				if(se!=null && se.getAttribute("USession")!=null) {
					
					User u = (User) se.getAttribute("USession");
				
					String roomType = req.getParameter("room");
					
					
					
					
					if (roomType.equals("Dulex")) {
						
						String noRooms = req.getParameter("NoRooms");
						int totalRooms = Integer.parseInt(noRooms);
						String CheckIn = req.getParameter("CheckIn");
						Date checkIn = Date.valueOf(CheckIn);
					
						String CheckOut = req.getParameter("CheckOut");
						Date checkOut = Date.valueOf(CheckOut);
						
						int days = bk.getDays(CheckIn,CheckOut);
						
						
						
						ArrayList<Integer> ids = e1.getRoomId(roomType, totalRooms, CheckIn);
						if(ids.size()!=0) {
						int totalAmount = 3000*totalRooms*days;
						
						roomBooking r = new roomBooking();
						
						r.setUID(u.getId());
						r.setuName(u.getName());
						r.setRoomType(roomType);
						r.setTotalRoom(totalRooms);
						r.setRoomNos(ids);
						r.setTotalDays(days);
						r.setCheckIn(checkIn);
						r.setCheckOut(checkOut);
						r.setTotalAmount(totalAmount);
						
						
						se.setAttribute("room", r);
						
						req.setAttribute("room", r);
						RequestDispatcher rd = req.getRequestDispatcher("RoomCheckOut.jsp");
						rd.forward(req, resp);
						}else {
							req.setAttribute("failure", "No Of Rooms Required are Not Available For The Date");
							RequestDispatcher rd = req.getRequestDispatcher("DulexRoom.jsp");
							rd.forward(req, resp);
						}
						
						

					} else if(roomType.equals("Normal")) {
						
						
						String noRooms = req.getParameter("NoRooms");
						int totalRooms = Integer.parseInt(noRooms);
						String CheckIn = req.getParameter("CheckIn");
						Date checkIn = Date.valueOf(CheckIn);
						
						String CheckOut = req.getParameter("CheckOut");
						Date checkOut = Date.valueOf(CheckOut);
						
						int days = bk.getDays(CheckIn,CheckOut);
						
						
						ArrayList<Integer> ids = e1.getRoomId(roomType, totalRooms, CheckIn);
						if(ids.size()!=0) {
						int totalAmount = 2000*totalRooms*days;
						
						roomBooking r = new roomBooking();
						
						r.setUID(u.getId());
						r.setuName(u.getName());
						r.setRoomType(roomType);
						r.setTotalRoom(totalRooms);
						r.setRoomNos(ids);
						r.setTotalDays(days);
						r.setCheckIn(checkIn);
						r.setCheckOut(checkOut);
						r.setTotalAmount(totalAmount);
						
						
						se.setAttribute("room", r);
					
						req.setAttribute("room", r);
						RequestDispatcher rd = req.getRequestDispatcher("RoomCheckOut.jsp");
						rd.forward(req, resp);
						}else {
							req.setAttribute("failure", "No Of Rooms Required are Not Available For The Date");
							RequestDispatcher rd = req.getRequestDispatcher("NormalRoom.jsp");
							rd.forward(req, resp);
						}
						
						
						
						
					}
				} 
				else {
					req.setAttribute("failure", "Please Login To Book");
					RequestDispatcher rd = req.getRequestDispatcher("UserLogin.jsp");
					rd.forward(req, resp); 
					}
				
				
			}else if(req.getParameter("submit").equals("Confirm BooK")) {
				String paymentMethod = req.getParameter("paymentMethod");
				
				
				roomBooking r =(roomBooking) se.getAttribute("room");
				r.setPayType(paymentMethod);
				
				boolean res = bk.Book(r);
				if(res) {
					
					ArrayList<Integer> list = r.getRoomNos();
					for(int roomNo:list) {
						e1.updateAccupiedTill(roomNo, r.getCheckOut());	
						}
					se.removeAttribute("room");
					req.setAttribute("success", "Booking Successful");
					RequestDispatcher rd = req.getRequestDispatcher("Accommodation.jsp");
					rd.forward(req, resp);
				}else {
					req.setAttribute("failure", "Try Again Later");
					RequestDispatcher rd = req.getRequestDispatcher("Accommodation.jsp");
					rd.forward(req, resp);
					
				}
				
				
			}else if(req.getParameter("submit").equals("Cancel")) {
				String id = req.getParameter("id");
				int BID = Integer.parseInt(id);
				boolean res = bk.updateRoomBookingToCancel(BID);
				
				if(res) {
					req.setAttribute("success", "Booking Cancelled Successful");
					RequestDispatcher rd = req.getRequestDispatcher("BookingHistory.jsp");
					rd.forward(req, resp);
				}else {
					req.setAttribute("failure", "Failed to Cancel Booking");
					RequestDispatcher rd = req.getRequestDispatcher("BookingHistory.jsp");
					rd.forward(req, resp);
				}
				
			}else if(req.getParameter("submit").equals("Booking History")) {
				
				if(se!=null && se.getAttribute("USession")!=null) {
					RequestDispatcher rd = req.getRequestDispatcher("BookingHistory.jsp");
					rd.forward(req, resp);
				
				}else {
					RequestDispatcher rd = req.getRequestDispatcher("UserLogin.jsp");
					rd.forward(req, resp);
					
				}
				
				
			}
				
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}

	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
