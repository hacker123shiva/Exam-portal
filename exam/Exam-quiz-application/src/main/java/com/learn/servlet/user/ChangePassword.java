package com.learn.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.db.dao.UserDao;
import com.learn.db.model.User;
import com.learn.servlet.admin.Authorizer;

/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/changePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePassword() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (Authorizer.isUserAuthorised(session)) {
			request.getRequestDispatcher("/change-password.jsp").include(request, response);
		} else {
			session.invalidate();
			session.setAttribute("error", "Unauthorised request.");
			response.sendRedirect(request.getContextPath() + "/login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (Authorizer.isUserAuthorised(session)) {
			User user = (User) session.getAttribute("user");
			String password = request.getParameter("password");
			String newPassword = request.getParameter("newPassword");
			String retypePassword = request.getParameter("retypePassword");
			UserDao userDao = new UserDao();
			if (!newPassword.equals(retypePassword)) {
				session.setAttribute("error", "New Password and Retype Password should be same.");
				request.getRequestDispatcher("/change-password.jsp").include(request, response);
			} else {
				String currentPassword = userDao.getPassword(user.getId());
				if (password == null) {
					session.setAttribute("error", "User not exists, Please login again.");
					response.sendRedirect(request.getContextPath() + "/login");
				} else if (!currentPassword.equals(password)) {
					session.setAttribute("error", "Invalid Password.");
					request.getRequestDispatcher("/change-password.jsp").include(request, response);
				} else {
					if (userDao.updatePassword(user.getId(), newPassword)) {
						session.setAttribute("info", "Password has changed successfully, You need to login again.");
						response.sendRedirect(request.getContextPath() + "/login");
					}
				}
			}
		} else {
			session.invalidate();
			session.setAttribute("error", "Unauthorised request.");
			response.sendRedirect(request.getContextPath() + "/login");
		}
	}

}
