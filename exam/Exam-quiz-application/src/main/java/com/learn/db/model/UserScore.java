package com.learn.db.model;

public class UserScore {

	private String userName;
	private Long score;

	public UserScore(String firstName, String lastName, Long score) {
		super();
		this.userName = firstName + " " + lastName;
		this.score = score;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Long getScore() {
		return score;
	}

	public void setScore(Long score) {
		this.score = score;
	}

}
