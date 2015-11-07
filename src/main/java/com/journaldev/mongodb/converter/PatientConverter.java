package com.journaldev.mongodb.converter;

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

		BasicDBObjectBuilder builder = BasicDBObjectBuilder.start()
				.append("firstName", p.getName())
				.append("lastName", p.getLastName())
				.append("password", p.getPassword())
				.append("streetAddress",p.getStreetAddress() )
				.append("state", p.getState())
				.append("city", p.getCity())
				.append("zipcode", p.getZipCode())
				.append("phone", p.getPhone())
				.append("email", p.getEmail())
		        .append("d_name",p.getdName())
		        .append("d_mail_id",p.getdMailId())
		        .append("d_id",p.getdId())
		        .append("allergy", p.getAllergy());

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
		p.setZipCode((String) doc.get("zipcode"));
		p.setPhone((String) doc.get("phone"));
		p.setEmail((String) doc.get("email"));
		p.setCity((String) doc.get("city"));
		p.setdName((String) doc.get("d_name"));
		p.setdId((String)doc.get("d_id"));
	//	BasicDBList allergy = (BasicDBList) doc.get("allergy");
		p.setAllergy((String[]) doc.get("allergy"));

		//p.setAllergy((String[]) allergy.toArray(new String[allergy.size()]));
		p.setdMailId((String)doc.get("d_mail_id"));
		ObjectId id = (ObjectId) doc.get("_id");
		p.setId(id.toString());
		return p;
	}
	
}
