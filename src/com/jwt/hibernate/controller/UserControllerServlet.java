package com.jwt.hibernate.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jwt.hibernate.bean.User;
import com.jwt.hibernate.dao.UserDAO;

public class UserControllerServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	List<User> users = new ArrayList<User>();

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String button = request.getParameter("button");
		 if ("Cancel".equals(button)) {
			 listUsers(request,response);
	        }else if ("Add New".equals(button)) {
	        	 response.sendRedirect("newUser");
	        }else {
	        	
				int id = Integer.parseInt(request.getParameter("id"));
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				String dob = request.getParameter("dob");
				String city = request.getParameter("city");
		
				try {
					UserDAO userDAO = new UserDAO();
					userDAO.userOperation(id, name, email, phone, dob, city,button);
					listUsers(request,response);
					//response.sendRedirect("Success");
		} catch (Exception e) {
			request.getRequestDispatcher("/Register.jsp").forward(request, response);
			e.printStackTrace();
		}

	}
	}
	
	public void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 UserDAO uDAO = new UserDAO();
		 users = uDAO.getUsers();
		 System.out.println("In Action, "+users);
		 request.setAttribute("user", users);
		 request.getRequestDispatcher("studentHome.jsp").forward(request, response);
    }
	
}
