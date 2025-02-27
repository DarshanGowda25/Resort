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
    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <style>
        body{
            margin: 0;
            margin-top:100px;
        }

        main{
            height: auto;
            display:flex;
            flex-direction:column;
            gap:210px;
            
    
        }
        
        .block{
        width:100%;
        height:650px;
        }
        
        

       
        .head{
            text-align: center;
             font-family: 'Times New Roman', Times, serif;
           
        }

        .wrapper{
            display: flex;
            flex-direction: column;
            gap: 50px;
            padding: 0 20px;
            height:450px;
            
        }

        .container{
            display: flex;
            gap: 20px;
            justify-content: center;
            height: 450px;
        }
        
        

        .text_img{
            position: relative;
            width: 500px;
            height: auto;
            overflow: hidden;
           
        }

        

        .imgdiv {
            width: 100%;
            height: 450px;
            overflow: hidden;
          
        }


        .img1{
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        p{
        margin-top:40px;
            font-size: large;
            letter-spacing: 1px;
            line-height: 1.5;
             font-family: 'Times New Roman', Times, serif;
        }

       /*  button{
            width: 100px;
            height: 50px;
            border: none;
            border-radius: 5px;
            background-color: #D1AE6C;
            color:black;
            
            margin-left: 300px; */
            
        }
        h1{
            text-transform: uppercase;
        }
        
		.alert {
		    width: 400px;         
		    text-align: center;  
		    margin: 0 auto;       
		    padding: 10px;       
		    font-weight: bold;    
		}
		
		.flex-container {
		margin-top:50px;
		margin-left:400px;
		    display: flex;         
		    align-items: center;   
		    gap: 20px;            
		}
		
		
		.price{
		width:180px;
		background-color: #D1AE6C;
		 text-align: center;
		 border-radius: 5px; 
		
		}
		
		
		div h2{
		font-family: 'Times New Roman', Times, serif;
		font-weight: bold;  
		}
		
		
		
		.input-container{
            height: 110px;
            width: 60%;
            margin-left: 400px;
            margin-bottom: 30px;
            align-content: center;
        }
        .input-container form{
            height: 100%;
            width: 100%;
            display: flex;
            flex-direction: row;
            justify-content: flex-start;
            align-items: center;
        }
        .input-container form input{
            margin-right: 50px;
            padding: 4px;
            margin-left: 10px;
        }
        .input-container #NoPeople{
            width: 30px;
            outline: none;
            border: none;

            
        }

        .input-container #BookActivity{
            height: 30px;
            width: 100px;
            margin-left: 20px;
            background-color: #D1AE6c;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            position: relative;
            top:50px;
            right: 120px;
        }
        .input-container #BookActivity:hover{
            background-color: #e2c388;
        }

        
        
        
        
        

        

    </style>
</head>
<body>

	<header>
		<%@ include file="UDHeader.jsp" %>
	</header>


	

    <main>
          
    
     <%
    		 UserImpl us=new UserImpl(); 
     		String uid=request.getParameter("id");
     		int id=Integer.parseInt(uid);
			ArrayList<Activity> al = us.getActivityList(id);
			Iterator<Activity> it = al.iterator();
			while (it.hasNext()) {
				Activity a = it.next();
			
			%> 
    
     <div id="golf">
    <div class="block">
        <h1 class="head"><%=a.getAname() %></h1>

        

        <div class="wrapper">
            <div class="container">
                <div class="text_img">
                    <p><%=a.getAbout() %></p>
                </div>
                <div class="text_img">
                    <div class="imgdiv">
                        <img src="Images/<%=a.getImage() %>" alt="" class="img1">
                    </div>
                </div>
            </div>
        </div>

        
        <div class="input-container">
            <form action="activityAction" method="post" id="golfBookingForm">
                <label>Number Of People:</label>
                <input type="number" name="NoPeople" id="NoPeople" value="1" min="1" required>

                <label>Activity-Date:</label>
                <input type="date" id="CheckIn" name="date" required>

                <label id="price">Total Price:<%=a.getPrice() %></label>
                <input type="hidden" value="<%= a.getPrice() %>" id="p">
                <input type="hidden" name="price" id="totalPriceInput">
                
                <input type="hidden" name="id" value="<%=a.getId() %>">
               	 <input type="submit" name="submit" id="BookActivity" value="Book">
          
            </form>
        </div>
    </div>
</div>
        
        <%} %>
        
       

    </main>
    
    	    <footer>
    	<%@ include file="UDFooter.jsp" %>
    </footer>
    
    
    <script>
    window.onload = function() {
        function updatePrice() {
            let noPeople = parseInt(document.getElementById("NoPeople").value) || 1; // Ensure valid number
            let basePrice = parseFloat(document.getElementById("p").getAttribute("value")) || 0; // Get initial price
            
            let totalPrice = basePrice * noPeople; // Calculate total price
            
            // Update the label text dynamically
            let priceLabel = document.getElementById("price");
            priceLabel.innerHTML = "Total Price: " + totalPrice;
            
            // Update a hidden input to send total price in the form
            document.getElementById("totalPriceInput").value = totalPrice;
        }

        // Attach event listener
        document.getElementById("NoPeople").addEventListener("input", updatePrice);

        updatePrice(); // Call function initially
    };
    
    const navbar = document.querySelector(".nav1")
	navbar.classList.add('scrolled');
    
    
    const today = new Date().toISOString().split('T')[0];
    document.getElementById('CheckIn').setAttribute('min', today);
    
    
    
    
    
    
   




    
    
    
    

       

</script>


    
</body>
</html>