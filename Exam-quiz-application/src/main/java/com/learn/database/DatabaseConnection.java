package com.learn.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
//		return DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "root");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "hackershiva", "shiva123");

	}

}
