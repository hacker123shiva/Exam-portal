package com.learn.service;

import java.util.List;
import java.util.Random;

import com.learn.db.dao.QuizQuestionDao;
import com.learn.db.dao.UserQuizQuestionAnswerDao;
import com.learn.db.model.QuizQuestion;
import com.learn.service.exception.CustomException;
import com.learn.service.exception.InfoMessage;

public class QuizQuestionManager {

	private final QuizQuestionDao quizQuestionDao;

	public QuizQuestionManager() {
		quizQuestionDao = new QuizQuestionDao();
	}

	public QuizQuestion getNextQuestion(Long userId, Long quizId) throws InfoMessage {
		List<QuizQuestion> quiestionId = quizQuestionDao.getNotAttemptedQuestions(userId, quizId);
		if (quiestionId.isEmpty()) {
			throw new InfoMessage();
		}
		int nextQuestion = new Random().nextInt(quiestionId.size());
		return quiestionId.get(nextQuestion);
	}

	public QuizQuestion submitAnswerGetNextQues(Long userId, Long quizQuestionId, Long quizId, String selectedOption)
			throws CustomException, InfoMessage {
		if (quizQuestionDao.isQuestionExists(quizId, quizQuestionId)) {
			if (new UserQuizQuestionAnswerDao().addQuizQuestion(userId, quizQuestionId, selectedOption)) {
				return getNextQuestion(userId, quizId);
			} else {
				return null;
			}
		} else {
			throw new CustomException("Invalid question.");
		}
	}
}
