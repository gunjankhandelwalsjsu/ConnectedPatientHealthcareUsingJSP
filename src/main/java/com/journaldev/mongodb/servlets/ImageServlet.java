package com.journaldev.mongodb.servlets;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.journaldev.mongodb.dao.MongoDBPatientDAO;
import com.journaldev.mongodb.model.Patient;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;

@WebServlet("/getPhoto")
public class ImageServlet extends HttpServlet  {
	 
	    protected void doGet(HttpServletRequest request,
	            HttpServletResponse response) throws ServletException, IOException {
	    	 MongoClient mongo = (MongoClient) request.getServletContext()
		                .getAttribute("MONGO_CLIENT"); 
		DB mongoDB = mongo.getDB("journaldev");
	  //   System.out.println("imgProcessing"+email);
	    //Let's store the standard data in regular collection
	    DBCollection collection = mongoDB.getCollection("imageCollection");
	     
	    //Let's store the standard data in regular collection
		HttpSession session = request.getSession();

	    String id= request.getParameter("id").toString();
		System.out.println(id);
		MongoDBPatientDAO patientDAO = new MongoDBPatientDAO(mongo);
		Patient p = new Patient();
		p.setId(id);
		p = patientDAO.readPatient(p);
		//Patient p=patientDAO.fetchPatient(id_patient);
		//System.out.println(p.getEmail());
		String email=p.getEmail();
		//String email = session.getParameter("email");

	 
	    BasicDBObject query = new BasicDBObject();
	    query.put("filename", email+".jpg");
	    DBObject doc = collection.findOne(query);
	    DBCursor cursor = collection.find(query);
	         
	    if (cursor.hasNext()) {
	      Set<String> allKeys = doc.keySet();
	      HashMap<String, String> fields = new HashMap<String,String>();
	      for (String key: allKeys) {
	        fields.put(key, doc.get(key).toString());
	      }
	           
	      
	          
	      GridFS fileStore = new GridFS(mongoDB, "imageCollection");
	      GridFSDBFile gridFile = fileStore.findOne(query);
	   
	     
	      InputStream in = gridFile.getInputStream();
          ByteArrayOutputStream buffer = new ByteArrayOutputStream();
          int nRead;
          byte[] data = new byte[16384];
          while ((nRead = in.read(data, 0, data.length)) != -1) {
              buffer.write(data, 0, nRead);
          }
	           
	      
	      buffer.flush();
          byte[]imagenEnBytes = buffer.toByteArray();
           System.out.println("here");
	   
          response.setHeader("Accept-ranges","bytes");
          response.setContentType( "image/jpg" );
          response.setContentLength(imagenEnBytes.length);
       //   response.setHeader("Expires","0");
          response.setHeader("Cache-Control","must-revalidate, post-check=0, pre-check=0");
          response.setHeader("Content-Description","File Transfer");
          response.setHeader("Content-Transfer-Encoding:","binary");

          OutputStream outi = response.getOutputStream();
          outi.write( imagenEnBytes );
          outi.flush();
          outi.close();
 	
}
	    }
}
