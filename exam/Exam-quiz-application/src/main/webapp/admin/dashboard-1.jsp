<%@page import="com.learn.db.model.User"%>
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
	<a href="changePassword">Change Password</a>
	<a href="viewProfile">Profile</a>
	<a href="logout">Logout</a>
	<br>
	<br>
	<a href="viewQuiz">Quiz Manager</a><br>
	<a href="viewQuestions">Question Manager</a><br>
	<a href="add/Quiz">Add Quiz</a><br>
	<table>
		<thead>
			<tr>
				<td>Sr No.</td>
				<td>Quiz Title</td>
				<td>Category</td>
				<td>Action</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="quiz" items="${quizList}" varStatus="counter">
		   		<option value="${cat.name}">${cat.title}</option>
				<tr>
					<td>${counter.count}</td>
					<td><a href="${pageContext.request.contextPath}/view/quiz/${quiz.id}">${quiz.title}</a></td>
					<td>${quiz.category}</td>
					<td>
						<a href="${pageContext.request.contextPath}/edit/quiz/${quiz.id}">Edit</a>
						<a href="${pageContext.request.contextPath}/delete/quiz/${quiz.id}">Delete</a>
					</td>
				</tr>
		   	</c:forEach>
		</tbody>
	</table>
</body>
</html>