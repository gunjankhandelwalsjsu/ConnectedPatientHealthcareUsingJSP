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
import com.journaldev.mongodb.dao.MongoDBDoctorDAO;
import com.journaldev.mongodb.model.Doctor;
import com.journaldev.mongodb.model.Patient;
import com.journaldev.mongodb.model.Person_login;
import com.mongodb.MongoClient;

@WebServlet("/registerPatient")
public class AddPatientServlet extends HttpServlet {


	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String streetAddress = request.getParameter("streetAddress");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		String zipcode = request.getParameter("zipcode");
		String phone = request.getParameter("phone");	
		String[] al= request.getParameterValues("Allergy"); 
		String[] dis= request.getParameterValues("Disease"); 

		List<String> allergy=new ArrayList<String>();
		List<String> disease=new ArrayList<String>();

		if(al!=null&&al.length!=0){
		for(int i=0;i<al.length;i++){
			allergy.add(al[i]);
		}
		}
		else allergy.add("No allergies");
		
		if(dis!=null&&dis.length!=0){
			for(int i=0;i<dis.length;i++){
				disease.add(dis[i]);
			}
			}
			else disease.add("No existing disease");
		
		
		
		if ((firstName == null || firstName.equals(""))) {
			request.setAttribute("error", "Mandatory Parameters Missing");
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/patientRegistration.jsp");
			rd.forward(request, response);
		}
		MongoClient mongo =(MongoClient) request.getServletContext()
				.getAttribute("MONGO_CLIENT");
		MongoDBPatientDAO patientDAO = new MongoDBPatientDAO(mongo);
		if(!patientDAO.hasPatient(email)){
			request.setAttribute("error", "Email id already exists");
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/patientRegistration.jsp");
			rd.forward(request, response);
		}
		
		
		else {
			Patient p = new Patient();
			p.setName(firstName);
			p.setLastName(lastName);
			p.setPassword(password);
			p.setEmail(email);
			p.setStreetAddress(streetAddress);
			p.setState(state);
			p.setCity(city);
			p.setZipCode(zipcode);
			p.setPhone(phone);
			if (allergy != null && allergy.size() != 0) {
			p.setAllergy(allergy);
			}
			if (disease != null && disease.size() != 0) {
				p.setDisease(disease);
				}
			
			patientDAO.createPatient(p);
			System.out.println("Patient Added Successfully with id="+p.getId());
			request.setAttribute("success", "Person Added Successfully");
			request.setAttribute("Patient", p);
			HttpSession session = request.getSession();
			MongoDBDoctorDAO doctorDAO = new MongoDBDoctorDAO(mongo);

			 List<Doctor> doctors = doctorDAO.readAllDoctor();
		     request.setAttribute("doctors", doctors);
		     session.setAttribute("doctors", doctors);

			session.setAttribute("Patient", p);

			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/Profile.jsp");
			rd.forward(request, response);
		}
	}

}
