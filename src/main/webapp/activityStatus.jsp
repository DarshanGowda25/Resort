<%@page import="com.MVC.Model.UserImpl"%>
<%@page import="com.MVC.Model.ActivityBooking"%>
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
            margin-top: 125px;
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


        .msg{
          color:green;
          text-align:center;
        
        }
        footer{
        position: fixed;
        bottom: 0px;
        }
        

    </style>
</head>
<body>

	<header>
		<%@ include file="UDHeader.jsp"%>
	</header>

    <div class="container">
        <%
		if (session.getAttribute("success") != null) {
		%>
		<h3 class="msg">
			<%=session.getAttribute("success")%></h3>
		<%
		}
		%>
        <div class="table-wrapper">
            <div class="table-title">
                <h2>Booking Status</h2>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Activity Name</th>
                            <th>Peoples</th>
                            <th>Activity Date</th>
                            <th>Price</th>
                            
                            <th>Status</th>
                        </tr>
                    </thead>
                    
                    <%if(session.getAttribute("USession") != null){ %>
                    <tbody>
                    	<%  
							UserImpl u1 = new UserImpl();
                    	    User us =(User)session.getAttribute("USession");
                    	    String email= us.getEmail();
                    	    System.out.println(email);
                    	
							ArrayList<ActivityBooking> al = u1.getActivityStatus(email);
							Iterator<ActivityBooking> itr = al.iterator();
							while (itr.hasNext()) {
								ActivityBooking ab = itr.next();
							%>
                        <tr>
                            <td><%=ab.getBookid() %></td>
                            <td><%=ab.getAname() %></td>
                            <td><%=ab.getPeople() %></td>
                            <td><%=ab.getAdate() %></td>
                            <td><%=ab.getAprice() %></td>
                           
                            
                            <%if(ab.getStatus().equals("Pending")) {%>
                            <td>
                                <form action="activityAction" method="post">
										<input type="hidden" name="id" value="<%=ab.getBookid()%>" />
										<button type="submit" class="btn btn-danger"
											name="submit" value="Cancel">Cancel</button>
									</form>
                            </td>
                            <%}else{%>
                            <td >
                               <%=ab.getStatus() %>
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

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
    const navbar = document.querySelector(".nav1")
	navbar.classList.add('scrolled');
    
    </script>
</body>
</html>