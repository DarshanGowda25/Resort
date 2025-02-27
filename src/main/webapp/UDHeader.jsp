<%@page import="com.MVC.Model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login/SignUp</title>

<style type="text/css">
* {
			
            margin: 0%;

            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
        }


     



     


.no-bootstrap * {
    all: unset;
    display: revert;
    font-family: inherit;
}

        .nav1 {
        	
            height: 100px;
            width: 100%;
            display: flex;
            flex-direction: column;
            position: relative;
            background-color: transparent;
            color: #D1AE6c;
            position: fixed;
            top: 0%;
            z-index: 1;
            cursor: pointer;



        }

        .nav1:hover {
            background-color: white;
            color: #4D4D4F;
           
        }


         .address {
            height: 30%;
            width: 100%;
            display: flex;
            flex-direction: row;
            align-content: center;
            font-size: smaller;




        }

        .phn {
            font-size: small;
            margin: 10px;
        }

        .phn i {
            font-size: small;
            margin-right: 10px;

        }

        .location {
            position: absolute;
            right: 0px;
            margin: 10px;
            margin-right: 30px;
        }

        .hr {
            border: none;
           
            
            
            /* Removes the default border of <hr> */
        }

        .nav1:hover hr {
            border: none;
            /* Ensures the default border is removed */
            border-top: 1px solid #e3e3e3;
            /* Adds a visible line */
            margin: 5px 0;
            /* Adds spacing above and below */
            width: 100%;
            /* Ensures the line spans the width */
            transition: all 0.3s ease;
            /* Smooth appearance effect */
        }

        /* Ensures it spans the width of the parent */

        .scrolled {

            background-color: white;
            color: #4D4D4F;

        }

        .nav1-bar {
        	all: unset;
            height: 70% ;
            width: 100%;
            display: flex;
            flex-direction: row;
            font-size: small;
            text-transform: uppercase;
            position: relative;
           
            



        }
        .nav1-bar .nav1-logo {
         height: 65px;
         width: 120px;
         margin-left: 10px;
        
        
        }
        
     .nav1-bar .nav1-logo img{
         height: 100%;
         width: 100%;
       
         
        
        } 

        .nav1-items {
            height: 100%;
            width: 100%;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
           
            
        }

        .nav1-items ul {
            height: 100%;
            width: auto;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            align-content: center;
            position: absolute;
            right: 0px;
            margin: 10px;
          
            



        }

        .nav1-items ul li {
            height: 100%;
            width: auto;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            margin-left: 10px;
        }



        .nav1-items ul li a {
            width: auto;
            all: unset;
            align-content: center;



        }
        .nav1-items ul li a:hover {
        color: rgb(44, 44, 132)
        }

        #signup {
            height: 100%;
            margin-left: 20px;
            margin-right: 10px;



        }
        #logout{
        	height: 100%;
            margin-left: 10px;
            margin-right: 10px;
            
          
        }
       

        #signup button {
            height: 40px;
            background-color: #D1AE6c;
            border-radius: 10px;
            outline: none;
            border: none;
            color: white;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
        }
        #logout input {
            height: 40px;
            background-color: #D1AE6c;
            border-radius: 10px;
            outline: none;
            border: none;
            color: white;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            
        }

        #signup button:hover{
            background-color: #e8c88b;

        }
        #logout input:hover{
            background-color: #e8c88b;

        }
  
  		#signup button {
           padding-left: 10px;
           padding-right: 10px;
           
        }
        #logout input {
           padding-left: 10px;
           padding-right: 10px;
           
        }
      

</style>
</head>
<body>
	

     <div class="no-bootstrap">
        <div class="nav1">
            <div class="address">
                <div class="phn">
                    <i class="fa-solid fa-phone"></i> +91-8310592220
                </div>
                <div class="location">
                    <i class="fa-solid fa-house-chimney"></i> Resort and spa, ring road Mysuru-570002, Karnataka,India
                </div>
            </div>
            <hr>
            <div class="nav1-bar">
                <div class="nav1-logo">
					<img src="Images/logo.png">
                </div>
                <div class="nav1-items">
                    <ul type="none">
                        <li><a href="userDashboard.jsp">Home</a></li>
                        <li><a href="contact.jsp">CONTACT</a></li>
                        <li><a href="Accommodation.jsp">Accommodation</a></li>
                        <li><a href="activites.jsp">Activities</a></li>
                        <li><a href="visit.jsp">See&nbsp;Mysuru</a></li>
                        <%HttpSession se = request.getSession(false);
                         User u = (User)se.getAttribute("USession");
                         
                       
                        if(u==null){ %>
                        <li  id="signup">
                            <a  href="UserLogin.jsp">
                             
                                    
                                    <button id="remove">SignUp/Login <i
                                            class="fa-regular fa-user"></i></button>


                            </a>
                        </li>
                        <%} %>
                        <%
                        if(u!=null){ %>
                        <li  id="logout">
                            
                                <form action="userAction" method="post" id="SignUpForm">
                                    
                                    
                                    <input type="submit" name="action" value="Logout">
                                    
                                    
                                </form>

                            
                        </li>
                        <%} %>
                        


                    </ul>
                </div>


            </div>
        </div>
</div>





</body>
</html>