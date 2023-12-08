package com.learn.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.learn.database.DatabaseConnection;
import com.learn.db.model.UserScore;

public class UserQuizQuestionAnswerDao {

	public boolean addQuizQuestion(Long userId, Long quizQuestionId, String selectedOption) {
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement(
						"insert into user_quiz_ques_ans (user_id, quiz_question_id, selected_option) value (?, ?, ?)")) {
			statement.setLong(1, userId);
			statement.setLong(2, quizQuestionId);
			statement.setString(3, selectedOption);
			statement.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<UserScore> getLeaderBoard(Long quizId) {
		List<UserScore> questions = new ArrayList<UserScore>();
		System.out.println("insde userQuiz1");
		try (PreparedStatement statement = DatabaseConnection.getConnection().prepareStatement(
				"SELECT u.id AS user_id, u.first_name, u.last_name, COUNT(uqqa.id) AS score "+
						"FROM quiz.user_quiz_ques_ans uqqa "+
						"INNER JOIN quiz_question qq ON qq.id = uqqa.quiz_question_id "+
						"INNER JOIN question q ON q.id = qq.question_id "+
						"INNER JOIN quiz.user u ON u.id = uqqa.user_id "+
						"WHERE q.right_option = uqqa.selected_option AND qq.quiz_id = ? "+
						"GROUP BY u.id, u.first_name, u.last_name "+
						"ORDER BY COUNT(uqqa.id) DESC")) 
				
						
	 

			 
				 
		{
			System.out.println("insde userQuiz2");
			statement.setLong(1, quizId);
			ResultSet rs = statement.executeQuery();
			System.out.println("insde userQuiz3");
			while (rs.next()) {
				System.out.println("insde userQuiz4");
				questions.add(
						new UserScore(rs.getString("first_name"), rs.getString("last_name"), rs.getLong("score")));
			}
			System.out.println(questions);
			System.out.println("insde userQuiz5");
			return questions;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

}
