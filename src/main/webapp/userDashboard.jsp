<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DashBoard</title>

<style type="text/css">

		  .DashBoard-container {
            width: 100%;
            display: flex;
            flex-direction: column;
           
            top: 0%;
            left: 0%;
            z-index: 0;
            
        }

        .DashBoard-container .video-container {
            height: 700px;
            width: 100%;
            z-index: -1;

        }

        .video-container video {
            /* Ensures the video covers the screen */
            width: 100%;
            height: 100%;
            object-fit: cover;
            object-position: center;
        }


        /* <!----> */
        .navItem {
            height: 40px;
            width: 100%;
            background-color: #efefef;
            padding-top: 10px;
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





        }

        .navItem ul li a {
            all: unset;
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

        .navItem ul> :first-child a {
            border-left: 1px solid #aaaaaa;

        }

        /* <!-- --> */
        .box1-container {
            height: auto;
            width: 100%;
            background-color: #ffffff;
            display: flex;
            flex-direction: column;

        }

        .box1-container .part1 {
            height: 350px;
            width: 100%;
            display: flex;
            flex-direction: row;
            justify-content: center;
           
        }

        .box1-container .part2 {
            height: 350px;
            width: 100%;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 30px;
            
          
        }
        .box1-container .part3 {
            height: 500px;
            width: 100%;
            text-align: center;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            align-items: center;
            
            background-color: #efefef;
            
          
        }

        .part1 .heading {
            height: 100%;
            width: 30%;
            text-align: left;
            align-content: center;
            text-transform: uppercase;

        }

        .part1 .heading h1 {
            margin-top: 20px;

        }

        .part1 .para {
            height: 100%;
            width: 50%;
            text-align: left;
            align-content: center;
            line-height: 1.8; 
        }

        .box1-container .part2 .heading {
            width: 100%;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .box1-container .part2 .heading h3{
            text-transform: uppercase;
        }
        .box1-container .part2 .heading #line{
            height: 3px;
            width: 25px;
            background-color: #bc9c62;
        }

        .box1-container .part2 .content {
            width: 100%;
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
            align-items: center;
            margin-top: 30px;
        }
        .box1-container .part2 .content .box{
            height: 300px;
            width: 300px;
            background-color: #934c4c;
            background-position: center;
            background-size: cover;
            

        }
        .box1-container .part2 .content #box1{
            background-image: url("Images/Dash1.png");
          
        }
        .box1-container .part2 .content #box2{
            background-image: url("Images/Dash2.jpeg");
            
        }
        .box1-container .part2 .content #box3{
            background-image: url("Images/Dash3.jpeg");
           
        }
        .box1-container .part2 .content #box4{
            background-image: url("Images/Dash4.jpeg");   
        }

        
        /* <!-- --> */

        .box1-container .part3 .box1{
            height: 450px;
            width: 500px;
            margin: 10px;
            color: #4D4D4F;
        }
        .box1-container .part3 #box11{
            align-content: center;
            
            
        }

        .box1-container .part3 #box11 h4{
            margin-bottom: 30px;
            
            
        }
        .box1-container .part3 #box22{
            background-image: url("Images/Dash5.jpg");
            background-position: center;
            background-size: cover;
        }
        .box1-container .part3 #box33{
            align-content: center;
            
            
        }
        .box1-container .part3 #box33 h2:first-of-type{
            color:#D1AE6c;

        }
        .box1-container .part3 #box33 h2:nth-of-type(2){
            margin-left: 180px;
            font-family: cursive;
            font-style: italic;

        }
        .box1-container .part3 #box33 h2:nth-of-type(3){
            margin-left: 120px;
            font-family: cursive;
            font-style: italic;

        }
        .box1-container .part3 #box11 .icons{
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            margin-top: 15px;
        }
        .box1-container .part3 #box11 .icons span{
            padding: 10px;
            margin-left: 15px;
        }

</style>
</head>
<body onscroll="scroll()">
	<header>
		<%@ include file="UDHeader.jsp"%>
	</header>
	<main>
		 <div class="DashBoard-container">
            <div class="video-container">
                <video autoplay loop muted playsinline>
                    <source src="Montrose-Desktop.mp4" type="video/mp4">

                </video>

            </div>
        
        <div class="navItem">
            <ul type="none">
                <li><a href="activites.jsp">Activities</a></li>
                <li><a href="Accommodation.jsp">Services</a></li>
                <li><a href="visit.jsp">NearBy Places</a></li>

            </ul>
        </div>
        <div class="box1-container">
            <div class="part1">
                <div class="heading">
                    <h3>Discover heritage</h3>
                    <h1>
                        Mysuru's Premier
                        Golf Resort
                        and Spa
                    </h1>

                </div>
                <div class="para">
                    <p>Nestled in the heart of Mysuru and set within 20 acres of mature woodlands is the Heritage Golf
                        Resort & Spa. Arriving at the Heritage Estate is just the start of a unique luxury experience.
                        Whether it’s nature or the luxury, or a little bit of both, that brings you to Mysuru, Heritage
                        Golf Resort & Spa has perfected the art of luxury and service.
                        The pristine location pays tribute to the landscapes of Coorg in all its glory whilst offering
                        utmost luxury, so that you can soak in the beauty of the natural milieu, even as you revel in
                        the best of comfort Coorg has to offer.
                        Heritage Golf Resort & Spa, with its breathtaking views, Golf Course, bountiful plantations,
                        aesthetic architecture, well-groomed ornamental gardens and an unending list of activities to
                        keep you entertained, Heritage becomes Mysuru's only complete holiday destination</p>

                </div>
            </div>
            <div class="part2">
                <div class="heading">
                    <p>Explore More</p>
                    <div id="line"></div>
                </div>

                <div class="content">
                    <div class="box" id="box1">

                    </div>
                    <div class="box" id="box2">

                    </div>
                    <div class="box" id="box3">

                    </div>
                    <div class="box" id="box4">

                    </div>

                </div>

            </div>

            <div class="part3">
                <div class="box1" id="box11">
                    <h4>#Heritage</h4>
                    <h1>JOIN</h1> 
                    <h1><i>the</i></h1>
                    <h1>HERITAGE LIFESTYLE</h1>
                    <div class="icons">
                        <span><h2><i class="fa-brands fa-facebook-f"></i></h2></span>
                        <span><h2><i class="fa-brands fa-twitter"></i></h2></span>
                        <span><h2><i class="fa-brands fa-instagram"></i></h2></span>
                        <span><h2><i class="fa-brands fa-youtube"></i></h2></span>
                    </div>

                </div>
                <div class="box1" id="box22">

                </div>
                <div class="box1" id="box33">
                    <h2>HERITAGE</h2>
                    <h2>Golf Resort</h2>
                    <h2>& Spa</h2>

                </div>

            </div>

        </div>
        </div>
    </main>
    <footer>
    	<%@ include file="UDFooter.jsp"%>
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



</body>
</html>