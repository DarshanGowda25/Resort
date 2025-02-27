<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accommodation</title>
    
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    	<!-- Bootstrap JavaScript Bundle (Includes Popper.js) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    	
    <style>
        * {
            margin: 0%;
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
           
        }

        body {
            height: 100vh;
            width: 100%;


        }

        .DashBoard-container {
            width: 100%;
            display: flex;
            flex-direction: column;
            z-index: 0;
        }

        .DashBoard-container .img-container {
            height: 700px;
            width: 100%;
            background-image: url("Images/roomDash.jpg");
            background-position: center;
            background-size: cover;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .DashBoard-container .img-container .box {
            height: 200px;
            width: 50%;
            background-color: rgba(0, 0, 0, 0.664);
            text-align: center;
            display: flex;

            flex-direction: column;
            justify-content: center;
            align-items: center;

        }

        .DashBoard-container .box h1 {
            font-size: 40px;
            color: white;
        }

        .DashBoard-container .img-container .line {
            height: 5px;
            width: 150px;
            background-color: #D1AE6c;
        }

        .DashBoard-container .room-container {
            width: 100%;
            display: flex;
            flex-direction: column;
            z-index: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            position:relative;
            margin-top: 30px;
          

        }
        
        .room-container #history{
        	position: absolute;
        	top: 5px;
        	right:100px;
        }
        
        .room-container #history input{
        	border: none;
        	background-color:#D1AE6c;
        	padding: 8px;
        	border-radius: 5px; 
        	color: white;
        }
        
        .room-container #history input:hover{
        	background-color: #e8c88b;
        }

        .DashBoard-container .room-container h1 {
            color: rgb(0, 0, 0);

        }

        .DashBoard-container .room-container .line {
            height: 5px;
            width: 100px;
            background-color: #D1AE6c;
            margin-bottom: 30px;

        }

        .DashBoard-container .room-container .rooms {
            width: 100%;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;

        }

        .DashBoard-container .rooms .room {
            height: 300px;
            width: 450px;
            background-color: #D1AE6c;
            margin: 25px;
            box-shadow: 5px 5px 5px rgb(51, 51, 51);
            position: relative;
        }


        #dulex {
            background-image: url("Images/DulexRoom.jpg");
            background-position: center;
            background-size: cover;


        }

        #normal {
            background-image: url("Images/NormalRoom.jpg");
            background-position: center;
            background-size: cover;
        }

        .DashBoard-container .room .price {
            height: 50px;
            width: 80px;
            position: absolute;
            top: 0px;
            left: 0px;
            background-color: rgba(0, 0, 0, 0.80);
            border-bottom-right-radius: 20px;
            align-content: center;
            text-align: center;
            color: white;
            


        }

        .DashBoard-container .buttonStyle {
            height: 50px;
            width: 150px;
            font-size: large;
            color: black;
            background-color: #ceb381;
            border: 2px solid #ceb381;
            position: absolute;
            top: 120Px;
            left: 150px;
            z-index: 1;


        }

        .DashBoard-container .buttonHoverStyle {
            border: 4px solid #ceb381;
            color:#ceb381;
            background-color: transparent;
            font-weight: bolder;
            transition: all 0.3s ease;

        }


        .DashBoard-container .room .room-footer {
            height: 40px;
            width: 100%;
            position: absolute;
            bottom: 0%;
            background-color: rgb(30, 30, 30);
            align-content: center;
            text-align: center;
            color:White;
           
        }
   /*      .room-footer h3{
        color:white;
        }
 */

        .DashBoard-container .price h4 {
            font-family: monospace;
            font-weight: lighter;
            font-size: smaller;
            margin: 0px;

        }

        .DashBoard-container .price h6 {
            font-family: monospace;
            font-weight: lighter;
            font-size: smaller;
            margin: 0px;

        }

        .DashBoard-container .room:hover {
            box-shadow: 10px 10px 5px rgb(51, 51, 51);
            transition: all 0.5s ease;

        }
          .alert{
        	
        	position: fixed;
        	top:120px;
        	left:700px;
        	z-index: 1000;
        	
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

    <main>
    
        <div class="DashBoard-container">
        
        	<%if(request.getAttribute("success")!=null){ %>
	
		<div class="alert alert-success alert-dismissible fade show" role="alert">
  			<strong></strong><%=request.getAttribute("success")%>
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" id="btn"></button>
		</div>
	
	<%} %>
		<%if(request.getAttribute("failure")!=null){ %>
	
		<div class="alert alert-danger alert-dismissible fade show" role="alert">
  			<strong></strong><%=request.getAttribute("failure")%>
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" id="btn"></button>
		</div>
	
	<%} %>
        
        
            <div class="img-container">
                <div class="box">
                    <h1>WELCOME</h1>
                    <div class="line">

                    </div>

                </div>

            </div>
            <div class="room-container">
                <h1>OUR ROOMS</h1>
                <div class="line">

                </div>
                
           <form action="room_func" method="post">
					
				
                <a href="BookingHistory.jsp"  id="history"><input type="submit" name="submit" value="Booking History"></a>

            </form>
            
              
                <div class="rooms">
                    <div class="room" id="dulex">
                        <div class="price">
                            <h4>&#8377;3000</h4>
                            <h6>per night</h6>
                        </div>

                        <div class="room-footer">
                            <h3>Dulex</h3>
                        </div>

                    </div>
                    <div class="room" id="normal">
                        <div class="price">
                            <h4>&#8377;2000</h4>
                            <h6>per night</h6>
                        </div>

                        <div class="room-footer">
                            <h3>Normal</h3>
                        </div>

                    </div>

                </div>
            </div>
        </div>

    </main>
    <footer>
    	<%@ include file="UDFooter.jsp" %>
    </footer>
    <script>
        function changeContent() {
            let roomContainer = document.querySelectorAll(".room")
            let ct=0;




            roomContainer.forEach(room => {
            	ct++;
                let price = room.querySelector('.price'); // Select price specific to the hovered room
                let button = document.createElement("button");
                button.innerText = "FEATURES";
                button.classList.add("buttonStyle");
                button.innerText = "FEATURES";


                // Create an anchor tag around the button
               
                let link = document.createElement("a");
                if(ct==1){
                link.href = "DulexRoom.jsp";  // Add the link here
                }else if(ct==2){
                	link.href = "NormalRoom.jsp";
                	
                }
              
                link.appendChild(button);

                room.addEventListener("mouseenter", function () {
                    price.style.opacity = "0";
                    room.style.filter = "brightness(50%)";
                    room.append(link);
                    button.addEventListener("mouseenter", function () {
                        button.classList.add("buttonHoverStyle");
                    });
                    button.addEventListener("mouseleave", function () {
                        button.classList.remove("buttonHoverStyle");
                    })




                })
                room.addEventListener("mouseleave", function () {
                    price.style.opacity = "1";
                    room.style.filter = "brightness(100%)";
                    link.remove();


                })

            });
        }
        document.addEventListener("DOMContentLoaded", changeContent);
        
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
</body>

</html>