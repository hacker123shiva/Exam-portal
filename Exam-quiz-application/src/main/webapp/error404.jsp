
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
</head>
<body>
 <div class="container p-3 text-center"  >
<div class="row offset-md-1"> 
 <div class="col-md-10">
 
  <img src="${pageContext.request.contextPath}/assets/images/error-404.jpg" alt="..." class="img-fluid" style="width:70%"/>
       <h1 >Sorry!! page Not found</h1>
      <a class="btn btn-outline-primary" href="index.jsp">Home Page</a>
    </div>
    </div>
   
    </div>
</body>
</html>