package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.ContactDAO;
import com.entity.Contact;

@WebServlet("/addContact")
public class AddContact extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int userId = Integer.parseInt(req.getParameter("userId"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phno = req.getParameter("phno");
		String about = req.getParameter("about");

		Contact c = new Contact(name, email, phno, about, userId);
		ContactDAO dao = new ContactDAO(DbConnect.getConn());

		HttpSession session = req.getSession();
		boolean f = dao.saveContact(c);
		if (f) {
			session.setAttribute("succMsg", "Your Contact Added..");
			resp.sendRedirect("addContact.jsp");
			// System.out.print("User is avai" + u);
		} else {
			session.setAttribute("failMsg", "Failed");
			resp.sendRedirect("addContact.jsp");
			// System.out.print("Something Wrong");
		}

	}

}
