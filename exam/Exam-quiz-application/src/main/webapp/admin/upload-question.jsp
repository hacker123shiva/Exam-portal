<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    Welcome ${user.firstName} ${user.lastName}, <br>
    <form action="${pageContext.request.contextPath}/admin/uploadQuestion" method="post" enctype="multipart/form-data">
    	Choose File : <input type="file" name="attachedFile"/><br><br>
    	<input type="submit" value="submit"><br><br>
    </form>
</body>
</html>