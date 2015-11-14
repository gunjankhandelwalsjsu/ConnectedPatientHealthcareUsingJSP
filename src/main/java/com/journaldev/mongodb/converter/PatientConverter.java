package com.journaldev.mongodb.converter;

import java.util.ArrayList;
import java.util.List;

import org.bson.types.ObjectId;

import com.journaldev.mongodb.model.Doctor;
import com.journaldev.mongodb.model.Patient;
import com.journaldev.mongodb.model.Person_login;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObjectBuilder;
import com.mongodb.DBObject;

public class PatientConverter {

	// convert Person Object to MongoDB DBObject
	// take special note of converting id String to ObjectId
	public static DBObject toDBObject(Patient p) {

		BasicDBObjectBuilder builder = BasicDBObjectBuilder.start().append("firstName", p.getName())
				.append("lastName", p.getLastName())
				.append("password", p.getPassword())
				.append("streetAddress", p.getStreetAddress())
				.append("state", p.getState())
				.append("city", p.getCity())
				.append("zipcode", p.getZipcode())
				.append("phone", p.getPhone())
				.append("email", p.getEmail())
				.append("birthDate", p.getBirthDate())
				.append("gender", p.getGender())
				.append("allergy", p.getAllergy())
				.append("Disease", p.getAllergy())
				.append("doctorName", p.getDoctorName())
			    .append("doctorMailId", p.getDoctorMailId())
			    .append("dPhone", p.getdPhone());
		

		if (p.getId() != null)
			builder = builder.append("_id", new ObjectId(p.getId()));
		return builder.get();
	}

	// convert DBObject Object to Patient
	// take special note of converting ObjectId to String
	public static Patient toPatient(DBObject doc) {
		Patient p = new Patient();
		p.setName((String) doc.get("firstName"));
		p.setLastName((String) doc.get("lastName"));
		p.setPassword((String) doc.get("password"));
		p.setStreetAddress((String) doc.get("streetAddress"));
		p.setState((String) doc.get("state"));
		p.setZipcode((String) doc.get("zipcode"));
		p.setPhone((String) doc.get("phone"));
		p.setEmail((String) doc.get("email"));
		p.setCity((String) doc.get("city"));
		p.setDoctorName((String) doc.get("doctorName"));
		p.setBirthDate((String) doc.get("birthDate"));
		p.setGender((String) doc.get("gender"));
		p.setdPhone((String) doc.get("dPhone"));
		p.setDoctorMailId((String) doc.get("doctorMailId"));

		BasicDBList allergy = (BasicDBList) doc.get("allergy");
		List<String> all = new ArrayList<String>();
		if (allergy != null && allergy.size() != 0) {
			for (int i = 0; i < allergy.size(); i++) {
				all.add(allergy.get(i).toString());
			}
		} else
			all.add("no allergies");
		p.setAllergy(all);

		BasicDBList disease = (BasicDBList) doc.get("Disease");
		List<String> dis = new ArrayList<String>();
		if (disease != null && disease.size() != 0) {

			for (int i = 0; i < disease.size(); i++) {
				dis.add(disease.get(i).toString());
			}
		} else
			dis.add("no disease");
		p.setDisease(dis);

		ObjectId id = (ObjectId) doc.get("_id");
		p.setId(id.toString());
		return p;
	}

}
