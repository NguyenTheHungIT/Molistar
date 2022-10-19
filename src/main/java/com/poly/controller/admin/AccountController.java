package com.poly.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.constant.SessionAttr;
import com.poly.entity.User;
import com.poly.service.UserService;
import com.poly.service.impl.UserServiceImpl;

@WebServlet(urlPatterns = { "/admin/account" }, name = "AccountControllerOfAdmin")
public class AccountController extends HttpServlet {

	private static final long serialVersionUID = 3968414433292121855L;

	private UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		if (currentUser != null && currentUser.getIsAdmin() == Boolean.TRUE) {
			String action = req.getParameter("action");
			switch (action) {
			case "view":
				doGetView(req, resp);
				break;
			case "edit":
				req.setAttribute("isEdit", true);
				//doGetEdit(req, resp);
				break;
			}

		} else {
			resp.sendRedirect("index");

		}
	}

	

	protected void doGetView(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<User> users = userService.findAll();
		req.setAttribute("users", users);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/account-overview.jsp");
		requestDispatcher.forward(req, resp);

	}




//	protected void doGetEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String username = req.getParameter("username");
//		User users = userService.findByUsername(username);
//		req.setAttribute("users", users);
//		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/account-edit.jsp");
//		requestDispatcher.forward(req, resp);
//
//	}




}
