<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        font-family: Arial, sans-serif;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #f4f4f4;
    }

    .parentlogin {
        width: 600px;
        height: 500px;
        min-width: 600px;
        min-height: 500px;
        background: #ffffff;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        border-radius: 12px;
        overflow: hidden;
        transition: box-shadow 0.3s;
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding: 40px;
    }

    .parentlogin:hover {
        box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
    }

    .login h1 {
        margin-bottom: 20px;
        text-align: center;
    }

    .login label {
        position: relative;
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }

    .login label i {
        position: absolute;
        left: 12px;
        color: #666;
    }

    .login input[type="text"],
    .login input[type="password"] {
        width: 100%;
        padding: 12px 12px 12px 40px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 14px;
        color: #333;
        transition: border-color 0.3s;
    }

    .login input:focus {
        border-color: #4a90e2;
        outline: none;
    }

    .login-button {
        padding: 12px;
        width: 100%;
        border: none;
        border-radius: 8px;
        background-color: #4a90e2;
        color: #fff;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .login-button:hover {
        background-color: #357abd;
    }

    .forgot {
        margin-top: 20px;
        text-align: center;
        font-size: 14px;
    }

    .forgot a {
        color: #4a90e2;
        text-decoration: none;
    }

    .forgot a:hover {
        text-decoration: underline;
    }
    #status{
    color:red;
    position: fixed;
    top :20px;
    }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<script>
    $(document).ready(function () {
        $("#login").validate({
            rules: {
                email: {
                    required: true
                },
                password: {
                    required: true,
                    minlength: 3
                }
            },
            messages: {
                email: {
                    required: "Please enter your email"
                },
                password: {
                    required: "Please enter your password",
                    minlength: "Your password must be at least 4 characters long"
                }
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
    });
</script>
</head>
<body>

<%if(request.getAttribute("status")!=null){ %>
<h3 id="status"><%=request.getAttribute("status")%></h3>
<%} %>

<form action="admin" method="post" id="login" class="parentlogin">

    <div class="login">
        <h1>Login Page</h1>
        <label>
            
            <input type="text" class="username" autocomplete="on" placeholder="Email" name="email">
        </label>
        <label>
            
            <input type="password" class="password" autocomplete="off" placeholder="Password" name="password">
        </label>
        <button class="login-button" type="submit" name="submit" value="login">Login</button>
        <!-- <div class="forgot">
            <a href="ForgotReset.jsp">Forgot password? | Reset Password?</a>
        </div> -->
    </div>
</form>

</body>
</html>