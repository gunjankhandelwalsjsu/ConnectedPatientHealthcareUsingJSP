package com.journaldev.mongodb.servlets;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/editDoctor")
public class EditDoctorServlet extends HttpServlet {

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
		MongoDBDoctorDAO personDAO = new MongoDBDoctorDAO(mongo);
		Doctor p = new Doctor();
		p.setId(id);
		p = personDAO.readDoctor(p);
		request.setAttribute("doctor", p);

		 HttpSession session = request.getSession();
		session.setAttribute("doctor", p);

       
		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/ProfileDoctor.jsp");
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
	//	String pEmail=request.getParameter("//)
		String[] spec= request.getParameterValues("specialization"); 
		List<String> Specialization=new ArrayList<String>();

		if(spec!=null&&spec.length!=0){
		for(int i=0;i<spec.length;i++){
			System.out.println(spec[i]);
			Specialization.add(spec[i]);
		}
		}
		else Specialization.add("No Specialization");
		

		if ((firstName == null || firstName.equals(""))
				|| (email == null || email.equals(""))) {
			request.setAttribute("error", "Name and email Can't be empty");
			
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/Profile.jsp");
			rd.forward(request, response);
		} else {
			MongoClient mongo = (MongoClient) request.getServletContext()
					.getAttribute("MONGO_CLIENT");
			MongoDBDoctorDAO doctorDAO = new MongoDBDoctorDAO(mongo);
			Doctor p = new Doctor();
			p.setId(id);
			p.setName(firstName);
			p.setLastName(lastName);
			p.setPassword(password);
			p.setEmail(email);
			p.setStreetAddress(streetAddress);
			p.setState(state);
			p.setCity(city);
			p.setZipcode(zipcode);
			p.setPhone(phone);
			List<String> patientEmail = doctorDAO.readAllPatient(p);
            p.setPatientEmail(patientEmail);
			p.setSpecialization(Specialization);

			doctorDAO.updateDoctor(p);
			
			
			System.out.println("Person edited successfully with id=" + id);
			request.setAttribute("success", "Doctor"+p.getFirstName()+" edited successfully");
			request.setAttribute("Patient", p);
			request.setAttribute("doctor", p);

			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/ProfileDoctor.jsp");
			rd.forward(request, response);
		}
	}

}
