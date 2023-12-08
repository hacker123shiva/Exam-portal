package com.learn.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.learn.database.DatabaseConnection;
import com.learn.db.model.AdminQuestion;
import com.learn.db.model.QuestionSet;

public class QuestionDao {

	public boolean addQuestion(String question, String optionA, String optionB, String optionC, String optionD,
			String rightOption) {
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement(
						"insert into question (question, option_a, option_b, option_c, option_d, right_option)"
								+ " value (?, ?, ?, ?, ?, ?)")) {
			statement.setString(1, question);
			statement.setString(2, optionA);
			statement.setString(3, optionB);
			statement.setString(4, optionC);
			statement.setString(5, optionD);
			statement.setString(6, rightOption);
			int updateCount = statement.executeUpdate();
			return updateCount == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateQuestion(Long questionId, String question, String optionA, String optionB, String optionC,
			String optionD, String rightOption) {
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement(
						"update question set question = ?, option_a = ?, option_b = ?, option_c = ?, option_d = ?, right_option = ?  where id = ? and deleted = 'N'")) {
			statement.setString(1, question);
			statement.setString(2, optionA);
			statement.setString(3, optionB);
			statement.setString(4, optionC);
			statement.setString(5, optionD);
			statement.setString(6, rightOption);
			statement.setLong(7, questionId);
			int updateCount = statement.executeUpdate();
			return updateCount == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteQuestion(Long questionId) {
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con
						.prepareStatement("update question set deleted = 'Y'  where id = ? and deleted = 'N'")) {
			statement.setLong(1, questionId);
			int updateCount = statement.executeUpdate();
			return updateCount == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

	public AdminQuestion getQuestion(Long questionId) {
		try (PreparedStatement statement = DatabaseConnection.getConnection().prepareStatement(
				"select id, question, option_a, option_b, option_c, option_d, right_option from question where id = ? and deleted = 'N' ")) {
			statement.setLong(1, questionId);
			ResultSet rs = statement.executeQuery();
			if (rs.next()) {
				return new AdminQuestion(rs.getLong("id"), rs.getString("question"), rs.getString("option_a"),
						rs.getString("option_b"), rs.getString("option_c"), rs.getString("option_d"),
						rs.getString("right_option"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<AdminQuestion> getAllQuestion() {
		List<AdminQuestion> questions = new ArrayList<AdminQuestion>();
		try (PreparedStatement statement = DatabaseConnection.getConnection().prepareStatement(
				"select id, question, option_a, option_b, option_c, option_d, right_option from question where deleted = 'N' order by updated_on desc")) {
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				questions.add(new AdminQuestion(rs.getLong("id"), rs.getString("question"), rs.getString("option_a"),
						rs.getString("option_b"), rs.getString("option_c"), rs.getString("option_d"),
						rs.getString("right_option")));
			}
			return questions;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Long> addQuestion(List<QuestionSet> questions) {
		List<Long> qIds = new ArrayList<Long>();
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement(
						"insert into question (question, option_a, option_b, option_c, option_d, right_option)"
								+ " value (?, ?, ?, ?, ?, ?)",
						PreparedStatement.RETURN_GENERATED_KEYS)) {
			for (QuestionSet question : questions) {
				statement.setString(1, question.getQuestion());
				statement.setString(2, question.getOptionA());
				statement.setString(3, question.getOptionB());
				statement.setString(4, question.getOptionC());
				statement.setString(5, question.getOptionD());
				statement.setString(6, question.getRightOption());

				statement.executeUpdate();
				ResultSet rs = statement.getGeneratedKeys();
				if (rs.next()) {
					qIds.add(rs.getLong(1));
				}
			}
			return qIds;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Long totalCount() {
		try (PreparedStatement statement = DatabaseConnection.getConnection()
				.prepareStatement("select count(id) countQuestion from question where deleted = 'N'")) {
			ResultSet rs = statement.executeQuery();
			if (rs.next()) {
				return rs.getLong("countQuestion");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return 0l;
	}

}
