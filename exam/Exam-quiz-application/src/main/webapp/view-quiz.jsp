<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<jsp:include page="includes/header.jsp" />
<!-- Page Content -->
    <div class="page-heading products-heading header-text">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="text-content">
              <h4 class="text-dark">Quiz Name: ${quiz.title}</h4>
              <h2 class="text-dark">Category : ${quiz.category}</h2>
            </div>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
        	<form action="${pageContext.request.contextPath}/submit/question" method="post" onsubmit="setDefaultAnswer()">
    <input type="hidden" id="quizId" name="quizId" value="${quiz.id}"/>
    <input type="hidden" id="questionId" name="questionId" value="${question.id}"/>
    <input type="hidden" id="quizQuestionId" name="quizQuestionId" value="${question.quizQuestionId}"/>

    <div class="panel">
        <div class="result justify-contents-center"></div>
        <div class="question-container bg-dark text-white" id="question">
            ${question.question}
        </div>
        <div class="option-container align-items-center bg-primary">
            <a class="option" id="op1">
                <input type="radio" id="answer1" name="answer" value="A"/>
                ${question.optionA}
            </a>
            <a class="option" id="op2">
                <input type="radio" id="answer2" name="answer" value="B"/>
                ${question.optionB}
            </a>
            <a class="option" id="op3">
                <input type="radio" id="answer3" name="answer" value="C"/>
                ${question.optionC}
            </a>
            <a class="option" id="op4">
                <input type="radio" id="answer4" name="answer" value="D"/>
                ${question.optionD}
            </a>
        </div>
        <div class="navigation">
            <button class="evaluate w-100" type="submit">Next</button>
             
        </div>
    </div>
</form>

 

  		</div>
  	</div>
  </div>
  <script>
    function setDefaultAnswer() {
        var selectedAnswer = document.querySelector('input[name="answer"]:checked');
        if (!selectedAnswer) {
            // If no option is selected, set the default value to "F"
            var defaultAnswerInput = document.createElement('input');
            defaultAnswerInput.type = 'hidden';
            defaultAnswerInput.name = 'answer';
            defaultAnswerInput.value = 'F';

            // Append the hidden input to the form before submission
            document.querySelector('form').appendChild(defaultAnswerInput);
        }
    }
</script>
  
  <jsp:include page="includes/footer.jsp" />