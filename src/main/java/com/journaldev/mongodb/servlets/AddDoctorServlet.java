package com.journaldev.mongodb.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.journaldev.mongodb.dao.MongoDBDoctorDAO;
import com.journaldev.mongodb.model.Doctor;
import com.mongodb.MongoClient;

@WebServlet("/addDoctor")
public class AddDoctorServlet extends HttpServlet {

	private static final long serialVersionUID = -7060758261496829905L;

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
		if ((firstName == null || firstName.equals(""))) {
			request.setAttribute("error", "Mandatory Parameters Missing");
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/doctorRegistration.jsp");
			rd.forward(request, response);
		} 
		MongoClient mongo =(MongoClient) request.getServletContext()
				.getAttribute("MONGO_CLIENT");
		MongoDBDoctorDAO doctorDAO = new MongoDBDoctorDAO(mongo);
		if(!doctorDAO.hasDoctor(email)){
			request.setAttribute("error", "Email id already exists");
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/doctorRegistration.jsp");
			rd.forward(request, response);
		}
		
		
		else {
			Doctor p = new Doctor();
			p.setName(firstName);
			p.setLastName(lastName);
			p.setPassword(password);
			p.setEmail(email);
			p.setStreetAddress(streetAddress);
			p.setState(state);
			p.setCity(city);
			p.setZipCode(zipcode);
			p.setPhone(phone);
			
			doctorDAO.createDoctor(p);
			System.out.println("Doctor Added Successfully with id="+p.getId());
			request.setAttribute("success", "Doctor Added Successfully");
			request.setAttribute("doctor", p);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/ProfileDoctor.jsp");
			rd.forward(request, response);
		}
	}

}
