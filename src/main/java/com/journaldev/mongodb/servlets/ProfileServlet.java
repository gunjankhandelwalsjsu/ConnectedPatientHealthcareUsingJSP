package com.journaldev.mongodb.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.journaldev.mongodb.dao.MongoDBDoctorDAO;
import com.journaldev.mongodb.dao.MongoDBPersonDAO;
import com.journaldev.mongodb.model.Doctor;
import com.journaldev.mongodb.model.Person_login;
import com.mongodb.MongoClient;

@WebServlet("/clickedProfile")
public class ProfileServlet extends HttpServlet { 
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	//	String id = ((ServletRequest) session).getParameter("id");
		String id = request.getParameter("id").toString();
		if (id == null || "".equals(id)) {
			throw new ServletException("id missing for operation");
		}
		System.out.println("Person profile requested with id=" + id);
		MongoClient mongo = (MongoClient) request.getServletContext()
				.getAttribute("MONGO_CLIENT");
		MongoDBDoctorDAO doctorDAO = new MongoDBDoctorDAO(mongo);
		Doctor p = new Doctor();
		p.setId(id);
		p = doctorDAO.readDoctor(p);
		request.setAttribute("doctor", p);
	     List<Doctor> doctors = doctorDAO.readAllDoctor();
	     request.setAttribute("doctors", doctors);
	     session.setAttribute("doctors", doctors);

		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/ProfileClicked.jsp");
		rd.forward(request, response);
	}


}
