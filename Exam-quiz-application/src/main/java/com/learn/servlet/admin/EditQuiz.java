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
 * Servlet implementation class EditQuiz
 */
@WebServlet("/admin/editQuiz/*")
public class EditQuiz extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditQuiz() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (Authorizer.isAdminAuthorised(session)) {
			Long quizId = Long.parseLong(request.getPathInfo().substring(1));
			request.setAttribute("quiz", new QuizDao().getQuiz(quizId));
			request.setAttribute("categories", Category.getCategoryDto());
			request.getRequestDispatcher("/admin/edit-quiz.jsp").include(request, response);
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
			Long quizId = Long.parseLong(request.getPathInfo().substring(1));

			String title = request.getParameter("title");
			String category = request.getParameter("category");

			if (new QuizDao().updateQuiz(quizId, title, category)) {
				session.setAttribute("info", "Quiz updated successfully.");
				response.sendRedirect(request.getContextPath() + "/admin/quizList");
			} else {
				session.setAttribute("error", "Unable to update Quiz.");
				request.getRequestDispatcher("/admin/editQuiz/" + quizId).include(request, response);
			}
		} else {
			session.invalidate();
			session.setAttribute("error", "Unauthorised request.");
			response.sendRedirect(request.getContextPath() + "/admin/login");
		}
	}

}
