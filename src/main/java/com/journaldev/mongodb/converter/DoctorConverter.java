package com.journaldev.mongodb.converter;

import java.util.ArrayList;
import java.util.List;

import org.bson.types.ObjectId;

import com.journaldev.mongodb.model.Doctor;
import com.journaldev.mongodb.model.Person_login;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObjectBuilder;
import com.mongodb.DBObject;

public class DoctorConverter {

	// convert Doctor Object to MongoDB DBObject
	// take special note of converting id String to ObjectId
	public static DBObject toDBObject(Doctor p) {

		BasicDBObjectBuilder builder = BasicDBObjectBuilder.start()
				.append("firstName", p.getName())
				.append("lastName", p.getLastName())
				.append("password", p.getPassword())
				.append("streetAddress",p.getStreetAddress() )
				.append("state", p.getState())
				.append("city", p.getCity())
				.append("zipcode", p.getZipcode())
				.append("phone", p.getPhone())
				.append("Specialization", p.getSpecialization())
				.append("email", p.getEmail());
		if(!p.getPatientEmail().equals(null))
             builder.append("patientEmail",p.getPatientEmail());

		if (p.getId() != null)
			builder = builder.append("_id", new ObjectId(p.getId()));
		return builder.get();
	}

	// convert DBObject Object to Doctor
	// take special note of converting ObjectId to String
	public static Doctor toDoctor(DBObject doc) {
		Doctor p = new Doctor();
		p.setName((String) doc.get("firstName"));
		p.setLastName((String) doc.get("lastName"));
		p.setPassword((String) doc.get("password"));
		p.setStreetAddress((String) doc.get("streetAddress"));
		p.setState((String) doc.get("state"));
		p.setZipcode((String) doc.get("zipcode"));
		p.setPhone((String) doc.get("phone"));
		p.setEmail((String) doc.get("email"));
		p.setCity((String) doc.get("city"));
		p.setPatientEmail((List<String>) doc.get("patientEmail"));
		BasicDBList specialization = (BasicDBList) doc.get("Specialization");
		List<String> spec = new ArrayList<String>();
		if (specialization != null && specialization.size() != 0) {

			for (int i = 0; i < specialization.size(); i++) {
				spec.add(specialization.get(i).toString());
			}
		} else
			spec.add("No Specializations. Edit your profile to include your specialization");
		p.setSpecialization(spec);
		ObjectId id = (ObjectId) doc.get("_id");
		p.setId(id.toString());
		return p;

	}
	
	
	
}
