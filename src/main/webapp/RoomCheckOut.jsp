<%@page import="com.MVC.Model.roomBooking"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check Out</title>
<style type="text/css">
	

	  main{
	  display: flex;
	  flex-direction: column;
	  justify-content: center;
	  align-items: center;
	  background-color: wheat;
	  }
	  header{
	  background-color: white;
	  }
        .CheckOut-container{
        
            height: 550px;
            width: 850px;
            background-color: rgb(255, 250, 240);
            box-shadow: 10px 10px 10px rgb(36, 36, 36);
            border-radius: 10px;
            padding: 15px;
            text-align: center;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 120px;
            margin-bottom: 50px;
            
        }

        .CheckOut-container .user-info{
            width: 100%;
            margin-bottom: 15px;
        }

        .CheckOut-container .user-info table{
            width: 100%;
        }

        .CheckOut-container .info1{
            width: 90%;
            display: flex;
            justify-content: space-evenly;
            background-color: rgb(255, 247, 232);
            padding: 10px;
            border-radius: 10px;
            border: 1px solid gainsboro;
        }

        .CheckOut-container .info1 img{
            height: 150px;
            width: 150px;
           
            
        }
        

      

        .CheckOut-container .room-info{
            margin-top: 25px;
            height: 100px;
            width: 60%;
            background-color: rgb(255, 250, 240);
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            justify-content:center;
            text-align: left;
            padding-left: 15px;
            border: 1px solid gainsboro;


        }
        .CheckOut-container .room-info table{
            width: 50%;
            text-align: left;
        }
        .info2{
            width: 100%;
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
            margin-top: 30px;
        }

        .info2 .date-info {
            width: 45%;
            
            
        }
        .info2 .date-info table{
            width: 80%;
            text-align: left;
            margin-left: 15px;
            
        }
        .info2 .price-info {
            width: 45%;
            
            
        }

        .info2 .price-info table{
            width: 80%;
            text-align: left;
            margin-left: 15px;
            
        }

        #total{
            border-top:1px solid black ;
        }
        
        .CheckOut-container form{
            margin-top: 25px;
            width: 80%;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        .CheckOut-container form select{
            width: 100%;
            padding: 10px;
            background-color: gainsboro;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .CheckOut-container #BookSubmit{
            margin-top: 15px;
            width: 400px;
            height: 35px;
            align-content: center;
            border-radius: 6px;
            margin-left: 125px;
            background-color: #ceb381;
            border: none;
        }

        .CheckOut-container #BookSubmit:hover{
            background-color: #e6ca98;
        }

        .CheckOut-container #checkbox input{
            height: 15px;
            width: 15px;
            
        }
        .CheckOut-container .line{
            height: 2px;
            width: 100%;
            background-color: #ceb381;
            margin-bottom: 15px;
        }
        
         .scrolled {

            background-color: white;
            color: #4D4D4F;

        }
</style>
</head>
<body>

<header><%@ include file = "UDHeader.jsp" %></header>

	
	
	
	<main>
		<%if(request.getAttribute("room")!=null){
			roomBooking r =(roomBooking) request.getAttribute("room");
			User us =(User) request.getAttribute("USession");
	
			
			%>
		
		
	
		<div class="CheckOut-container">
        <h1>Booking Details</h1>
        <div class="line"></div>
        <div class="user-info">
           <table>
            <tr>
                <td>Name : <%=r.getuName()%></td>
                <td>Email : <%=u.getEmail() %></td>
                
            </tr>
           </table>
        </div>
        
        <div class="info1">

            
            <img src="Images/DulexRoom.jpg" alt="">
            <div class="room-info">
               
                <table>
                    
                    <tr>
                        <td>Room Type </td>
                        <td>: <%=r.getRoomType() %></td>
                    </tr>
                    <tr>
                        <td>Price </td>
                        <%if(r.getRoomType().equals("Dulex")){ %>
                        <td>: 3000</td>
                        <%}else if(r.getRoomType().equals("Normal")){ %>
                        <td>: 2000</td>
                        <%} %>
                    </tr>
                    
                   </table>
                

            </div>

            
            

        </div>
        <div class="info2">

            <div class="date-info">
                <table>
                <tr>
                    <td>Check-In</td>
                    <td>: <%=r.getCheckIn() %></td>
                </tr>
                <tr>
                    <td>Check-Out</td>
                    <td>: <%=r.getCheckOut() %></td>
                </tr>
            </table>

            </div>

        <div class="price-info">
            <table>
                <tr>
                    <td>Price Per Room</td>
                    
                        <%if(r.getRoomType().equals("Dulex")){ %>
                        <td>: 3000</td>
                        <%}else if(r.getRoomType().equals("Normal")){ %>
                        <td>: 2000</td>
                        <%} %>
                </tr>
                <tr>
                    <td>Total rooms</td>
                    <td>: <%=r.getTotalRoom() %></td>
                </tr>
                <tr>
                    <td>Total days</td>
                    <td>: <%=r.getTotalDays() %></td>
                </tr>
               
                
                <tr>
                    
                    <td id="total"><b>Total Price</b></td>
                    <td id="total"> : <%=r.getTotalAmount() %></td>
                </tr>
            </table>
        </div>
        
    </div>

    <form action="room_func" method="post">
        <select name="paymentMethod" id="">
            <option value="UPI">UPI Payment</option>
            <option value="Card">Card Payment</option>
            <option value="NetBanking">Net Banking</option>
        </select>

        <div id="checkbox">
        <input type="checkbox"  required> Agree For All Term & Conditions.
        </div>

        <input type="submit" id="BookSubmit" name="submit" value="Confirm BooK">
    </form>
    

    </div>
    <%} %>
	</main>
	
	<%@ include file = "UDFooter.jsp" %>
	
	
<script type="text/javascript">
const navbar = document.querySelector(".nav1")
  navbar.classList.add('scrolled');


</script>

</script>
</body>
</html>