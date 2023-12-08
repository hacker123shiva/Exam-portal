package com.learn.db.model;

public class Quiz {

	private long id;
	private String title;
	private String category;

	public Quiz(long id, String title, String category) {
		this.id = id;
		this.title = title;
		this.category = category;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}
