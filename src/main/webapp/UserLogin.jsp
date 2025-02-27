<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login/Registration </title>

<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');

*{
  margin:0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins",sans-serif;
}

body{
	height:100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height:100vh ;
    background-image: url("Images/LoginBG.jpg");
    background-position: center;
    background-size: cover;
}
.heading{
	color:white;
	margin-right:20px;
}
#msg {
	color: red;
	width: 75%;
	font-size: 18px;
	font-family: sans-serif;
	padding: 5px;
}
.wrapper{
    position: relative;
    width: 900px;
    height: 650px;
    background: rgba(0, 0, 0, 0.4);
    backdrop-filter: blur(10px);
    border:2px solid  #D1AE6c;
    box-shadow: 0 0 25px  #D1AE6c;
    overflow: hidden;
    
}
.wrapper .form-box{
    position: absolute;
    top:0;
    width:50%;
    height:100%;
    display: flex;
    flex-direction: column;
    justify-content:center;
}
.wrapper .form-box.login{
    left:0;
    padding:0 60px 0 40px;
   
    
}
.wrapper .form-box.login .animation{
    transform: translateX(0);
    opacity: 1;
    filter: blur(0);
    transition: .7s ease;
    transition-delay: calc(.1s * var(--j));
    
}

.wrapper.active .form-box.login .animation{
    transform: translateX(-150%);
    opacity: 0;
    filter: blur(10px);
    transition-delay: calc(.1s * var(--i));
    
}

.wrapper .form-box.register{
    right:0;
    padding:0 60px 0 40px;
    
    
    
}
.wrapper.active .form-box.register{
    pointer-events: auto;
}

.wrapper .form-box.register .animation{
    transform: translateX(120%);
    opacity: 0;
    filter: blur(10px);
    transition: .7s ease;
    transition-delay: calc(.1s * var(--j));
}
.wrapper.active .form-box.register .animation{
    transform: translateX(0);
    opacity: 1;
    filter: blur(0);
    transition-delay: calc(.1s * var(--i));
    
    
}


.form-box h2{
	font-size:30px;
	color: white;
	text-align:center;
}

.form-box .input-box{
    position: relative;
    
    width: 100%;
    height: 50px;
    margin: 10px;
    
}
.input-box input{
    width: 100%;
    height: 100%;
    background:transparent;
    border: none;
    outline: none;
    border-bottom: 2px solid #fff;
    font-size:small;
    color: #fff;
    font-weight:500;
    transition: .5s;
}
.input-box input:focus,
.input-box input:valid{
	border-bottom-color: #D1AE6c;

	}
.input-box label {
	
    position:absolute;
    top: 50%; 
    left:0;
    transform:translateY (-50%);
    font-size:16px;
    color:#fff;
    pointer-events:none ;
    transition: .5s;
    
}
.input-box input:focus~label,
.input-box input:valid~label{
	top: -5px;
	color: #D1AE6c;

}
.input-box i {
        position:absolute;
        top:50%;
        right:0;
        transform:translateY (-50%);
        font-size:medium;
        color:#fff;
        transition: .5s;
}
.input-box input:focus~i,
.input-box input:valid~i{
	color: #D1AE6c;

	}
.btn{
        position: relative;
        width:100%;
        height:45px;
        background:transparent;
        border: 2px solid #D1AE6c;
        outline: none; 
        border-radius:48px;
        cursor:pointer;
        font-size:16px;
        color:#fff;
        font-weight:600;
        margin-left:10px;
        z-index:1;
        overflow: hidden;
        margin-top: 25px;
}
.btn::before {
    content: '';
    position: absolute;
    top: -100%;
    left:0;
    width:100%;
    height:300%;
    background: linear-gradient(#081b29,  #D1AE6c, #081b29,  #D1AE6c);
    z-index:-1;
    transition: .5s;
}
.btn:hover::before{
    top: 0;
}
.form-box .logreg-link{
    font-size: 14.5px;
     color:#fff;
   text-align: center; 
   margin: 20px 0 5px;
   margin-left: 30px;
   }
.logreg-link p a {
	color:  #D1AE6c;
	text-decoration:none;
	font-weight:600;
}
.logreg-link p a:hover{
	
	text-decoration: underline;
	
}
.wrapper .info-text{
    position:absolute;
    top:0;
    width: 50%;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
}
.wrapper .info-text.login{
    right:0;
    text-align: right;
    padding: 0 40px 60px 150px;
    
    
}
.wrapper .info-text.login .animation{
    transform: translateX(0);
    opacity: 1;
    filter: blur(0);
    transition: .7s ease;
    transition-delay: calc(.1s * var(--j));
   
}
.wrapper.active .info-text.login .animation{
    transform: translateX(-150%);
    opacity: 0;
    filter: blur(10px);
    transition-delay: calc(.1s * var(--i));
}
.wrapper .info-text.register{
    left:0;
    text-align: left;
    padding: 0 150px 60px 40px;
    pointer-events: none;
    
    
}
.wrapper.active .info-text.register{
    pointer-events: auto;
}
.wrapper .info-text.register .animation{
    transform: translateX(-120%);
    opacity: 0;
    filter: blur(10px);
    transition: .7s ease;
    transition-delay: calc(.1s * var(--j));
    
}
.wrapper.active .info-text.register .animation{
    transform: translateX(0);
    opacity: 1;
    filter: blur(0);
    transition-delay: calc(.1s * var(--i));
}

.info-text h2{
    font-size: 36px;
    color:#fff;
    line-height: 1.5;
    text-transform: uppercase;
}
.info-text p{
    font-size: 16px;
    color:#fff;
}
.wrapper .bg-animate{
    position: absolute;
    top:-4px;
    right:0;
    width: 950px;
    height: 652px;
    background: linear-gradient(45deg, #081b29, #D1AE6c);
    border-bottom: 3px solid  #D1AE6c;
    transform: rotate(10deg) skewY(40deg);
    /*transform: rotate(0) skewY(0);*/
    transform-origin: bottom right;
    transition: 1.5s ease;
    transition-delay: 1.6s;

}
.wrapper.active .bg-animate{
    
   transform: rotate(0) skewY(0);
   transition-delay: .5s;
   
}
.wrapper .bg-animate2{
    position: absolute;
    top:100%;
    left:200px;
    width: 1000px;
    height: 900px;
    background: rgba(0, 0, 0, 0.4);
    backdrop-filter: blur(10px);

    border-top: 3px solid  #D1AE6c;
    transform: rotate(0) skewY(0);
    /*transform: rotate(-11deg) skewY(-41deg);*/
    transform-origin: bottom left;
    transition: 1.5s ease;
    transition-delay: .5s;
    
}
.wrapper.active .bg-animate2{
    
    transform: rotate(-11deg) skewY(-41deg);
    transition-delay: 1.2s;
}

#statusSucess{
position:fixed;
top:5px;
color: Green;

}
#statusFailure{
position:fixed;
top:5px;
color: Red;

}


