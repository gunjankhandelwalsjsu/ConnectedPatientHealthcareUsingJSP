package com.journaldev.mongodb.servlets;


	import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;

import com.journaldev.mongodb.dao.MongoDBPatientDAO;
import com.journaldev.mongodb.dao.MongoDBTemperatureDAO;
import com.journaldev.mongodb.model.ChartData;
import com.journaldev.mongodb.model.Patient;
import com.journaldev.mongodb.model.Temperature;
import com.mongodb.MongoClient;

	/**
	 * Servlet implementation class PieChartServlet
	 */
	@WebServlet("/ChartServlet")
	public class ChartServlet extends HttpServlet {
	    private static final long serialVersionUID = 1L;
	    public ChartServlet() {
	        super();
	    }

	  
	    protected void doGet(HttpServletRequest request,
	    		HttpServletResponse response) throws ServletException, IOException
	    {	        
	    	String id= request.getParameter("id").toString();
			System.out.println("we r getting u charts"+id);
			MongoClient mongo = (MongoClient) request.getServletContext()
					.getAttribute("MONGO_CLIENT");
			MongoDBPatientDAO patientDAO = new MongoDBPatientDAO(mongo);
			Patient p = new Patient();
			p.setId(id);
			p = patientDAO.readPatient(p);
			//Patient p=patientDAO.fetchPatient(id_patient);
			//System.out.println(p.getEmail());
			String email=p.getEmail();
			
			MongoDBTemperatureDAO temperatureDAO = new MongoDBTemperatureDAO(mongo);
            Temperature t=new Temperature();
            t=temperatureDAO.getTemperature(email);

            List<ChartData> chartDataList;
            chartDataList = new ArrayList<ChartData>();
            for(int i=0;i<t.getTemp().size();i++){
            	ChartData d=new ChartData();
            	d.setTemperature(t.getTemp().get(i));
            	String timestamp = t.getTime().get(i).toString();
            	d.setTime(timestamp);
            	
            chartDataList.add(d);
            }
            
		System.out.println("we r getting u botoom charts"+chartDataList.get(3).getTemperature());

	        request.setAttribute("chartDataList", chartDataList);
	        RequestDispatcher requestDispatcher = request
	                .getRequestDispatcher("/pieChart.jsp");
	        requestDispatcher.forward(request, response);
	    }

	    /**
	     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	     *      response)
	     */
	    

	}