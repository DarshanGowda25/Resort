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
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }
        
        .navItem {
            height: 50px;
            width: 100%;
            background-color: #efefef;
            padding-top: 1px;
            cursor: pointer;

        }

        .navItem ul {
            height: 100%;
			
            display: flex;
            flex-direction: row;
            justify-content: center;
            padding-top: 5px;
            align-items: center;



        }

        .navItem ul li {
            height: 100%;
           margin-top:15px; 
            
          





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

        .navItem ul> :first-child a {
            border-left: 1px solid #aaaaaa;

        }
        
        
        
        

        .img {
            width: 100%;
            height: 800px;
            background-image: url('Images/palace1.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
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
            margin-left:150px;
            font-size: 1.5rem;
            
        }

        .grid2 {
            width: 47%;
            font-size: 1rem;
            padding: 20px;
            
            margin-right:250px;
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
        
        .btn{
        	background-color: #D1AE6C;
        	color: black;
        	border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: bold;
        	cursor: pointer;
        	width:210px;
        	height:40px;
        	margin-left:360px;
        	margin-top:20px;
        	
        }
        .heading{
            font-family: 'Times New Roman', Times, serif;
            text-align: center;
            padding-top: 50px;
        }
        

    </style>
</head>
<body onscroll="scroll()">

	<header>
		<%@ include file="UDHeader.jsp" %>
	</header>
   

    <main>
        <div class="img"></div>

      <div class="navItem">
            <ul type="none">
                <li><a href="https://mysuruzoo.info/">Mysore Zoo</a></li>
                <li><a href="https://en.wikipedia.org/wiki/Chamundeshwari_Temple">Chamundeshwari Temple</a></li>
                <li><a href="https://en.wikipedia.org/wiki/Mysore_Palace">Mysore Palace</a></li>
                <li><a href="https://en.wikipedia.org/wiki/St._Philomena%27s_Cathedral,_Mysore">St.Philomena's Church</a></li>
                <li><a href="https://en.wikipedia.org/wiki/Melukote">Melukote Temple</a></li>
                <li><a href="https://www.mysoretourism.org.in/mysore-rail-museum">Railway Museum</a></li>
                <li><a href="https://www.holidify.com/places/mysore/edmuri-falls-sightseeing-1257898.html">Edmuri Falls</a></li>   
                <li><a href="https://www.lalithamahalpalace.co.in/">Lalitha Mahal Palace</a></li>

            </ul>
        </div>

        <div class="heading">
            <h1>See Mysore</h1>
        </div>
        <br>
        


		 <div class="wrapper">
            <div class="image-container">
                <div class="image-box">
                    <img src="Images/zoo.jpg" alt="Image 1"> 
                    <h1 class="overlay-text">Mysore Zoo</h1>
                    <a href="https://mysuruzoo.info/">
                    <button class="button">Read Me</button>
                    </a>
                </div>
                <div class="image-box">
                    <img src="Images/temple.jpg" alt="Image 2"> 
                    <h1 class="overlay-text">Chamundhi Temple</h1>
                    <a href="https://en.wikipedia.org/wiki/Chamundeshwari_Temple">
                    <button class="button">Read Me</button>
                    </a>
                </div>
            </div>
            
            

            <div class="image-container">
                <div class="image-box">
                    <img src="Images/palace.jpg" alt="Image 1"> 
                    <h1 class="overlay-text">Mysore Palace</h1>
                    <a href="https://en.wikipedia.org/wiki/Mysore_Palace">
                    <button class="button">Read Me</button>
                    </a>
                </div>
                <div class="image-box">
                    <img src="Images/chruch.jpg" alt="Image 2"> 
                    <h1 class="overlay-text">St.Philomena's Church</h1>
                    <a href="https://en.wikipedia.org/wiki/St._Philomena%27s_Cathedral,_Mysore">
                    <button class="button">Read Me</button>
                    </a>
                </div>
            </div>

            <div class="image-container">
                <div class="image-box">
                    <img src="Images/melkote.jpg" alt="Image 1"> 
                    <h1 class="overlay-text">Melukote Temple</h1>
                    <a href="https://en.wikipedia.org/wiki/Melukote">
                    <button class="button">Read Me</button>
                    </a>

                </div>
                <div class="image-box">
                    <img src="Images/rail.jpg" alt="Image 2"> 
                    <h1 class="overlay-text">Railway Museum</h1>
                    <a href="https://www.mysoretourism.org.in/mysore-rail-museum">
                    <button class="button">Read Me</button>
                    </a>
                </div>
            </div>

            <div class="image-container">
                <div class="image-box">
                    <img src="Images/falls.jpg" alt="Image 1"> 
                    <h1 class="overlay-text">Edmuri Falls</h1>
                   <a href="https://www.holidify.com/places/mysore/edmuri-falls-sightseeing-1257898.html">
                    <button class="button">Read Me</button>
                    </a>
                </div>
                <div class="image-box">
                    <img src="Images/lalith.jpg" alt="Image 2"> 
                    <h1 class="overlay-text">Lalitha Mahal Palace</h1>
                   <a href="https://www.lalithamahalpalace.co.in/">
                    <button class="button">Read Me</button>
                    </a>
                </div>
            </div>

        </div> 
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