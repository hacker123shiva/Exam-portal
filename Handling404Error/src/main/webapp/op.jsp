<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="error1.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//fetch num1 and num2
String n1=request.getParameter("num1");
String n2=request.getParameter("num2");

//Conveting String to Integer
int a=Integer.parseInt(n1);
int b=Integer.parseInt(n2);
int result=a/b;
%>

<h1>Result is: <%=result %></h1>
</body>
</html>