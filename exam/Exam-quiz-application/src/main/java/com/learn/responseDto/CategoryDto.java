package com.learn.responseDto;

public class CategoryDto {

	private final String name;
	private final String title;

	public CategoryDto(String name, String title) {
		this.name = name;
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public String getTitle() {
		return title;
	}

}
