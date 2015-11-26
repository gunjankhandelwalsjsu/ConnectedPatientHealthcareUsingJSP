package com.journaldev.mongodb.util;


     import com.mongodb.*;
     import java.net.UnknownHostException;

	
public class dconnect
{
	
	final String DBNAME="journaldev";
	public static dconnect instance;
	public Mongo connection;
	public DB database;
	String email;

	public dconnect() throws UnknownHostException
	{
		
		
		 String textUri = "mongodb://gunjan:khandelwal@ds059284.mongolab.com:59284/journaldev";
         MongoClientURI uri = new MongoClientURI(textUri);
         MongoClient mongo = null;
 		 mongo = new MongoClient(uri);		
		this.database=mongo.getDB(DBNAME);
	}
	
	public static dconnect createInstance() throws UnknownHostException
	{
		if(dconnect.instance==null)
		{	
			dconnect.instance=new dconnect();
		}
		return dconnect.instance;
	}
	
	public DBCollection getCollection(String name)
	{
	     return this.database.getCollection(name);
	}
		
	public void setEmail(String email)
	{
         this.email=email;
}
	
	public String getEmail()
      {
    return email;
     }
	
	
}
	
	
	
	