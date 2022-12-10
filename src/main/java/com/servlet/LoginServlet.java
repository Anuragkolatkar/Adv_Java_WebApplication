package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String email = req.getParameter("email");
		String password = req.getParameter("password");
		UserDAO dao = new UserDAO(DbConnect.getConn());

		User u = dao.loginUser(email, password);

		HttpSession session = req.getSession();
		if (u != null) {
			session.setAttribute("user", u);
			resp.sendRedirect("index.jsp");
			// System.out.print("User is avai" + u);
		} else {
			session.setAttribute("errMsg", "Register First");
			resp.sendRedirect("login.jsp");
			// System.out.print("Something Wrong");
		}
	}

}
