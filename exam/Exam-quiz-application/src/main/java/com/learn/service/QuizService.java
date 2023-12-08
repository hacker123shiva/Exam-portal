package com.learn.service;

import java.util.List;

import com.learn.db.dao.QuestionDao;
import com.learn.db.dao.QuizDao;
import com.learn.db.dao.QuizQuestionDao;
import com.learn.db.model.QuestionSet;

public class QuizService {

	public boolean addQuestion(Long quizId, List<QuestionSet> question) {
		List<Long> questionIds = new QuestionDao().addQuestion(question);
		return new QuizQuestionDao().addQuizQuestion(quizId, questionIds);
	}

	public boolean deleteQuiz(Long quizId) {
		return new QuizDao().deleteQuiz(quizId) && new QuizQuestionDao().deleteQuizQuestionByQuiz(quizId);
	}

}
