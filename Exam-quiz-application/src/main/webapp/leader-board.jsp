<%@page import="com.learn.db.model.Quiz"%>
<%@page import="com.learn.db.model.User"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<jsp:include page="includes/header.jsp" />
<!-- Page Content -->

<style>
.custom-table tbody tr:nth-child(odd) {
  background-color: #edf5fa; /* Light blue background for odd rows */
}


.custom-table tbody tr:nth-child(even) {
  background-color: #d6eaf8; /* Blue background for even rows */
}
</style>
 
<div class="page-heading products-heading header-text">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="text-content">
          <h4>Quiz Name: ${quiz.title}</h4>
          <h2>Category : ${quiz.category}</h2>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div class="table-responsive">
        <table class="table table-striped table-bordered mt-5 mb-2 custom-table">
          <thead class="thead-dark">
            <tr >
              <th scope="col">Sr No.</th>
              <th scope="col">User</th>
              <th scope="col">Score</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="userScore" items="${userScores}" varStatus="counter">
              <tr>
                <th scope="row">${counter.count}</th>
                <td>${userScore.userName}</td>
                <td>${userScore.score}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
    
  </div>
  <jsp:include page="includes/footer.jsp" />