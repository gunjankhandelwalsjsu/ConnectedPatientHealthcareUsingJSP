package com.journaldev.mongodb.servlets;

import java.io.IOException;
import java.util.Arrays;
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
import com.journaldev.mongodb.model.Patient;
import com.journaldev.mongodb.model.Person_login;
import com.mongodb.MongoClient;

@WebServlet("/editPatient")
public class EditPatientServlet extends HttpServlet {

	private static final long serialVersionUID = -6554920927964049383L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if (id == null || "".equals(id)) {
			throw new ServletException("id missing for edit operation");
		}
		System.out.println("Patient edit requested with id=" + id);
		MongoClient mongo = (MongoClient) request.getServletContext()
				.getAttribute("MONGO_CLIENT");
		MongoDBPatientDAO personDAO = new MongoDBPatientDAO(mongo);
		Patient p = new Patient();
		p.setId(id);
		p = personDAO.readPatient(p);
		request.setAttribute("patient", p);

		 HttpSession session = request.getSession();
		session.setAttribute("patient", p);

       
        MongoDBDoctorDAO doctorDAO = new MongoDBDoctorDAO(mongo);
        List<Doctor> doctors = doctorDAO.readAllDoctor();
        session.setAttribute("doctors", doctors);
        request.setAttribute("doctors", doctors);

		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/Profile.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id"); // keep it non-editable in UI
		if (id == null || "".equals(id)) {
			throw new ServletException("id missing for edit operation");
		}
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String streetAddress = request.getParameter("streetAddress");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		String zipcode = request.getParameter("zipcode");
		String phone = request.getParameter("phone");
		String[] allergy=request.getParameterValues("Allergy");

		if ((firstName == null || firstName.equals(""))
				|| (email == null || email.equals(""))) {
			request.setAttribute("error", "Name and email Can't be empty");
			
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/Profile.jsp");
			rd.forward(request, response);
		} else {
			MongoClient mongo = (MongoClient) request.getServletContext()
					.getAttribute("MONGO_CLIENT");
			MongoDBPatientDAO patientDAO = new MongoDBPatientDAO(mongo);
			Patient p = new Patient();
			p.setId(id);
			p.setName(firstName);
			p.setLastName(lastName);
			p.setPassword(password);
			p.setEmail(email);
			p.setStreetAddress(streetAddress);
			p.setState(state);
			p.setCity(city);
			p.setZipCode(zipcode);
			p.setPhone(phone);
			if (allergy != null && allergy.length != 0) {
				p.setAllergy(allergy);}
			
			patientDAO.updatePatient(p);
			 MongoDBDoctorDAO doctorDAO = new MongoDBDoctorDAO(mongo);
		        List<Doctor> doctors = doctorDAO.readAllDoctor();
				 HttpSession session = request.getSession();
		        session.setAttribute("doctors", doctors);
		        request.setAttribute("doctors", doctors);

			System.out.println("Person edited successfully with id=" + id);
			request.setAttribute("success", "Patient"+p.getFirstName()+"edited successfully");
			request.setAttribute("Patient", p);
			session.setAttribute("Patient", p);

			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/Profile.jsp");
			rd.forward(request, response);
		}
	}

}
