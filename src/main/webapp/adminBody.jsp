<%@page import="com.MVC.Model.Room"%>
<%@page import="com.MVC.Model.Admin"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.MVC.Model.Employee"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DashBoard</title>
<style type="text/css">
* {
	color: white;
	margin: 0px;
	font-family: Arial, Helvetica, sans-serif;
}

.container {
	height: 85%;
	width: 100%;
	background: rgba(0, 0, 0, 0);
	margin-top: 30px;
	border-radius: 10px;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

.left {
	height: 70%;
	width: 20%;
	background: rgba(0, 0, 0, 0.608);
	margin: 10px;
	border-radius: 10px;
	overflow: hidden;
	cursor: pointer;
}

.right {
	height: 100%;
	width: 80%;
	background-color: rgba(0, 0, 0, 0);
	margin: 10px;
	border-radius: 10px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	overflow: auto;
	scrollbar-width: none;
	
	
}

.right h2 {
	color: black;
	padding-bottom: 10pxs;
	
}

.functionality {
	height: 25%;
	width: 99%;
	background-color: transparent;
	align-content: center;
	text-align: center;
}

.functionality:hover {
	border: 2px solid rgb(255, 254, 254);
	background: rgba(0, 0, 0, 0.608);
	border-radius: 6px;
	cursor: pointer;
}

.functionality form {
	height: 100%;
	width: 100%;
}

.functionality form button {
	height: 100%;
	width: 100%;
	background-color: transparent;
	border-style: none;
}

/* right */
.right form {
	height: 90%;
	width: 40%;
	padding: 10px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	padding-left: 100px;
	padding-top: 25px;
	backdrop-filter: blur(10px);
	background-color: rgba(0, 0, 0, 0.608);
	border-radius: 10px;
	padding-bottom: 20px;
	overflow: auto;
	scrollbar-width: none;
}
#empStatus{

}


.right h2 {
	margin-bottom: 10px;
}
.right #status{
	padding-top: 25px;
}

.right h3 {
	margin-bottom: 10px;
	color: red;
}

.right form h2 {
	color: white;
	text-align: center;
	padding-right: 100px;
	padding-bottom: 10px;
}

.right form label {
	margin-bottom: 5px;
}

.right form input {
	width: 70%;
	padding: 6px;
	background-color: transparent;
	border-top-style: none;
	border-right-style: none;
	border-left-style: none;
	outline: none;
	margin-bottom: 6px;
}

.right form  #submit {
	height: 35px;
	margin-top: 10px;
	width: 73%;
	background-color: rgba(0, 0, 0, 0.608);
	border-style: none;
	border-radius: 5px;
}

.right form  #submit:hover {
	background-color: rgba(85, 85, 85, 0.608);
}

/* fire */
.right1 {
	height: 95%;
	width: 100%;
	border-radius: 10px;
	background: rgba(0, 0, 0, 0.608);
	overflow: auto;
	scrollbar-width: none;
}

/*table*/
.right1 table {
	width: 100%;
	border-collapse: collapse;
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

#remove {
	padding: 6px;
	height: 30px;
	width: 75px;
	border-radius: 4px;
	background-color: rgb(0, 0, 0, 0.5);
	border: 1px solid rgb(198, 25, 25);
	color: rgb(198, 25, 25);
	cursor: pointer;
	margin-right: 70px;
	
}
#update{
padding: 6px;
	height: 30px;
	width: 75px;
	border-radius: 4px;
	background-color: rgb(0, 0, 0, 0.5);
	border: 1px solid green;
	color: green;
	cursor: pointer;
	margin-right: 70px;
}

#remove:hover {
	color: white;
	background-color: rgb(198, 25, 25);
}
#update:hover{
color: white;
	background-color: green;
}

#empStatus{
color: Green;
margin-left: 80px;

}

/* room */
.right #roomForm{
	height: 60%;
	width: 40%;
	padding: 10px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	padding-left: 100px;
	padding-top: 25px;
	backdrop-filter: blur(10px);
	background-color: rgba(0, 0, 0, 0.608);
	border-radius: 10px;
	padding-bottom: 20px;
	
}


.right2 {
	height: 95%;
	width: 100%;
	border-radius: 10px;
	background: rgba(0, 0, 0, 0.608);
	overflow: auto;
	display: flex;
    flex-direction: row;
    justify-content: flex-start;
    flex-wrap: wrap;
    overflow: scroll;
    scrollbar-width: none;
}

