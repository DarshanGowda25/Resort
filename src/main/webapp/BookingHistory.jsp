

<%@page import="com.MVC.Model.RoomBookingImpl"%>
<%@page import="com.MVC.Model.roomBooking"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Status</title>
    
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            margin: 0;
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 120px;
        }

        .table-wrapper {
            padding: 20px;
            border-radius: 5px;
            background: #fff;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .table-title {
            padding-bottom: 15px;
            background: #dacca1;
            color: rgb(14, 13, 13);
            padding: 16px 25px;
            border-radius: 5px 5px 0 0;
            text-align: center;
        }

        .table-responsive {
            margin-top: 20px;
        }

        table.table {
            border-collapse: collapse;
            width: 100%;
        }

        table.table thead {
            background-color: #007bff;
            color: white;
        }

        table.table th, table.table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

      

        
        .btn-danger {
            background-color: red;
            color: white;
            border: none;
        }


        #success{
          color:green;
          text-align:center;
        
        }
        #failure{
          color:red;
          text-align:center;
        
        }
        
         .scrolled {

            background-color: white;
            color: #4D4D4F;

        }

    </style>
</head>
<body onscroll="scroll()">
		<header>
		<%@ include file="UDHeader.jsp" %>
	</header>

    <div class="container">
        <%if(request.getAttribute("success")!=null){ %>
        <h3 id="success"><%=request.getAttribute("success")%></h3>
        <%} %>
        
         <%if(request.getAttribute("failure")!=null){ %>
        <h3 id="success"><%=request.getAttribute("failure")%></h3>
        <%} %>
		
        
        <div class="table-wrapper">
            <div class="table-title">
                <h2>Booking Status</h2>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
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
                    </thead>
                    
                    <%
                    if(se!=null && u!= null ){ %>
                    <tbody>
                    	<%  
                    		RoomBookingImpl r = new RoomBookingImpl();
							ArrayList<roomBooking> al = r.getRoomBooking(u.getId());
							for(roomBooking rr : al){
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
                           
                            
                            <%if(rr.getStatus().equals("Booked")) {%>
                            <td>
                                <form action="room_func" method="post">
										<input type="hidden" name="id" value="<%=rr.getBID()%>" />
										<button type="submit" class="btn btn-danger"
											name="submit" value="Cancel" >Cancel</button>
									</form>
                            </td>
                            <%}else{%>
                            <td >
                               <%=rr.getStatus() %>
                            </td>
                            <%} %>
                            
                        </tr>
                        <%} %>
                        
                    </tbody>
                    <%}
                    %>
                </table>
            </div>
        </div>
    </div>
	    <footer>
    	<%@ include file="UDFooter.jsp" %>
    </footer>
    <script type="text/javascript">
    const navbar = document.querySelector(".nav1")

    function handleScroll() {
        if (window.scrollY > 0) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    }

    window.addEventListener('scroll', handleScroll);
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>