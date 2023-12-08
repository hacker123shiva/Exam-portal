package com.learn.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.learn.database.DatabaseConnection;
import com.learn.db.model.User;

public class UserDao {

	public boolean createUser(String firstName, String lastName, String emailId, String mobileNumber, String password) {
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement(
						"insert into user (first_name, last_name, email_id, mobile_number, password) value (?, ?, ?, ?, ?)")) {
			statement.setString(1, firstName);
			statement.setString(2, lastName);
			statement.setString(3, emailId);
			statement.setString(4, mobileNumber);
			statement.setString(5, password);
			int updateCount = statement.executeUpdate();
			return updateCount == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

	public User getUser(String emailId, String password) {
		try (PreparedStatement statement = DatabaseConnection.getConnection().prepareStatement(
				"select id, first_name, last_name, email_id, mobile_number, is_admin from user where email_id = ? and password = ? and is_admin = 'N'")) {
			statement.setString(1, emailId);
			statement.setString(2, password);
			ResultSet rs = statement.executeQuery();
			if (rs.next()) {
				return new User(rs.getLong("id"), rs.getString("first_name"), rs.getString("last_name"),
						rs.getString("email_id"), rs.getString("mobile_number"), "Y".equals(rs.getString("is_admin")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	public User getAdminUser(String emailId, String password) {
		try (PreparedStatement statement = DatabaseConnection.getConnection().prepareStatement(
				"select id, first_name, last_name, email_id, mobile_number, is_admin from user where email_id = ? and password = ? and is_admin = 'Y'")) {
			statement.setString(1, emailId);
			statement.setString(2, password);
			ResultSet rs = statement.executeQuery();
			if (rs.next()) {
				return new User(rs.getLong("id"), rs.getString("first_name"), rs.getString("last_name"),
						rs.getString("email_id"), rs.getString("mobile_number"), "Y".equals(rs.getString("is_admin")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String getPassword(long userId) {
		try (PreparedStatement statement = DatabaseConnection.getConnection()
				.prepareStatement("select id, password from user where id = ?")) {
			statement.setLong(1, userId);
			ResultSet rs = statement.executeQuery();
			if (rs.next()) {
				return rs.getString("password");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean updatePassword(long userId, String password) {
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement("update user set password = ? where id = ?")) {
			statement.setString(1, password);
			statement.setLong(2, userId);
			int updateCount = statement.executeUpdate();
			return updateCount == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateUser(long userId, String firstName, String lastName, String emailId, String mobileNumber) {
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con
						.prepareStatement("update user set first_name = ?, last_name = ?, email_id = ?, "
								+ " mobile_number = ? where id = ?")) {
			statement.setString(1, firstName);
			statement.setString(2, lastName);
			statement.setString(3, emailId);
			statement.setString(4, mobileNumber);
			statement.setLong(5, userId);
			int updateCount = statement.executeUpdate();
			return updateCount == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

	public User getUser(long userId) {
		try (PreparedStatement statement = DatabaseConnection.getConnection().prepareStatement(
				"select id, first_name, last_name, email_id, mobile_number, is_admin from user where id = ?")) {
			statement.setLong(1, userId);
			ResultSet rs = statement.executeQuery();
			if (rs.next()) {
				return new User(rs.getLong("id"), rs.getString("first_name"), rs.getString("last_name"),
						rs.getString("email_id"), rs.getString("mobile_number"), "Y".equals(rs.getString("is_admin")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Long totalCount() {
		try (PreparedStatement statement = DatabaseConnection.getConnection()
				.prepareStatement("select count(id) countUser from user")) {
			ResultSet rs = statement.executeQuery();
			if (rs.next()) {
				return rs.getLong("countUser");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return 0l;
	}
}