</style>
</head>
<body>
	<%if(request.getAttribute("success") != null){ %>
	<h3 id="statusSucess"><%=request.getAttribute("success")%></h3>
	<%} %>
	
	<%if(request.getAttribute("failure") != null){ %>
	<h3 id="statusFailure"><%=request.getAttribute("failure")%></h3>
	<%} %>
	
	<div class="wrapper">
        <span class="bg-animate"></span>
		<span class="bg-animate2"></span>
		<div class="form-box login">
			<h2 class="animation" style="--i:0; --j:21;">Login</h2>
		
			
			<form action="userAction" method="post">
				<div class="input-box animation" style="--i:1; --j:22;">
					<input type="email" name="email" required> <label>Email</label>
					<i class='bx bxs-user'></i>
				</div>
				<div class="input-box animation" style="--i:2; --j:23;">
					<input type="password" name="password" required> <label>Password</label>
					<i class='bx bxs-lock-alt'></i>
				</div>
				<button type="submit" class="btn animation" name="action" value="login" style="--i:3; --j:24;">Login</button>
				<div class="logreg-link animation" style="--i:4; --j:25;">
					<p>
						Don't have an account? <a href="#" class="register-link">SignUp</a>
					</p>
				</div>
			</form>
		</div>
        <div class="info-text login">
            <h2  class="animation" style="--i:0; --j:20;">Welcome Back</h2>
           

        </div>
		<div class="form-box register">
			<h2 class="animation" style="--i:17; --j:0;">Sign up</h2>
			<form action="userAction" method="post">
				<div class="input-box animation" style="--i:18; --j:1;">
					<input type="text" name="name" required> <label>Username</label>
					<i class='bx bxs-user'></i>
				</div>
				<div class="input-box animation" style="--i:19; --j:2;">
					<input type="email" name="email" required> <label>Email</label>
					<i class='bx bxs-message-alt'></i>
				</div>
				<div class="input-box animation" style="--i:20; --j:3;">
					<input type="tel" name="phoneNo" required> <label>Phone no</label>
					<i class='bx bxs-phone' ></i>
				</div>
                <div class="input-box animation" style="--i:20; --j:3;">
					<input type="tel" name="gender" required> <label>Gender</label>
					<i class='bx bxs-phone' ></i>
				</div>
                <div class="input-box animation" style="--i:20; --j:3;">
					<input type="tel" name="location" required> <label>location</label>
					<i class='bx bxs-phone' ></i>
				</div>
				<div class="input-box animation" style="--i:21; --j:4;">
					<input type="password" name="password" required> <label>Password</label>
					<i class='bx bxs-lock-alt'></i>
				</div>
				<div class="input-box animation" style="--i:22; --j:5;">
					<input type="password" name="confirmpassword" required> <label>Confirm Password</label>
					<i class='bx bxs-lock-alt'></i>
				</div>
				<button type="submit" class="btn animation" name="action" value="signUp" style="--i:23; --j:6;">Signup</button>
				<div class="logreg-link animation" style="--i:24; --j:7;">
					<p>
						Already have an account? <a href="#" class="login-link">Login</a>
					</p>
				</div>
			</form>
		</div>
		<div class="info-text register">
            <h2 class="animation" style="--i:17; --j:0;">Sign Up</h2>
            <p class="animation" style="--i:18; --j:1;"></p>

        </div>
	</div>
	<script >
	const wrapper= document.querySelector('.wrapper');
	const registerLink =document.querySelector('.register-link');
	const loginLink =document.querySelector('.login-link');

	registerLink.onclick = () => {
	     wrapper.classList.add('active');
	}

	loginLink.onclick = () => {
	    wrapper.classList.remove('active');
	}
	</script>
</body>
</html>
