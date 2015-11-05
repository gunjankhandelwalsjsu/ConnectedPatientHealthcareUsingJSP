package com.journaldev.mongodb.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.journaldev.mongodb.dao.MongoDBDoctorDAO;
import com.journaldev.mongodb.dao.MongoDBPatientDAO;
import com.journaldev.mongodb.dao.MongoDBPersonDAO;
import com.journaldev.mongodb.model.Doctor;
import com.journaldev.mongodb.model.Person_login;
import com.mongodb.MongoClient;

@WebServlet("/deletePerson")
public class DeletePersonServlet extends HttpServlet {

	private static final long serialVersionUID = 6798036766148281767L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if (id == null || "".equals(id)) {
			throw new ServletException("id missing for delete operation");
		}
		MongoClient mongo = (MongoClient) request.getServletContext()
				.getAttribute("MONGO_CLIENT");
		MongoDBPersonDAO doctorDAO = new MongoDBPersonDAO(mongo);
		Person_login p = new Person_login();
		p.setId(id);
		doctorDAO.deletePerson(p);
		System.out.println("Person deleted successfully with id=" + id);
		request.setAttribute("success", "Person deleted successfully");
		

		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/login.jsp");
		rd.forward(request, response);
	}

}
