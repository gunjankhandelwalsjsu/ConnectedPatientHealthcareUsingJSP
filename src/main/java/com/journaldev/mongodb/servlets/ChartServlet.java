package com.journaldev.mongodb.servlets;


	import java.io.IOException;
import java.io.PrintWriter;
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

import org.json.JSONObject;
import org.json.simple.JSONArray;

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
            JSONArray jsonArray=new JSONArray();

            for(int i=0;i<t.getTemp().size();i++){
                JSONObject jsonObj = new JSONObject();
            	ChartData d=new ChartData();
            	d.setTemperature(t.getTemp().get(i));
            	String timestamp = t.getTime().get(i).toString();
                jsonObj.put("temperature", d.getTemperature());           
            	d.setTime(timestamp);
            	jsonObj.put("time", d.getTime());
                jsonArray.add(jsonObj);
            }       
            
            response.setContentType("application/json");
           PrintWriter out = response.getWriter();
            out.println(jsonArray);
            out.close();

		
	       
	    }  

	    /**
	     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	     *      response)
	     */
	    

	}