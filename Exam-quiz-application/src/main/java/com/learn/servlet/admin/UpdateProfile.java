package com.learn.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.db.dao.UserDao;
import com.learn.db.model.User;

/**
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet("/admin/updateProfile")
public class UpdateProfile extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateProfile() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (Authorizer.isAdminAuthorised(session)) {
			User user = (User) session.getAttribute("user");
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String emailId = request.getParameter("emailId");
			String mobileNumber = request.getParameter("mobileNumber");
			UserDao userDao = new UserDao();
			if (userDao.updateUser(user.getId(), firstName, lastName, emailId, mobileNumber)) {
				session.setAttribute("user", userDao.getUser(user.getId()));
				response.sendRedirect(request.getContextPath() + "/admin/viewProfile");
			} else {
				request.getRequestDispatcher("/admin/edit-profile.jsp").include(request, response);
			}
		} else {
			session.invalidate();
			session.setAttribute("error", "Unauthorised request.");
			response.sendRedirect(request.getContextPath() + "/admin/login");
		}
	}

}
