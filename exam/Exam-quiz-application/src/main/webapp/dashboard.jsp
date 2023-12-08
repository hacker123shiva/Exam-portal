<%@page import="com.learn.db.model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="includes/header.jsp" />

<!-- Page Content -->

<div class="page-heading contact-heading header-text">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="text-content">
              <h4>Explore Quiz</h4>
            </div>
          </div>
        </div>
      </div>
    </div>

<section class="vh-100 gradient-custom-2 bg-primary-subtle">
    <div class="container py-5 h-100">
      <div class="row d-flex justify-content-top align-items-top h-100">
        <div class="col-xl-12 col-xl-10">
  
          <div class="card mask-custom bg-primary">
            <div class="card-body p-4 text-white">
  
              <div class="text-center pt-3 pb-2">
                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-todo-list/check1.webp"
                  alt="Check" width="60">
                <h2 class="my-4">Quiz List</h2>
              </div>
  
              <table class="table text-white mb-0 table-custom">
                <thead>
                  <tr>
                    <th scope="col">Serial No.</th>
                    <th scope="col">Quiz Title</th>
                    <th scope="col">Category</th>
                    <th scope="col">Actions</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="quiz" items="${quizList}" varStatus="counter">
                  <tr class="fw-normal">
                    <td>
                      <span class="ms-2">${counter.count}</span>
                    </td>
                    <td class="align-middle">
                        <span class="ms-2">${quiz.title}</span>
                    </td>
                    <td class="align-middle">
                        <span class="ms-2">${quiz.category}</span>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/start/quiz/${quiz.id}" class="btn btn-success">Start</a>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />