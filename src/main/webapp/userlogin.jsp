<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      font-family: 'Segoe UI', sans-serif;
      background: #f0f2f5;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }	
    .login-container {
      background: #fff;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 400px;
      text-align: center;
    }
    .login-container h2 {
      margin-bottom: 25px;
      color: #4A00E0;
    }
    .form-group {
      margin-bottom: 20px;
      text-align: left;
    }
    label {
      display: block;
      margin-bottom: 6px;
      color: #333;
    }
    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 12px;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 15px;
    }
    .btn-login {
      background: linear-gradient(to right, #8E2DE2, #4A00E0);
      color: white;
      padding: 12px;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      width: 100%;
      font-size: 16px;
      transition: opacity 0.3s ease;
    }
    .btn-login:hover {
      opacity: 0.9;
    }
    .footer-text {
      margin-top: 20px;
      font-size: 14px;
      color: #777;
    }
    .error {
      color: red;
      font-size: 13px;
      margin-top: 4px;
    }
  </style>
 </head>
<body>
 <div class="login-container">
		<h2>User Login</h2>
		
		<form class = "w-25 mx-auto" action="loginUser">
			<div class="form-group">
				<label class="form-label">Username</label>
				<input type="text" class="form-control border-primary" name ="uname" placeholder="Enter your username.." required />
			</div>
			<div class="form-group">
				<label class="form-label">Password</label>
				<input type="password" class="form-control border-primary" name ="upass" placeholder="Enter your password.."required />
			</div>
			<input type="submit" class="btn-login" value="Login">
		</form>
		
			<a href ="./userinsert.jsp" class ="nav-link">Register User</a>
			<a href ="#" class ="nav-link">Artist Login</a>
		<div class="footer-text">
      &copy; 2025 Music Store
    </div>
</div> 
</body>
</html>