package com.journaldev.mongodb.dao;

import java.util.ArrayList;
import java.util.List;

import org.bson.types.ObjectId;

import com.journaldev.mongodb.converter.PatientConverter;
import com.journaldev.mongodb.converter.PersonConverter;
import com.journaldev.mongodb.converter.DoctorConverter;
import com.journaldev.mongodb.model.Doctor;
import com.journaldev.mongodb.model.Patient;
import com.journaldev.mongodb.model.Person_login;
import com.mongodb.BasicDBObject;
import com.mongodb.BasicDBObjectBuilder;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.WriteResult;

//DAO class for different MongoDB CRUD operations
//take special note of "id" String to ObjectId conversion and vice versa
//also take note of "_id" key for primary key
public class MongoDBPatientDAO {

	private DBCollection col;

	public MongoDBPatientDAO(MongoClient mongo) {
		this.col = mongo.getDB("journaldev").getCollection("Patients");
	}

	public Patient createPatient(Patient p) {
		DBObject doc = PatientConverter.toDBObject(p);
		this.col.insert(doc);
		ObjectId id = (ObjectId) doc.get("_id");
		p.setId(id.toString());
		return p;
	}

	public void updatePatient(Patient p) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("_id", new ObjectId(p.getId())).get();
		this.col.update(query, PatientConverter.toDBObject(p));
	}

	public List<Patient> readAllPatient() {
		List<Patient> data = new ArrayList<Patient>();
		DBCursor cursor = col.find();
		while (cursor.hasNext()) {
			DBObject doc = cursor.next();
			Patient p = PatientConverter.toPatient(doc);
			data.add(p);
		}
		return data;
	}

	public void deletePatient(Patient p) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("_id", new ObjectId(p.getId())).get();
		this.col.remove(query);
	}
	
	public Boolean hasPatient(String email) {
		
		BasicDBObject query = new BasicDBObject();
		query.put("email", email);
		DBObject data = this.col.findOne(query);
		if(data!=null)
			return false;
		else
			return true;
		
	}

public Patient getPatient(String email) {
		
		DBObject query = BasicDBObjectBuilder.start()
				.append("email", email).get();

		DBObject data = this.col.findOne(query);
		if (data==null){
			return null;}
		else{			

		return PatientConverter.toPatient(data);
		}
}



	public Patient readPatient(Patient p) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("_id", new ObjectId(p.getId())).get();
		DBObject data = this.col.findOne(query);
		return PatientConverter.toPatient(data);
	}

	public void updatePatient(Patient patient, Doctor d) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("_id", new ObjectId(patient.getId())).get();
		 DBObject update = new BasicDBObject();
	        update.put("$set", new BasicDBObject("Doctor",DoctorConverter.toDBObject(d)));
	        WriteResult result = this.col.update(query, update);
	        
		//this.col.update(query, PatientConverter.toDBObject(patient));		
	}
	public void updatePatientWithDoctor(Patient p) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("_id", new ObjectId(p.getId())).get();
		this.col.update(query, PatientConverter.toDBObject(p));
	}

}
