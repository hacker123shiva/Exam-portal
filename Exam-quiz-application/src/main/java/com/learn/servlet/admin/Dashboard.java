package com.learn.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.db.dao.QuestionDao;
import com.learn.db.dao.QuizDao;
import com.learn.db.dao.UserDao;

/**
 * Servlet implementation class Dashboard
 */
@WebServlet("/admin/dashboard")
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Dashboard() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (Authorizer.isAdminAuthorised(session)) {
			session.setAttribute("quizList", new QuizDao().getAllQuiz());
			session.setAttribute("totalUser", new UserDao().totalCount());
			session.setAttribute("totalQuiz", new QuizDao().totalCount());
			session.setAttribute("totalQuestion", new QuestionDao().totalCount());
			request.getRequestDispatcher("/admin/dashboard.jsp").include(request, response);
		} else {
			session.invalidate();
			session.setAttribute("error", "Unauthorised request.");
			response.sendRedirect(request.getContextPath() + "/admin/login");
		}
	}

}
