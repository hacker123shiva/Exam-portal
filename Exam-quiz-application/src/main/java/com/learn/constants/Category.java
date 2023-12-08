package com.learn.constants;

import java.util.ArrayList;
import java.util.List;

import com.learn.responseDto.CategoryDto;

public enum Category {

	PROGRAMING("Programing"), MATH("Math"), PHYSICS("Physics"), SCIENCE("science");

	private final String title;

	private Category(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}

	public static List<CategoryDto> getCategoryDto() {
		List<CategoryDto> categoryDtos= new ArrayList<CategoryDto>();
		for (Category category : values()) {
			categoryDtos.add (new CategoryDto(category.name(), category.getTitle()));
		}
		return categoryDtos;
	}
}