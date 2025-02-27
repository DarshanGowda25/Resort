<%@page import="com.MVC.Model.RoomBookingImpl"%>
<%@page import="com.MVC.Model.roomBooking"%>
<%@page import="com.MVC.Model.UserImpl"%>
<%@page import="com.MVC.Model.Customer"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.MVC.Model.Admin"%>
<%@page import="com.MVC.Model.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Details</title>
<style type="text/css">
	.right1 {
	height: 82%;
	width: 95%;
	border-radius: 10px;
	background: rgba(0, 0, 0, 0.608);
	backdrop-filter:blur(10px);
	overflow: auto;
	scrollbar-width: none;
	margin-top: 50px;
}

/*table*/
.right1 table {
	width: 100%;
	border-collapse: collapse;
	color: white;
}

.right1 table tr{
width: 100%;
}

.right1 td {
	padding: 15px;
	text-align: center;
}

#head {
	position: sticky;
	top: 0px;
	background-color: rgb(0, 0, 0, 0.5);
	backdrop-filter: blur(50px);
	padding: 10px;
}

#head th {
	padding: 15px;
}

.right1 form {
	height: 30px;
	width: 75px;
	background-color: transparent;
	backdrop-filter: blur(0px);
	display: flex;
	align-items: center;
	display: flex;
	overflow: auto;
	
}
</style>
</head>
<body>
 	<%@ include file="adminHeader.jsp"%>
 	<div class="right1">
 		<table>

					<tr id="head">
							<th>BID</th>
                            <th>User Name</th>
                            <th>Room Type</th>
                            <th>Rooms Booked</th>
                            <th>Total Rooms</th>
                            <th>Total Days</th>
                            <th>CheckIn Date</th>
                            <th>CheckOut Date</th>
                            <th>Booking Date</th>
                            <th>Price Payed</th>
                            
                            <th>Status</th>
						

					</tr>

					<%
					HttpSession se = request.getSession(false);
					Employee ee = (Employee)se.getAttribute("ESession");
					if(ee!=null){
					RoomBookingImpl r = new RoomBookingImpl();
					ArrayList<roomBooking> el = r.getAllRoomBooking();
					for(roomBooking rr : el){
					%>
					



					<tr>

							<td><%=rr.getBID()%></td>
                            <td><%=rr.getuName() %></td>
                            <td><%=rr.getRoomType() %></td>
                            <td><%=rr.getRoomsBooked() %></td>
                            <td><%=rr.getTotalRoom()%></td>
                            <td><%=rr.getTotalDays()%></td>
                            <td><%=rr.getCheckIn() %></td>
                            <td><%=rr.getCheckOut() %></td>
                            <td><%=rr.getBookingDate()%></td>
                            <td><%=rr.getTotalAmount()%></td>
                            <td><%=rr.getStatus()%></td>
                          



					

					<%
					}}
					
					%>
					

				</table>
 	</div>

</body>
</html>