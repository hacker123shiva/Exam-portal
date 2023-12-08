<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Quiz App</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fontawesome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/templatemo-sixteen.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.css">
    
    	<link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
      integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
      crossorigin="anonymous"
    />
	 <style>
	 	 body {
    background-color: #c9d6ff;
    background: linear-gradient(to right, #e2e2e2, #c9d6ff);
    }
      .question-container{
		    margin: 10px;
		    padding: 5px;
		    width: 80vw;
		    height: 10vh;
		    background-color: #c7dddf;
		    font-size: x-large;
		    text-align: center;
		      
		}
		.result{
		    margin: 10px;
		    padding: 5px;
		    width:80vw;
		    height: 10vh;
		    text-align: center;
		    font-size: 50px;
		      
		}
		.option-container{
		    display: flex;
		    justify-content: space-around; 
		    margin: 10px;
		    padding: 5px;
		    width: 80vw;
		    height: 20vh;
		    background-color: #9eb1b3;   
		        
		}
		.option{    
		    padding: 10px;
		    width: 15vw;
		    height: 10vh;
		    font-size: larger;
		    background-color: lightskyblue;
		    border-radius: 25%;
		}
		.option:hover{
		    background-color: lightgoldenrodyellow;
		}
		.navigation{
		    width: 80vw;
		    height: 10vh;
		    margin: 10px;
		    padding: 5px;
		    display: flex;
		    justify-content: space-around;
		    background-color:#c7dddf;
		}
		  
		.evaluate,.next{
		    width:30vw;
		    height: 8vh;
		    padding: 5px;
		    font-size: larger;
		}
		.evaluate{
		    
		    background-color: #50DBB4;
		}
		.next{
		    color: white;
		    background-color: #BF3325;
		}
    </style>
  </head>

  <body>

    <!-- Header -->
    <header class="">
   <div class="d-flex flex-column flex-md-row align-items-center p-1 mb-6 px-md-4  navbar navbar-expand-md navbar-light bg-success sticky-top">
      <h2 class="my-0 mr-md-auto font-weight-normal">   <a class="navbar-brand text-warning" href="${pageContext.request.contextPath}/index.jsp"><h2>Online <em>Quiz</em></h2></a></h2>
      <nav class="my-2 my-md-0 mr-md-3 navbar navbar-expand-lg">
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">Home
                  <span class="sr-only">(current)</span>
                </a>
              </li> 
              <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/dashboard.jsp">Quiz</a>
              </li>
               
          

 
        <li class="nav-item active">
            
            <a class="btn btn-danger" href="${pageContext.request.contextPath}/login" id="btn-sigin">Login/Signup</a>
        </li>
     

            </ul>
          </div>
      </nav>
      
    </div>
    
   <!--  
     <nav class="navbar navbar-expand-lg">
        <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
          <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp"><h2>Online <em>Quiz</em></h2></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">Home
                  <span class="sr-only">(current)</span>
                </a>
              </li> 
              <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/dashboard.jsp">Quiz</a>
              </li>
              <li class="nav-item active">
                <a class="nav-link btn btn-outline-primary" href="${pageContext.request.contextPath}/login">Login/Signup</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      
      -->
    </header>