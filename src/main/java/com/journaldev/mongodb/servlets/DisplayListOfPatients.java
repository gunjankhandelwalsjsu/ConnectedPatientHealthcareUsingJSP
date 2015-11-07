package com.journaldev.mongodb.servlets;

import java.io.IOException;
import java.util.ArrayList;
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
import com.journaldev.mongodb.dao.MongoDBPatientDAO;
import com.journaldev.mongodb.model.Doctor;
import com.journaldev.mongodb.model.Patient;
import com.mongodb.MongoClient;

@WebServlet("/displayPatientList")
public class DisplayListOfPatients extends HttpServlet { 
	
		
		protected void doGet(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
		//	String id = ((ServletRequest) session).getParameter("id");
			String id_doctor = request.getParameter("id");
	        System.out.println("printing id_doctor"+id_doctor);
		//	String id_doctor = request.getParameter("id").toString();
			if (id_doctor == null || "".equals(id_doctor)) {
				throw new ServletException("id missing for operation");
			}
			System.out.println("Person profile requested with id=" + id_doctor);
			MongoClient mongo = (MongoClient) request.getServletContext()
					.getAttribute("MONGO_CLIENT");
			MongoDBDoctorDAO doctorDAO = new MongoDBDoctorDAO(mongo);
			Doctor doc=new Doctor();
			doc.setId(id_doctor);
		     List<String> patientEmail = doctorDAO.readAllPatient(doc);
		    
		     MongoDBPatientDAO patientDAO = new MongoDBPatientDAO(mongo);
		     List<Patient> patientList = new ArrayList<Patient>();
		     for(String pEmail:patientEmail){
		    	 Patient patient=new Patient();
		    	// patient.setEmail(pEmail);
		    	 if(!pEmail.equals(null)){
		    	 patient=patientDAO.getPatient(pEmail);
		   // 	 System.out.println("Patient data"+patient.getFirstName());
		    	 patientList.add(patient);
		    	 }
		    	 else
		    	 {
		    		 String pnEmail="no patient yet";
		    		 patient=patientDAO.getPatient(pnEmail);
		  		   // 	 System.out.println("Patient data"+patient.getFirstName());
		 			request.setAttribute("error", "No Patients!!!!!!");

		  		    patientList.add(patient);
		  		    break;
		    	 }
		     }
		     request.setAttribute("patientList", patientList);
		     session.setAttribute("patientList", patientList);
		     
		     
		    
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/ProfileDoctor.jsp");
			rd.forward(request, response);
		}
}
