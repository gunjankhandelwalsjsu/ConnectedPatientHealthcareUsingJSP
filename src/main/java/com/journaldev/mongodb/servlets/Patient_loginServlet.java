package com.journaldev.mongodb.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.journaldev.mongodb.dao.MongoDBDoctorDAO;
import com.journaldev.mongodb.dao.MongoDBPatientDAO;
import com.journaldev.mongodb.model.Doctor;
import com.journaldev.mongodb.model.Patient;
import com.mongodb.MongoClient;

@WebServlet("/loginPatient")

public class Patient_loginServlet extends HttpServlet {


	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		
		if ((email == null || email.equals(""))||(password == null || password.equals(""))) {
			request.setAttribute("error", "Mandatory Parameters Missing");
			
			///////////////check login parameters////////////
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/login.jsp");
			rd.forward(request, response);
		} else {
		    
			MongoClient mongo =(MongoClient) request.getServletContext()
					.getAttribute("MONGO_CLIENT");
			MongoDBPatientDAO patientDAO = new MongoDBPatientDAO(mongo);
			System.out.println(email);
			Patient patient=patientDAO.getPatient(email);
		   if(patient==null)
			{
				RequestDispatcher rd = getServletContext().getRequestDispatcher(
						"/login.jsp");
				request.setAttribute("success", "Please check your credentials!!!");
				rd.forward(request, response);
			}
			else{
			System.out.println("Patient logged in Successfully with address="+patient.getStreetAddress());
			request.setAttribute("success", "Patient "+patient.getFirstName()+" loggedIn Successfully");
			
			request.setAttribute("Patient", patient);
			HttpSession session = request.getSession();
			session.setAttribute("Patient", patient);
			 MongoDBDoctorDAO doctorDAO = new MongoDBDoctorDAO(mongo);
		     List<Doctor> doctors = doctorDAO.readAllDoctor();
		     request.setAttribute("doctors", doctors);
		     session.setAttribute("doctors", doctors);

			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/Profile.jsp");
			rd.forward(request, response);
			}
		}
	}

}


