package com.journaldev.mongodb.dao;

import java.util.ArrayList;
import java.util.List;

import org.bson.types.ObjectId;

import com.journaldev.mongodb.converter.DoctorConverter;
import com.journaldev.mongodb.model.Doctor;
import com.journaldev.mongodb.model.Person_login;
import com.mongodb.BasicDBObjectBuilder;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

//DAO class for different MongoDB CRUD operations
//take special note of "id" String to ObjectId conversion and vice versa
//also take note of "_id" key for primary key
public class MongoDBDoctorDAO {

	private DBCollection col;

	public MongoDBDoctorDAO(MongoClient mongo) {
		this.col = mongo.getDB("journaldev").getCollection("Doctors");
	}

	public Person_login createDoctor(Person_login p) {
		DBObject doc = DoctorConverter.toDBObject(p);
		this.col.insert(doc);
		ObjectId id = (ObjectId) doc.get("_id");
		p.setId(id.toString());
		return p;
	}

	public void updateDoctor(Person_login p) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("_id", new ObjectId(p.getId())).get();
		this.col.update(query, DoctorConverter.toDBObject(p));
	}

	public List<Doctor> readAllDoctor() {
		List<Doctor> data = new ArrayList<Doctor>();
		DBCursor cursor = col.find();
		while (cursor.hasNext()) {
			DBObject doc = cursor.next();
			Doctor p = DoctorConverter.toDoctor(doc);
			data.add(p);
		}
		return data;
	}

	public void deleteDoctor(Doctor p) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("_id", new ObjectId(p.getId())).get();
		this.col.remove(query);
	}

	public Doctor readDoctor(Person_login p) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("_id", new ObjectId(p.getId())).get();
		DBObject data = this.col.findOne(query);
		return DoctorConverter.toDoctor(data);
	}
	public Boolean hasDoctor(String email) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("email", email).get();
		DBObject data = this.col.findOne(query);
		if(data!=null)
			return false;
		else
			return true;
		
	}
	public Doctor getDoctor(String email) {
		
		DBObject query = BasicDBObjectBuilder.start()
				.append("email", email).get();
		DBObject data = this.col.findOne(query);
		if (data==null){
			System.out.println("ret null");
		
			return null;}
		else{			
		return DoctorConverter.toDoctor(data);
		}
		
	}

}
