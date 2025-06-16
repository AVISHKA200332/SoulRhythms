<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<header class = "navbar navbar-dark bg-primary">
		<div>
			<a href= "index.jsp" class="navbar-brand">ONLINE MUSIC STORE</a>
		</div>
		<ul class="navbar-nav">
		
			<li>
			<a href ="login.jsp" class= "nav-link mx-">Login</a>
			</li>
		</ul> 
	</header>
	
	
	<main style ="margin-top:8%" class ="mx-5">
		<div Class = "col6 mx-auto">
			<form action = "registerUser">
			<h2>Register User</h2>
			
			<div class="form group mb-2 row">
			<label class="col-sm-2 col-form-label">Name</label>
			<input type="text" name="uname" class="form-control border-primary" placeholder="Enter Your Name....">
			</div>
			
			<div class="form group mb-2 row">
			<label class="col-sm-2 col-form-label">Adress</label>
			<input type="text" name="uaddress" class="form-control border-primary" placeholder="Enter Your Adress....">
			</div>
			
			<div class="form group mb-2 row">
			<label class="col-sm-2 col-form-label">Email</label>
			<input type="email" name="uemail" class="form-control border-primary" placeholder="Enter Your Valid Email....">
			</div>
			
			<div class="form group mb-2 row">
			<label class="col-sm-2 col-form-label">Password</label>
			<input type="password" name="upass" class="form-control border-primary" placeholder="Enter Your Password....">
			</div>
			
			<div class="form group mb-2 row">
			<input type="submit" class="btn btn-success" value="Register User">
			</div>
			
			
			</form>
		
		</div>
		
	</main>
	
	
	<footer class= "fixed-bottom bg-primary">
	<p class="text-center text-light">2025 &copy; 2025 Music Store</p>
	</footer>
</body>
</html>