#roomForm input{

margin-bottom: 15px;
}
#roomForm h2{
margin-bottom: 25px;
}

 .card {
     min-height: 300px;
     max-height: 300px;
     min-width: 250px;
     max-width:250px ;
     background-color: rgba(255, 255, 255, 0.3);
     backdrop-filter:blur(15px);
     margin: 20px;
     display: flex;
     flex-direction: column;
     justify-content: center;
     align-items: center;
     Position: relative;
     border-radius: 5px;
    }
    
   .img{
        height: 130px;
        width: 200px;
        background-color: wheat;
        margin-bottom: 10px;
        overflow: hidden;
            
            
            
     }
   .card h4{
         color: black;
         border-radius: 5px
        }
    #roomButton{
    	all:unset;
    	margin-left: 75px;
    	}
    	
    img{
    height: 100%;
    width: 100%;
    
    }
    
    #roomStatus{
    color:green;
    margin-left: 65px;
    margin-bottom: 20px;
    }
    
    #dropdown{
    background-color: transparent;
    color: black;
    padding:2px;
    border: none;
    outline:none;
    margin-bottom: 5px;
   
    }
    #dropdown option{
    background-color: rgba(0, 0, 0, 0.3);
    }
    
    

    
    #roomButton{
 
    display: flex;
    }
    

     
   
    
#updateDiv{
			all:unset;
            height: 100px;
            width: 200px;
            background-color: transparent;
            color:black;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            justify-content: center;
            align-items: center;
            

        }
        #updateDiv h4{
        margin-left: 20px;}
        
        #updateDiv form{
        all:unset;
        }
        #priceDiv {
            height: 25px;
            width: 100%;
            display: flex;
            justify-content: flex-start;
            justify-content: center;
            align-items: center;
            margin-bottom: 10px;
            margin-left: 10px;
           


        }

      
        #priceDiv input {
        	all:unset;
            height: 20px;
            width: 50px;
            margin-left: 10px;
            
        }
        #updateDiv #remove{
        
        	margin:0%;
            margin-right: 20px;
        }
        #updateDiv #update{
        margin:0%;
            margin-left: 20px;
        }

    
   
    
    
    
    




</style>
</head>

