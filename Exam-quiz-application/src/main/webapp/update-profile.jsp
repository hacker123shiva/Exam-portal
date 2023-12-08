<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    Welcome ${user.firstName} ${user.lastName}, <br>
    <form action="updateProfile" method="post">
	    First Name: <input type="text" id="firstName" name="firstName" value="${user.firstName}" /><br><br>
	    Last Name: <input type="text" id="lastName" name="lastName" value="${user.lastName}" /><br><br>
	    Email Id: <input type="text" id="emailId" name="emailId" value="${user.emailId}" /><br><br>
	    Mobile No: <input type="text" id="mobileNumber" name="mobileNumber" value="${user.mobileNumber}" /><br><br>
	    <input type="submit" value="submit"><br><br>
	</form>
</body>
</html>