<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style type="text/css">
    *{
    
    margin: 0px;
}
body{
    display: flex;
    flex-direction: column;
    justify-content: center;  
}
.part1{

    height: 100vh;
    width: 100%;
    background-image: url("Background.jpg");
    background-position: center;
    background-size: cover;
    display: flex;
    flex-direction: column;
    align-items: center;


}
.nav-bar{
    
    height: 60px;
    width: 60%;
    background: rgba(0, 0, 0, 0.299);
    
    backdrop-filter: blur("100px");
    align-content: center;
    border-radius: 6px;
    position: relative;
    top: 10px;
   
    
}
.nav-bar ul{
    height: 100%;
    display: flex;
    flex-direction: row;
    justify-content: space-evenly;
    align-items: center;
    overflow: hidden;
    
    

}
ul li{
    height: 100%;
    width: 100px;
    align-content: center;
    text-align: center;
    
    


}
ul li:hover{
   
    background: rgba(0, 0, 0, 0.299);
    border-radius: 8px;
    cursor: pointer;

}

ul li a{
    height: 100%;
    width: auto;
    text-decoration: none;
    color: rgb(255, 255, 255);
    

}

#logout{
	 background-color: transparent;
	 border: none;
	 color:white;
}
#logoutList:hover{
  background: rgba(0, 0, 0, 0.299);
    border-radius: 8px;

}



    
    </style>
</head>

<body>
    <div class="part1">

        <div class="nav-bar">
            <ul type="none">
                <li><a href="adminBody.jsp">Home</a></li>
                <li><a href="employeDetails.jsp">Employe Details</a></li>
                <li><a href="CustomerDetails.jsp">Customer Details</a></li>
                <li><a href="ActivityDetails.jsp">Activity Details</a></li>
                <li><a href="RoomDetails.jsp">Room Details</a></li>
                <li><a href="BookingDetails.jsp">Booking Details</a></li>
                <li><a href="ContactDetails.jsp">Contact Details</a></li>
                
                <li id="logoutList"><a href="EmpLogin.jsp">
                <form action="admin" method="post">
                <button type="submit" id="logout" name="submit" value="Logout" >Logout</button>
                </form>
                </a>
                </li>
               
            </ul>
        </div>

        

    
</body>

</html>