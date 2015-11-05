package com.journaldev.mongodb.servlets;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.journaldev.mongodb.dao.MongoDBPatientDAO;
import com.journaldev.mongodb.dao.MongoDBPersonDAO;
import com.journaldev.mongodb.dao.MongoDBDoctorDAO;
import com.journaldev.mongodb.model.Doctor;
import com.journaldev.mongodb.model.Person_login;
import com.mongodb.MongoClient;

@WebServlet("/doctorsList")

public class ListOfDoctorsServlet extends HttpServlet {
	
	 
	    private static final long serialVersionUID = 6798036766148281767L;
	 
	    protected void doGet(HttpServletRequest request,
	            HttpServletResponse response) throws ServletException, IOException {
	      
	        MongoClient mongo = (MongoClient) request.getServletContext()
	                .getAttribute("MONGO_CLIENT");
	        MongoDBPersonDAO personDAO = new MongoDBPersonDAO(mongo);
	        
	        List<Person_login> persons = personDAO.readAllPerson();
	        request.setAttribute("persons", persons);

	        MongoDBDoctorDAO doctorDAO = new MongoDBDoctorDAO(mongo);
	        List<Doctor> doctors = doctorDAO.readAllDoctor();
			 HttpSession session = request.getSession();

	        session.setAttribute("doctors", doctors);
	        RequestDispatcher rd = getServletContext().getRequestDispatcher(
	                "/Profile.jsp");
	        rd.forward(request, response);
	    }
}
