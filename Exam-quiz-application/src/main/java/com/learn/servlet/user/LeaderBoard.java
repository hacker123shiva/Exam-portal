package com.learn.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.db.dao.QuizDao;
import com.learn.db.dao.UserQuizQuestionAnswerDao;

/**
 * Servlet implementation class LeaderBoard
 */
@WebServlet("/leaderBoard/*")
public class LeaderBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LeaderBoard() {
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
		System.out.println("in leaderboard");
		Long quizId=(long)0;
		try {
		 quizId = Long.parseLong(request.getPathInfo().substring(1));
		}
		catch(NumberFormatException n) {
		request.getRequestDispatcher("/leader-board.jsp").include(request, response);
		}
		request.setAttribute("quiz", new QuizDao().getQuiz(quizId));
		System.out.println("quizdao object created");
		request.setAttribute("userScores", new UserQuizQuestionAnswerDao().getLeaderBoard(quizId));
		System.out.println("UserQuizQuestionAnswerDao object");
		request.getRequestDispatcher("/leader-board.jsp").include(request, response);
	}

}
