package com.learn.servlet.admin;

import javax.servlet.http.HttpSession;

import com.learn.db.model.User;

public class Authorizer {

	protected static boolean isAdminAuthorised(HttpSession session) {
		return isAuthorised(session, true);
	}

	public static boolean isUserAuthorised(HttpSession session) {
		return isAuthorised(session, false);
	}

	private static boolean isAuthorised(HttpSession session, boolean isAdmin) {
		User user = (User) session.getAttribute("user");
		return user != null && user.isAdmin() == isAdmin;
	}
}
