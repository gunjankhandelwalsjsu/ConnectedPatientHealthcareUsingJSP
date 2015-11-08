package com.journaldev.mongodb.servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONArray;
import org.json.JSONObject;

import com.journaldev.mongodb.dao.MongoDBPatientDAO;
import com.journaldev.mongodb.model.Patient;
import com.mongodb.MongoClient;

@WebServlet("/foodPatient")

public class GetFoodDetailServlet extends HttpServlet {
	String SERVER_URL="http://world.openfoodfacts.org/api/v0/product/737628064502.json";
	String email;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	final HttpClient httpClient = new DefaultHttpClient();
	// method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(3, false));
	HttpGet httpget = new HttpGet(SERVER_URL);
	HttpResponse resp = httpClient.execute(httpget);
    System.out.println(resp);
    
			
		InputStream inputStream = null;
        String result = "";
        
            // create HttpClient
            HttpClient httpclient = new DefaultHttpClient();

            // make GET request to the given URL
		 //   URL url = new URL("http://world.openfoodfacts.org/api/v0/product/737628064502.json");

            HttpResponse httpResponse = httpclient.execute(new HttpGet(SERVER_URL));

            // receive response as inputStream
            inputStream = httpResponse.getEntity().getContent();

            // convert inputstream to string
            if (inputStream != null)
                result = convertInputStreamToString(inputStream);
            else
                result = "Did not work!";

        
        if(result.equals("Did not work")) {
            System.out.println("result doesnt exist");
        }
        else {
            
                JSONObject obj = new JSONObject(result);
                JSONObject product=obj.getJSONObject("product");
                JSONArray states = product.getJSONArray("states_tags");
               List<String> state = new ArrayList<String>();
                for(int i = 0 ; i < states.length(); i++) {
                	state.add(states.get(i).toString());
                }
             //   String brands = obj1.getString("brands");

                System.out.println(product.toString()+"product");
                if(state.contains( "en:ingredients-completed"))
                {
                	System.out.println("true");
                	String ingredientString=product.getString("ingredients_text");
                	String[] ingredients=ingredientString.split(",");
                	for(String i:ingredients){
                		System.out.println(i);
                	}
                	MongoClient mongo =(MongoClient) request.getServletContext()
            				.getAttribute("MONGO_CLIENT");
            		MongoDBPatientDAO patientDAO = new MongoDBPatientDAO(mongo);
            		Patient p = new Patient();

            		p = patientDAO.getPatient(email);
            		List<String> Allergy=p.getAllergy();
            		if(Allergy!=null && Allergy.size()!=0){
            		for(String a: Allergy){
            			if(ingredientString.contains(a))
            				System.out.println("Don't consume you are allergic to "+a);
            		}
            		}
                }
              //  showMessageDialog("brands, " + brands);  
        request.setAttribute("foodPatient", resp);
    	RequestDispatcher rd = getServletContext().getRequestDispatcher(
    			"/Food.jsp");
    	rd.forward(request, response);
            
        }
		  
}
	
	 private static String convertInputStreamToString(InputStream inputStream) throws IOException {
	        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
	        String line = "";
	        String result = "";
	        while ((line = bufferedReader.readLine()) != null)
	            result += line;

	        inputStream.close();
	        return result;

	    }
}