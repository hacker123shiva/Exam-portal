package com.learn.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.db.dao.QuizDao;
import com.learn.db.dao.QuizQuestionDao;

/**
 * Servlet implementation class ViewQuiz
 */
@WebServlet("/admin/viewQuiz/*")
public class ViewQuiz extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewQuiz() {
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
			request.setAttribute("questionList", new QuizQuestionDao().getQuestions(quizId));
			request.getRequestDispatcher("/admin/view-quiz.jsp").include(request, response);
		} else {
			session.invalidate();
			session.setAttribute("error", "Unauthorised request.");
			response.sendRedirect(request.getContextPath() + "/admin/login");
		}
	}

}
