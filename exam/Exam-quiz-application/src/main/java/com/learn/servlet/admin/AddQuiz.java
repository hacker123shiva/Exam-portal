package com.learn.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.constants.Category;
import com.learn.db.dao.QuizDao;

/**
 * Servlet implementation class QuizManagerServlet
 */
@WebServlet("/admin/addQuiz")
public class AddQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddQuiz() {
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
			session.setAttribute("categories", Category.getCategoryDto());
			request.getRequestDispatcher("/admin/add-quiz.jsp").include(request, response);
		} else {
			session.invalidate();
			session.setAttribute("error", "Unauthorised request.");
			response.sendRedirect(request.getContextPath() + "/admin/login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (Authorizer.isAdminAuthorised(session)) {
			String title = request.getParameter("quizTitle");
			String category = request.getParameter("category");
			Long quizId = new QuizDao().addQuiz(title, category);

			if (quizId == null) {
				session.setAttribute("error", "Unable to add quiz.");
				request.getRequestDispatcher("/admin/add-quiz.jsp").include(request, response);
			} else {
				session.setAttribute("info", "Quiz added successfully.");
				session.setAttribute("quizId", quizId);
				response.sendRedirect(request.getContextPath() + "/admin/addQuizQuestion/"+quizId);
			}
		} else {
			session.invalidate();
			session.setAttribute("error", "Unauthorised request.");
			response.sendRedirect(request.getContextPath() + "/admin/login");
		}
	}

}
