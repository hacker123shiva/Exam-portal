<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Change Password</title>
	</head>
	<body>
		Welcome ${user.firstName} ${user.lastName}, <br>
	    <div align="center" style="margin-top: 50px;">
	        <form action="changePassword" method="post">
	            Please enter your Current Password:  <input type="text" name="password" size="20px"> <br>
	            Please enter your New Password:  <input type="text" name="newPassword" size="20px"> <br><br>
	            Please enter your Retype Password:  <input type="text" name="retypePassword" size="20px"> <br><br>
	        <input type="submit" value="submit">
	        </form> 
	    </div>
	</body>
</html>