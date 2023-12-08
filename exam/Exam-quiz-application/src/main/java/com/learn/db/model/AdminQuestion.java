package com.learn.db.model;

public class AdminQuestion extends Question {

	private String correctOption;

	public AdminQuestion(long id, String question, String optionA, String optionB, String optionC, String optionD,
			String correctOption) {
		super(id, question, optionA, optionB, optionC, optionD);
		this.correctOption = correctOption;
	}

	public String getCorrectOption() {
		return correctOption;
	}

	public void setCorrectOption(String correctOption) {
		this.correctOption = correctOption;
	}

}
