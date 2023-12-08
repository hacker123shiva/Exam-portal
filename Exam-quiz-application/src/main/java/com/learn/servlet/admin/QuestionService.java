package com.learn.servlet.admin;

import com.learn.db.dao.QuestionDao;
import com.learn.db.dao.QuizQuestionDao;

public class QuestionService {

	public boolean deleteQuestion(Long questionId) {
		return new QuestionDao().deleteQuestion(questionId)
				&& new QuizQuestionDao().deleteQuizQuestionByQuestion(questionId);
	}

}
