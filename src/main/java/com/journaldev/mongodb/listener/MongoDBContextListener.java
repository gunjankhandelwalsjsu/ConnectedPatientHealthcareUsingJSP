package com.journaldev.mongodb.listener;

import java.net.UnknownHostException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;

@WebListener
public class MongoDBContextListener implements ServletContextListener {
	
	
	
	 @Override
	    public void contextDestroyed(ServletContextEvent sce) {
	        MongoClient mongo = (MongoClient) sce.getServletContext()
	                            .getAttribute("MONGO_CLIENT");
	        mongo.close();
	        System.out.println("MongoClient closed successfully");
	    }
	 
	    @Override
	    public void contextInitialized(ServletContextEvent sce) {
	        ServletContext ctx = sce.getServletContext();
	        //   MongoClient mongo = null;
	           String textUri = ctx.getInitParameter("mongoURI");
	           MongoClientURI uri = new MongoClientURI(textUri);
	           MongoClient mongo = null;
	   		mongo = new MongoClient(uri);
			 
			System.out.println("MongoClient initialized successfully");
			sce.getServletContext().setAttribute("MONGO_CLIENT", mongo);
	    }
	 
	
	/*private static final String MONGO_URI_PARAM = "mongoURI";
	private static final String DEFAULT_MONGO_URI = "mongodb://localhost:27017";

	 @Override
	    public void contextDestroyed(ServletContextEvent sce) {
	        MongoClientURI mongo = (MongoClientURI) sce.getServletContext()
	                            .getAttribute("MONGO_CLIENT");
	        MongoHolder.dispose();
	        System.out.println("MongoClient closed successfully");
	    }
	 
	 public void contextInitialized(ServletContextEvent event) {
			try {
				MongoClientURI mongoURI = new MongoClientURI(getMongoURI(event));
				MongoHolder.connect(mongoURI, true);
	            System.out.println("MongoClient initialized successfully");
	            event.getServletContext().setAttribute("MONGO_CLIENT", mongoURI);
			} catch (UnknownHostException e) {
				throw new RuntimeException(e);
			}
		}

	    private String getMongoURI(ServletContextEvent event) {
			String mongoURI = null;
			ServletContext context = event.getServletContext();
			if (context != null) {
				mongoURI = context.getInitParameter(MONGO_URI_PARAM);
			}
			return mongoURI != null ? mongoURI : DEFAULT_MONGO_URI;
		}
*/
}
