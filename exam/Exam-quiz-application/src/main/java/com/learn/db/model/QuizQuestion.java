package com.learn.db.model;

public class QuizQuestion extends Question {

	private Long quizQuestionId;

	public QuizQuestion(long id, Long quizQuestionId, String question, String optionA, String optionB, String optionC, String optionD) {
		super(id, question, optionA, optionB, optionC, optionD);
		this.quizQuestionId = quizQuestionId;
	}

	public Long getQuizQuestionId() {
		return quizQuestionId;
	}

	public void setQuizQuestionId(Long quizQuestionId) {
		this.quizQuestionId = quizQuestionId;
	}

}
