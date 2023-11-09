<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<div class="container"> 
<div class="row">
<div class="col-md-6 offset-md-3">
<form action="op.jsp"> 
<div class="card"  >
 <div class="card-header bg-dark text-white">
 <h3>Provide me a two numbers</h3>
 </div>
 
  <div class="card-body bg-secondary">
  <div class="form-group"> 
   <input name="num1" type="number" class="form-control" placeholder="Enter a num1"/>
   </div>
    <div class="form-group"> 
   <input name="num2" type="number" class="form-control" placeholder="Enter a num2"/>
  </div>
  </div>
  <div class="card-footer text-center bg-dark text-white">
  <button type="submit" class="btn btn-outline-info">Divide</button>
  </div>
</div>
</form></div>
</div>
</div>
</body>
</html>