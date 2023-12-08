package com.learn.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.learn.database.DatabaseConnection;
import com.learn.db.model.Quiz;

public class QuizDao {

	public Long addQuiz(String title, String category) {
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement("insert into quiz (title, category) value (?, ?)",
						PreparedStatement.RETURN_GENERATED_KEYS)) {
			statement.setString(1, title);
			statement.setString(2, category);
			statement.executeUpdate();
			ResultSet rs = statement.getGeneratedKeys();
			if (rs.next()) {
				return rs.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean updateQuiz(Long quizId, String title, String category) {
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con
						.prepareStatement("update quiz set title = ?, category = ?  where id = ? and deleted = 'N'")) {
			statement.setString(1, title);
			statement.setString(2, category);
			statement.setLong(3, quizId);
			int updateCount = statement.executeUpdate();
			return updateCount == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteQuiz(Long quizId) {
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con
						.prepareStatement("update quiz set deleted = 'Y'  where id = ? and deleted = 'N'")) {
			statement.setLong(1, quizId);
			int updateCount = statement.executeUpdate();
			return updateCount == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

	public Quiz getQuiz(Long quizId) {
		if(quizId!=0)
		try (PreparedStatement statement = DatabaseConnection.getConnection()
				.prepareStatement("select id, title, category from quiz where id = ? and deleted = 'N' ")) {
			statement.setLong(1, quizId);
			ResultSet rs = statement.executeQuery();
			if (rs.next()) {
				return new Quiz(rs.getLong("id"), rs.getString("title"), rs.getString("category"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		 
		return null;
	}

	public List<Quiz> getAllQuiz() {
		List<Quiz> quizs = new ArrayList<Quiz>();
		try (PreparedStatement statement = DatabaseConnection.getConnection().prepareStatement(
				"select id, title, category from quiz where deleted = 'N' order by updated_on desc")) {
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				quizs.add(new Quiz(rs.getLong("id"), rs.getString("title"), rs.getString("category")));
			}
			return quizs;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Long totalCount() {
		try (PreparedStatement statement = DatabaseConnection.getConnection()
				.prepareStatement("select count(id) countQuiz from quiz where deleted = 'N'")) {
			ResultSet rs = statement.executeQuery();
			if (rs.next()) {
				return rs.getLong("countQuiz");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return 0l;
	}

}
