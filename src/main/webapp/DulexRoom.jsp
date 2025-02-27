<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>room</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100&display=swap');
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

        .img-container {
            height: 500px;
            width: 100%;
            background-image: url("Images/DulexRoom2.jpg");
            background-position: center;
            background-size: cover;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin-bottom: 25px;
        }

        .img-container .box {
            height: 200px;
            width: 50%;
            background-color: rgba(0, 0, 0, 0.664);
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;

        }
        .img-container .box button{
            height: 40px;
            width: 130px;
            background-color: transparent;
            border: 2px solid #D1AE6c;
            color:#D1AE6c;
            margin-top: 20px;
            cursor: pointer;
        }
        .img-container .box button:hover{
            background-color: #D1AE6c;
            color: black;
            border: none;
            
        }

        .box h1 {
            font-size: 40px;
            color: white;
        }

        .img-container .line {
            height: 5px;
            width: 350px;
            background-color: #D1AE6c;

        }

        .img-containers {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;


        }

        .img-containers .img-container {
            height: 200px;
            /* Increase height */
            width: 360px;
            /* Increase width */
            background-size: cover;
            background-position: center;
            margin: 30px;

        }

        .img-containers .img-container:nth-child(1) {
            background-image: url("Images/DulexRoom2.jpg");

        }

        .img-containers .img-container:nth-child(2) {
            background-image: url("Images/DulexRoom3.jpg");

        }

        .img-containers .img-container:nth-child(3) {
            background-image: url("Images/DulexBathroom.jpg");

        }

        .info {
            height: 300px;
            width: 100%;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
     

        }

        .info .features {
            
            height: 100%;
            width: 40%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
        }

        .info .information {
            width: 35%;
            height: 100%;
            align-content: center;
            padding-left: 55px;

           
        }

        .info .features h3 {
            font-weight: bold;
            margin-bottom: 20px;
            letter-spacing: 2px;
        }

        .info .features table {
            height: 25%;
            width: 100%;
            font-size: medium;
            font-weight:100;
            letter-spacing: 1px;
        }
        
        .info .information h2 {
            margin-top: 25px;
            font-weight: bolder;
            margin-bottom: 20px;
            font-size: x-large;
            font-family: 'Poppins', sans-serif;
            letter-spacing: 3px;
            
        }


        .info .information ul {
            display: flex;
            flex-direction: column;
            justify-content: center;

        }

     

        .info .information ul li{
            padding: 8px;
            font-size: large;
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            letter-spacing: 2px;
            
        }

        .input-container{
            height: 150px;
            width: 80%;
            margin-left: 160px;
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
        .input-container #NoRooms{
            width: 30px;
            outline: none;
            border: none;

            
        }

        .input-container #BookRoom{
            height: 30px;
            width: 100px;
            margin-left: 20px;
            background-color: #D1AE6c;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
           
        }
        .input-container #BookRoom:hover{
            background-color: #e2c388;
        }
        .alert{
        	
        	position: fixed;
        	top:15px;
        	left:550px;
        	z-index: 1000;
        	
        }
       
      
        
    </style>
</head>

<body>
	
	<%if(request.getAttribute("failure")!=null){ %>
	
		<div class="alert alert-danger alert-dismissible fade show" role="alert">
  			<strong></strong><%=request.getAttribute("failure")%>
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" id="btn"></button>
		</div>
	
	<%} %>



    <div class="DashBoard-container">
        <div class="img-container">
            <div class="box">
                <h1>WELCOME TO DULEX ROOM</h1>
                <div class="line">

                </div>
                <a href="Accommodation.jsp"><button>BACK</button></a>
            </div>

        </div>
        <div class="img-containers">
            <div class="img-container">

            </div>
            <div class="img-container">

            </div>
            <div class="img-container">

            </div>


        </div>

        <div class="info">
            <div class="features">
                <h3>Features :</h3>


                <table>
                    <tr>
                        <td>-Comfortable Bed & Pillow</td>
                        <td>-Full-sized, pH-balanced toiletries</td>
                    </tr>
                    <tr>
                        <td>-Plush pillows and breathable bed linens</td>
                        <td>-Soft, oversized bath towels</td>
                    </tr>
                    <tr>
                        <td>-Internet,TV</td>
                        <td>-TopView</td>
                    </tr>
                    <tr>
                        <td>-Hot Water</td>
                        
                    </tr>
                </table>

            </div>

            <div class="information">
                <h2><b>Information:</b></h2>
                <ul type="none">
                    <li>Price : 3000</li>
                    <li>Size : 500SQFT</li>
                    <li>Max Capacity : 2 People </li>
                    <li>Free BreakFast Available</li>
                    <li>Pets Not Allowed</li>
                </ul>


            </div>

            
        </div>
        <div class="input-container">

            <form action="room_func" method="post">

                <label >Number Of Rooms : </label>
                <input type="number" name="NoRooms" id="NoRooms" value="1"  min="1" required="required">

                <label >Check-In : </label>
                <input type="date" id="CheckIn" name="CheckIn" required="required">

                <label >Check-Out : </label>
                <input type="date" id="CheckOut" name="CheckOut" required="required">
                
                
                

                
             
                
				
					
				<input type="hidden" name="room" value="Dulex">
                <a href="RoomCheckOut.jsp"><input type="submit" name="submit" id="BookRoom" value="Check Out"></a>

            </form>

        </div>
    </div>
    
    <footer>
    	<%@ include file="UDFooter.jsp" %>
    </footer>
    <script>
         const today = new Date().toISOString().split('T')[0];
         //expamlple  new data-> "2025-02-06T14:30:45.123Z"
         // roString()->["2025-02-06", "14:30:45.123Z"]
         //output-> 2025-02-06.
      
         
          document.getElementById('CheckIn').setAttribute('min', today);// "2025-02-01"
         
         const CheckIn = document.getElementById('CheckIn').value;
         document.getElementById('CheckIn').addEventListener('change', function() {
        	 let checkInDate = new Date(this.value);
        	 	checkInDate.setDate(checkInDate.getDate() + 1);
        	 	let minCheckOut = checkInDate.toISOString().split('T')[0];

                document.getElementById('CheckOut').setAttribute('min', minCheckOut);
        	});
         
        
        function updatePrice() {
            
            let noRooms = document.getElementById("NoRooms").value;
            let TotalPRice = 3000*noRooms;
            
            let pricePerNight = dodocument.getElementById("totalRooms");
            pricePerNight.textContent = "total rooms :"+noRooms;
            
            let price = document.getElementById("price");
            price.innerHTML="<b>Total Price : <b>"+TotalPRice ;
            
           }
           document.getElementById("NoRooms").addEventListener("input", updatePrice);
           updatePrice();
        
        
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>

</html>