package com.learn.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.learn.database.DatabaseConnection;
import com.learn.db.model.AdminQuestion;
import com.learn.db.model.Question;
import com.learn.db.model.QuizQuestion;

public class QuizQuestionDao {

	public boolean addQuizQuestion(Long quizId, Long questionId) {
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con
						.prepareStatement("insert into quiz_question (quiz_id, question_id) value (?, ?)")) {
			statement.setLong(1, quizId);
			statement.setLong(2, questionId);
			int updateCount = statement.executeUpdate();
			return updateCount == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteQuizQuestion(Long quizQuestionId) {
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con
						.prepareStatement("update quiz_question set deleted = 'Y' where id = ? and deleted = 'N'")) {
			statement.setLong(1, quizQuestionId);
			statement.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteQuizQuestionByQuiz(Long quizId) {
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement(
						"update quiz_question set deleted = 'Y' where quiz_id = ? and deleted = 'N'")) {
			statement.setLong(1, quizId);
			statement.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean addQuizQuestion(Long quizId, List<Long> questionIds) {
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con
						.prepareStatement("insert into quiz_question (quiz_id, question_id) value (?, ?)")) {
			for (Long questionId : questionIds) {
				statement.setLong(1, quizId);
				statement.setLong(2, questionId);
				statement.executeUpdate();
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<AdminQuestion> getQuestions(Long quizId) {
		List<AdminQuestion> quizQuestions = new ArrayList<AdminQuestion>();
		try (PreparedStatement statement = DatabaseConnection.getConnection().prepareStatement(
				"select q.id, q.question, q.option_a, q.option_b, q.option_c, q.option_d, q.right_option from question q"
						+ " inner join quiz_question qq on q.id = qq.question_id "
						+ " inner join quiz qu on qu.id = qq.quiz_id "
						+ " where q.deleted = 'N' and qq.deleted = 'N' and qu.deleted = 'N' and qu.id = ?")) {
			statement.setLong(1, quizId);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				quizQuestions.add(new AdminQuestion(rs.getLong("id"), rs.getString("question"),
						rs.getString("option_a"), rs.getString("option_b"), rs.getString("option_c"),
						rs.getString("option_d"), rs.getString("right_option")));
			}
			return quizQuestions;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<AdminQuestion> getQuestionsNotAssignedToQuiz(Long quizId) {
		List<AdminQuestion> quizQuestions = new ArrayList<AdminQuestion>();
		try (PreparedStatement statement = DatabaseConnection.getConnection().prepareStatement(
				"select q.id, q.question, q.option_a, q.option_b, q.option_c, q.option_d, q.right_option from question q"
						+ " where q.deleted = 'N' and q.id not in (select qq.question_id from quiz_question qq "
						+ " inner join quiz qu on qu.id = qq.quiz_id where qq.deleted = 'N' and qq.quiz_id = ?)")) {
			statement.setLong(1, quizId);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				quizQuestions.add(new AdminQuestion(rs.getLong("id"), rs.getString("question"),
						rs.getString("option_a"), rs.getString("option_b"), rs.getString("option_c"),
						rs.getString("option_d"), rs.getString("right_option")));
			}
			return quizQuestions;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean deleteQuizQuestionByQuestion(Long questionId) {
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement(
						"update quiz_question set deleted = 'Y' where question_id = ? and deleted = 'N'")) {
			statement.setLong(1, questionId);
			statement.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<QuizQuestion> getNotAttemptedQuestions(Long userId, Long quizId) {
		List<QuizQuestion> quizQuestions = new ArrayList<QuizQuestion>();
		try (PreparedStatement statement = DatabaseConnection.getConnection().prepareStatement(
				"select q.id, qq.id as quiz_question_id, q.question, q.option_a, q.option_b, q.option_c, q.option_d from question q "
						+ " inner join quiz_question qq on q.id = qq.question_id "
						+ " where qq.quiz_id = ? and q.deleted = 'N' and qq.deleted = 'N' "
						+ " and qq.question_id not in (select qq.question_id from user_quiz_ques_ans uqqa "
						+ " inner join quiz_question qq on qq.id = uqqa.quiz_question_id where  qq.quiz_id = ? && uqqa.user_id = ?)")) {
			statement.setLong(1, quizId);
			statement.setLong(2, quizId);
			statement.setLong(3, userId);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				quizQuestions.add(new QuizQuestion(rs.getLong("id"), rs.getLong("quiz_question_id"), rs.getString("question"), rs.getString("option_a"),
						rs.getString("option_b"), rs.getString("option_c"), rs.getString("option_d")));
			}
			return quizQuestions;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean isQuestionExists(Long quizId, Long quizQuestionId) {
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con
						.prepareStatement("select id from quiz_question where quiz_id = ? and id = ?")) {
			statement.setLong(1, quizId);
			statement.setLong(2, quizQuestionId);
			return statement.executeQuery().next();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

}
