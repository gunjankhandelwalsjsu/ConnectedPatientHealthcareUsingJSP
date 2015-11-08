
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

import com.journaldev.mongodb.dao.MongoDBPatientDAO;
import com.journaldev.mongodb.dao.MongoDBPersonDAO;
import com.journaldev.mongodb.dao.MongoDBDoctorDAO;
import com.journaldev.mongodb.model.Doctor;
import com.journaldev.mongodb.model.Person_login;
import com.mongodb.MongoClient;

	@WebServlet("/loginDoctor")
	public class LoginServlet extends HttpServlet {


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
				MongoDBDoctorDAO doctorDAO = new MongoDBDoctorDAO(mongo);
				System.out.println(email);
				Doctor doctor=doctorDAO.getDoctor(email);
			   if(doctor==null)
				{
					RequestDispatcher rd = getServletContext().getRequestDispatcher(
							"/loginDoctor.jsp");
					request.setAttribute("success", "Please check your credentials!!!");
					rd.forward(request, response);
				}
				else{
				System.out.println("Person logged in Successfully with address="+doctor.getPatientEmail());
				request.setAttribute("success", "Doctor"+doctor.getFirstName()+"loggedIn Successfully");
				HttpSession session = request.getSession();

				session.setAttribute("doctor", doctor);
				session.setAttribute("id", doctor.getId());
				request.setAttribute("id", doctor.getId());
			/*     List<Doctor> doctors = doctorDAO.readAllDoctor();
			     request.setAttribute("doctors", doctors);
			     session.setAttribute("doctors", doctors);
			     */

				RequestDispatcher rd = getServletContext().getRequestDispatcher(
						"/ProfileDoctor.jsp");
				rd.forward(request, response);
				}
			}
		}

	}