<body>
	<%@ include file="adminHeader.jsp"%>
	<%
	HttpSession se = request.getSession(false);
	Employee ee = (Employee)se.getAttribute("ESession");
	if(ee!=null){
	%>
	<div class="container">
		<div class="left">
			<div class="functionality">
				<form action="admin" method="post">
					<button class="functionalitySubmit" type="submit" name="action"
						value="hire">Hire Employe</button>
				</form>
			</div>



			<div class="functionality">
				<form action="admin" method="post">
					<button class="functionalitySubmit" type="submit" name="action"
						value="fire">Fire Employe</button>
				</form>
			</div>



			<div class="functionality">
				<form action="admin" method="post">
					<button class="functionalitySubmit" type="submit" name="action"
						value="addRooms">Add Room</button>
				</form>
			</div>




			<div class="functionality">
				<form action="admin" method="post">
					<button class="functionalitySubmit" type="submit" name="action"
						value="viewRooms">View Rooms</button>
				</form>
			</div>
			
			

		</div>
<%} %>
		<div class="right">

			<%
		
			String action = (String) request.getAttribute("action");
			if (action != null && action.equals("hire") ) {
			%>
			<h2>Enter Employe Details</h2>
			<form action="admin" method="post">
				<%if(request.getAttribute("status")!=null) {%>
				<h3 id="empStatus"><%=request.getAttribute("status")%></h3>
				<%} %>
				
				<label>Name</label> <input type="text" name="name"
					placeholder="Enter name" required>
			    <label>Email</label> <input
					type="text" name="email" placeholder="Enter Email Id" required>

				<label>Phone</label> <input type="number" name="phone"
					placeholder="Enter phone" required> 
				<label>Gender</label> <input
					type="text" name="gender" placeholder="Enter gender" required>

				<label>Age</label> <input type="number" name="age"
					placeholder="Enter age" required> 
				<label>JOB</label> <input
					type="text" name="job" placeholder="Enter job" required> 
				<label>Salary</label>
				<input type="number" name="sal" placeholder="Enter salary" required>

				<label>Address</label> 
				<input type="text" name="address" placeholder="Enter address" required> 
					
				<input type="submit" id="submit" name="submit" value="Hire">



			</form>
			<%
			} else if (action != null && action.equals("fire") ) {
			%>
			<%if(request.getAttribute("FireStatus")!=null){%>
			<h3><%=request.getAttribute("FireStatus")%></h3>
			<%} %>

			<div class="right1">

				<table>

					<tr id="head">
						<th>Eid</th>
						<th>Name</th>
						<th>Phone</th>
						<th>Mail</th>
						<th>Age</th>
						<th>Gender</th>
						<th>JOB</th>
						<th>DOJ</th>
						<th>Salary</th>
						<th>address</th>
						<th>Remove</th>

					</tr>

					<%
					
					Admin ae = new Admin();
					ArrayList<Employee> el = ae.getEmployee();
					Iterator<Employee> emp = el.iterator();
					while (emp.hasNext()) {
						Employee e = emp.next();
					%>



					<tr>

						<td><%=e.getId()%></td>
						<td><%=e.getName()%></td>
						<td><%=e.getPhone()%></td>
						<td><%=e.getEmail()%></td>
						<td><%=e.getAge()%></td>
						<td><%=e.getGender()%></td>
						<td><%=e.getJob()%></td>
						<td><%=e.getDoj()%></td>
						<td><%=e.getSal()%></td>
						<td><%=e.getAddress()%></td>
						<td>
							<form action="delete_Emp" method="post">
								<input type="hidden" name="removeEmploye" value="<%=e.getId()%>">
								<button id="remove" type="submit" name="submit" value="removeEmp">Fire</button>
							</form>

						</td>
						
					</tr>



					

					<%
					}
					
					%>
					

				</table>


			</div>
			<%
			
			}else if (action != null && action.equals("addRooms")) {
			%>
			<h2>Enter Room Details</h2>
			<form action="admin" method="post" id="roomForm">
				<%if(request.getAttribute("status")!=null) {%>
				<h3 id="roomStatus"><%=request.getAttribute("status")%></h3>
				<%} %>
				

				<label>Bed Type</label> <input type="text" name="bedType"
					placeholder="Bed type" required> 

				<label>Price</label> <input type="number" name="bedPrice"
					placeholder="Enter price" required> 
					
				<input type="submit" id="submit" name="submit" value="Add Room">



			</form>
			<%} else if (action != null && action.equals("viewRooms")) {
			%>
			<%if(request.getAttribute("roomStatus")!=null){%>
			<h3><%=request.getAttribute("roomStatus")%></h3>
			<%} %>
			
			

			<div class="right2">
			<%	
				Admin a2 = new Admin();
				ArrayList<Room> list = a2.getRooms(); %>
			<%for(Room r : list){ %>
				<div class="card">
				
					<div class="img">
					<img alt="" src="<%=r.getRoomImg()%>">

            		</div>

            		<h4>Room No : <%=r.getRoomNo()%></h4>
            		
    				
    				
            		
            		
            		
            		
            			<div id="updateDiv">
            					
            				
            			
            			
        					<form action="room_func" method="post" id="roomButton">
        						<h4>Room Type : <select id="dropdown" name="room_Type">
    											<option value="<%=r.getBedtype()%>"><%=r.getBedtype()%></option>
    											<% String bedType = (!r.getBedtype().equals("dulex")) ? "dulex" : "normal"; %>
    											<option value="<%=bedType%>"><%=bedType%></option>
											</select>
								</h4>
            					<div id="priceDiv">
                					<label for="" style="color: black">Price :</label>
                					<input type="number" id="roomPrice" name="roomPrice" value="<%=r.getPrice() %>" style="color: black;font-size: small;">
            					</div>
            					<input type="hidden" name="remove" value="<%=r.getRoomNo()%>">
            					<button id="remove" type="submit" name="submit" value="removeRoom">Remove</button>
            					<button id="update" type="submit" name="submit" value="updateRoom">Update</button>
        					</form>
    					</div>
            			
            		
            		

        		</div>
				
			<%} %>
			</div>
			<%
			
			}%>
			





		</div>
	</div>

	</div>

</body>
</html>