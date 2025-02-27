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
            font-family: 'Times New Roman', Times, serif;
           
        }
        main {
        	margin-top:100px;
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            padding: 20px;
        }
        h1 {
            text-align: center;
        }
        .container {
            display: flex;
            flex-direction: row;
            justify-content: center;
            
            gap: 50px;
            width: 80%;
            max-width: 1200px;
            padding-bottom: 20px;
         
        }
        .grid1, .grid2 {
            flex: 1;
            padding: 20px;
        }
        .grid1 .address h3{
        margin-bottom: 15px;
        }
        .grid1 .address{
        display: flex;
        flex-direction: column;
        line-height: 4px;
        }
        .grid1{
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .grid1 h3 {
            margin-bottom: 5px;
        }
        .grid1 p {
            margin: 5px 0;
        }
        .grid2 form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        .grid2 span {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .grid2 input  {
            width: 100%;
            height: 30px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .grid2 textarea{
            width: 100%;
            height: 150px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .map {
           
            width: 80%;
            max-width: 1200px;
            display: flex;
            justify-content: center;
        }
        iframe {
            width: 100%;
            
        }

        .btn input{
            width: 100px;
            height: 30px;
            border: none;
            background-color: #D1AE6c;
            cursor: pointer;
        }
        .success{
        color:green;
        }
        .failure{
        color:red;
        }
        
        
    </style>
</head>
<body>
        
<header>
		<%@ include file="UDHeader.jsp" %>
	</header>

           <main>
           <%if(request.getAttribute("success")!=null){ %>
           <h2 class="success"><%=request.getAttribute("success") %></h2>
           <%} %>
           
           <%if(request.getAttribute("failure")!=null){ %>
           <h2 class="failure"><%=request.getAttribute("failure") %></h2>
           <%} %>
           
            <h1>Contact</h1>
            <div class="container">
                <div class="grid1">
                    <div class="address">
                        <h3>Address</h3>
                        <p>Heritage Resort</p>
                        <p>Mysore,</p>
                        <p>Karnataka, India</p>
                    </div>
                    <div class="res">
                        <h3>Reservation Contact</h3>
                        <p>+91-8904216839</p>
                        <p>+91-8310592220</p>
                    </div>
                    <div class="mail">
                        <h3>Email</h3>
                        <p>&#x1F4E7; reservation@heritage.com </p>
                    </div>
                    
                </div>

                <div class="grid2">
                    <form action="userAction" method="post">

                        <div class="name">
                            <span>Name</span>
                            <input type="text" name="name" placeholder="Your name" required>
                        </div>

                        <div class="no">
                            <span>Mobile No</span>
                            <input type="tel" name="phone" placeholder="Your Phone Number">
                        </div>

                        <div class="mail">
                            <span>Email</span>
                            <input type="email" name="email" placeholder="E-mail" required>
                        </div>

                        <div class="add">
                            <span>Address</span>
                            <textarea name="address"></textarea>
                        </div>

                        <div class="message">
                            <span>Message</span>
                            <textarea name="message"></textarea>
                        </div>

                        <div class="btn">
                            <input type="submit" name="action" value="contact">
                        </div>
                        
                    </form>
                </div>
            </div>

            <div class="map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d54126.97437106674!2d76.62012518502138!3d12.327639306018519!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1739017032086!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
           </main>
               <footer>
    	<%@ include file="UDFooter.jsp" %>
    </footer>
    <script type="text/javascript">
    const navbar = document.querySelector(".nav1")
	navbar.classList.add('scrolled');
    </script>
</body>
</html>