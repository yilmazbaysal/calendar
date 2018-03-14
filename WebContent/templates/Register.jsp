<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
		
		<style>
			.form-control {
				margin-bottom: 15px;
			}
		</style>
		
		<title>Register</title>
	</head>
	
	
	<body>
		<center>
			<h1 style="font-size: 60px; padding-bottom: 70px;">Register</h1>
			
			<form class="form-horizontal" action="CalendarServlet" method="post">
				<div class="form-group" style="width: 300px;">
					
					<input type="text" class="form-control" name="firstName" placeholder="First Name"></input>
					<input type="text" class="form-control" name="lastName" placeholder="Last Name"></input>
					<input type="text" class="form-control" name="username" placeholder="Username"></input>
					<input type="text" class="form-control" name="password1" placeholder="Password"></input>
					<input type="text" class="form-control" name="password2" placeholder="Password (Again)"></input>
					
					<input type="submit" class="form-control btn-info" value="Register"></input>
					
					<input type="hidden" name="formType" value="registerForm"></input>
				</div>
			</form>
		</center>
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>