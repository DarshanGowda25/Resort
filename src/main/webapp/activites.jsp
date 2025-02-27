<%@page import="com.MVC.Model.UserImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.MVC.Model.Activity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
body {
	margin: 0;
	font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI',
		Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue',
		sans-serif;
}

.navItem {
	height: 50px;
	width: 100%;
	background-color: #efefef;
	padding-top: 1px;
	cursor: pointer;
}

.navItem ul {
	height: 90%;
	display: flex;
	flex-direction: row;
	justify-content: center;
	padding-top: 5px;
}

.navItem ul li {
	height: 100%;
	margin-top: 10px;
}

.navItem ul li a {
	width: auto;
	text-decoration: none;
	padding-right: 30px;
	padding-left: 30px;
	border-right: 1px solid #aaaaaa;
	color: #4D4D4F;
}

.navItem ul li a:hover {
	color: rgb(44, 44, 132);
}

.navItem ul>:first-child a {
	border-left: 1px solid #aaaaaa;
}

.img {
	width: 100%;
	height: 900px;
	background-image: url('Images/bird.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	padding-top: 100px;
}

.tag {
	width: 100%;
	height: 60px;
	background-color: #c5bdbd;
	display: flex;
	justify-content: center;
	align-items: center;
}

.grid {
	display: flex;
	justify-content: space-between;
	margin: 50px 0;
	padding: 0 20px;
}

.grid1 {
	font-family: 'Times New Roman', Times, serif;
	width: 45%;
	margin-left: 150px;
	font-size: 1.5rem;
}

.grid2 {
	width: 47%;
	font-size: 1rem;
	padding: 20px;
	margin-right: 250px;
}

.wrapper {
	display: flex;
	flex-direction: column;
	gap: 50px;
	padding: 0 20px;
}

.image-container {
	display: flex;
	gap: 20px;
	justify-content: center;
}

.image-box {
	position: relative;
	width: 500px;
	height: 600px;
	overflow: hidden;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

.image-box img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.overlay-text {
	width: 250px;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
	font-size: x-large;
	font-weight: bold;
	text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
	font-family: 'Times New Roman', Times, serif;
	transition: top 0.3s ease-in-out;
}

.button {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #D1AE6C;
	color: black;
	padding: 12px 24px;
	border: none;
	border-radius: 5px;
	font-size: 1rem;
	font-weight: bold;
	opacity: 0;
	transition: opacity 0.3s ease-in-out;
	cursor: pointer;
}

.btn {
	background-color: #D1AE6C;
	color: black;
	border: none;
	border-radius: 5px;
	font-size: 1rem;
	font-weight: bold;
	cursor: pointer;
	width: 210px;
	height: 40px;
	margin-left: 360px;
	margin-top: 20px;
}
</style>
</head>
<body onscroll="scroll()">

	<header>
		<%@ include file="UDHeader.jsp"%>
	</header>


	<main>
		<div class="img"></div>

		<div class="navItem">
			<ul type="none">
				<li><a href="activityBook.jsp?id=1">Golf Academy</a></li>
				<li><a href="activityBook.jsp?id=2">Horse Riding</a></li>
				<li><a href="activityBook.jsp?id=3">Spa & Pool</a></li>
				<li><a href="activityBook.jsp?id=4">In-House Theater</a></li>
				<li><a href="activityBook.jsp?id=5">Coffee Museum</a></li>
				<li><a href="activityBook.jsp?id=6">Shooting Range</a></li>
				<li><a href="activityBook.jsp?id=7">Bird-Sighting Tour</a></li>
				<li><a href="activityBook.jsp?id=8">Trail-Walk & Trek</a></li>

			</ul>
		</div>


		<div class="grid">
			<div class="grid1">
				<p>DISCOVERY HERITAGE</p>
				<h1>MYSORE PREMIER ACTIVITIES</h1>
			</div>
			<div class="grid2">
				<p>Live and experience the excitement and rush of shooting a
					pistol and feel your breath as you squeeze the trigger. The
					salon-themed shooting range, located right off our riding school,
					lets you enjoy an action-packed, fun-filled session with family and
					friends as you prove your mettle as an expert marksman.</p>
				<a href="activityStatus.jsp"><button class="btn">Activity
						Booked Status</button></a>
			</div>
		</div>

		<%
		UserImpl us = new UserImpl();
		ArrayList<Activity> ar = us.getActivityList();
		Iterator<Activity> itr = ar.iterator();
		int count = 0;
		%>


		<div class="wrapper">
			<div class="image-container">
				<!-- Start first row -->
				<%
				while (itr.hasNext()) {
					Activity a = itr.next();
				%>
				<div class="image-box">
					<img src="Images/<%=a.getImage()%>">
					<h1 class="overlay-text"><%=a.getAname()%></h1>

					<a href="activityBook.jsp?id=<%=a.getId()%>">
						<button class="button">Read Me</button>
					</a>


				</div>
				<%
				count++;

				// If count is even, close current row and start a new one
				if (count % 2 == 0 && itr.hasNext()) {
				%>
			</div>
			<!-- Close current row -->
			<div class="image-container">
				<!-- Start new row -->
				<%
				}
				}
				%>
			</div>
			<!-- Close last row -->
		</div>
		<!-- Close wrapper -->


		<%-- <div class="wrapper">
            <div class="image-container">
                <div class="image-box">
                    <img src="Images/golf.jpg" alt="Image 1"> 
                    <h1 class="overlay-text">Golf Academy</h1>
                    <a href="activityBook.jsp#golf">
                    <button class="button">Read Me</button>
                    </a>
                </div>
                <div class="image-box">
                    <img src="Images/riding.jpg" alt="Image 2"> 
                    <h1 class="overlay-text">Horse Riding</h1>
                    <a href="activityBook.jsp#horse">
                    <button class="button">Read Me</button>
                    </a>
                </div>
            </div>
            
            <%} %>

            <div class="image-container">
                <div class="image-box">
                    <img src="Images/budda.jpg" alt="Image 1"> 
                    <h1 class="overlay-text">Spa & Pool</h1>
                    <a href="activityBook.jsp#spa">
                    <button class="button">Read Me</button>
                    </a>
                </div>
                <div class="image-box">
                    <img src="Images/theater.jpg" alt="Image 2"> 
                    <h1 class="overlay-text">In-House Theater</h1>
                    <a href="activityBook.jsp#theater">
                    <button class="button">Read Me</button>
                    </a>
                </div>
            </div>

            <div class="image-container">
                <div class="image-box">
                    <img src="Images/coffee.jpg" alt="Image 1"> 
                    <h1 class="overlay-text">Coffee Museum</h1>
                    <a href="activityBook.jsp#coffee">
                    <button class="button">Read Me</button>
                    </a>

                </div>
                <div class="image-box">
                    <img src="Images/shooting.jpg" alt="Image 2"> 
                    <h1 class="overlay-text">Shooting Range</h1>
                    <a href="activityBook.jsp#shooting">
                    <button class="button">Read Me</button>
                    </a>
                </div>
            </div>

            <div class="image-container">
                <div class="image-box">
                    <img src="Images/bird.png" alt="Image 1"> 
                    <h1 class="overlay-text">Bird-sighting Tours</h1>
                   <a href="activityBook.jsp#bird">
                    <button class="button">Read Me</button>
                    </a>
                </div>
                <div class="image-box">
                    <img src="Images/trek.png" alt="Image 2"> 
                    <h1 class="overlay-text">Trail-walks & Treks</h1>
                   <a href="activityBook.jsp#trek">
                    <button class="button">Read Me</button>
                    </a>
                </div>
            </div>

        </div> --%>
	</main>
	    <footer>
    	<%@ include file="UDFooter.jsp" %>
    </footer>

	<script>
        
        const imageBoxes = document.querySelectorAll('.image-box');

        // Loop through each image box and add event listeners for mouse hover
        imageBoxes.forEach(imageBox => {
            const overlayText = imageBox.querySelector('.overlay-text');
            const button = imageBox.querySelector('.button');

            // On mouse enter (hover)
            imageBox.addEventListener('mouseenter', () => {
                overlayText.style.top = '35%'; 
                button.style.opacity = '1'; // Show the button
            });

            // On mouse leave (exit hover)
            imageBox.addEventListener('mouseleave', () => {
                overlayText.style.top = '50%'; 
                button.style.opacity = '0'; // Hide the button
            });
        });
        
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