package com.journaldev.mongodb.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import com.journaldev.mongodb.dao.MongoDBDoctorDAO;
import com.journaldev.mongodb.dao.MongoDBPatientDAO;
import com.journaldev.mongodb.dao.MongoDBPersonDAO;
import com.journaldev.mongodb.model.Doctor;
import com.journaldev.mongodb.model.Patient;
import com.journaldev.mongodb.model.Person_login;
import com.journaldev.mongodb.util.EmailNotification;
import com.journaldev.mongodb.util.SmsSender;
import com.mongodb.MongoClient;
import com.twilio.sdk.TwilioRestException;

@WebServlet("/addDoctorToPatientProfile")
public class AddDoctorToPatientProfile extends HttpServlet { 
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	//	String id = ((ServletRequest) session).getParameter("id");
		String id_patient = ((ServletRequest) session).getParameter("id").toString();
        System.out.println(id_patient);
		String id_doctor = request.getParameter("id").toString();
		if (id_doctor == null || "".equals(id_doctor)) {
			throw new ServletException("id missing for operation");
		}
		System.out.println("Person profile requested with id=" + id_doctor);
		MongoClient mongo = (MongoClient) request.getServletContext()
				.getAttribute("MONGO_CLIENT");
		MongoDBDoctorDAO doctorDAO = new MongoDBDoctorDAO(mongo);
		Doctor p = new Doctor();
		p.setId(id_doctor);
		p = doctorDAO.readDoctor(p);
		request.setAttribute("doctor", p);
		
	     List<Doctor> doctors = doctorDAO.readAllDoctor();
	     request.setAttribute("doctors", doctors);
	     session.setAttribute("doctors", doctors);

		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/Profile.jsp");
		rd.forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Patient patient = new Patient();
		patient=(Patient) session.getAttribute("Patient");
		String id_doctor = request.getParameter("id").toString();
        System.out.println("givingPId"+patient.getId());

		if ((id_doctor == null || id_doctor.equals(""))) {
			request.setAttribute("error", "Doctor Parameter Missing");
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/Profile.jsp");
			rd.forward(request, response);
		} 
		MongoClient mongo =(MongoClient) request.getServletContext()
				.getAttribute("MONGO_CLIENT");
		MongoDBDoctorDAO doctorDAO = new MongoDBDoctorDAO(mongo);
			Doctor d=new Doctor();
			d.setId(id_doctor);
			d=doctorDAO.readDoctor(d);
	        System.out.println("giving"+d.getEmail());
			MongoDBPatientDAO patientDAO = new MongoDBPatientDAO(mongo);

			Patient p=patientDAO.readPatient(patient);
            p.setDoctor(d);
		    p.setdName(d.getName());
		    p.setdMailId(d.getEmail());
		    p.setdId(d.getId());
			//patientDAO.updatePatient(patient,d);
			patientDAO.updatePatientWithDoctor(p);
			Patient pat=new Patient();
			pat=patientDAO.readPatient(p);
			String pName=pat.getFirstName();
			String dEmail=d.getEmail();
			String dPhone=d.getPhone();

			
			
			 List<NameValuePair> params = new ArrayList<NameValuePair>(); 
	 		 params.add(new BasicNameValuePair("To", "+1"+dPhone)); 
	 		 params.add(new BasicNameValuePair("From", "+16509341358")); 
	 		 params.add(new BasicNameValuePair("Body", "This is SMS NOTIFICATION TO ADD PATIENT"+ pName));
	          try {
				SmsSender.sendSMS(params);
			} catch (TwilioRestException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			 String[] toEmails = {dEmail};
	          String emailSubject = "patient wants to add you";
	          String emailBody = "This is an email sent by"+ pName;
	         
	          
	          EmailNotification notification= new EmailNotification();
	          try {
				notification.mail(toEmails,emailSubject,emailBody);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//System.out.println("doctorrrrrrrrr" + p.getDoctor().getLastName());
			System.out.println("Doctor Added Successfully with id="+id_doctor);
			request.setAttribute("success", "Doctor Added Successfully");
			request.setAttribute("Patient", pat);
			session.setAttribute("Patient", pat);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/Profile.jsp");
			rd.forward(request, response);
		

	}



}
