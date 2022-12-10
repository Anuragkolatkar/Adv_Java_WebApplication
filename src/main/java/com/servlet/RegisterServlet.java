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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		User u = new User(name, email, password);
		UserDAO dao = new UserDAO(DbConnect.getConn());
		boolean f = dao.userRegister(u);

		HttpSession session = req.getSession();
		if (f) {
			session.setAttribute("sucMsg", "User Register Scuccessfuly");
			resp.sendRedirect("register.jsp");
			// System.out.print("User Register Scuccessfuly");
		} else {
			session.setAttribute("errMsg", "Something Wrong");
			resp.sendRedirect("register.jsp");
			// System.out.print("Something Wrong");
		}
	}

}
