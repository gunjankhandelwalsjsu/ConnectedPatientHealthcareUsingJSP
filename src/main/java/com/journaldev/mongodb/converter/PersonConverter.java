package com.journaldev.mongodb.converter;

import org.bson.types.ObjectId;

import com.journaldev.mongodb.model.Person_login;
import com.mongodb.BasicDBObjectBuilder;
import com.mongodb.DBObject;

public class PersonConverter {

	// convert Person Object to MongoDB DBObject
	// take special note of converting id String to ObjectId
	public static DBObject toDBObject(Person_login p) {

		BasicDBObjectBuilder builder = BasicDBObjectBuilder.start()
				.append("firstName", p.getName())
				.append("lastName", p.getLastName())
				.append("password", p.getPassword())
				.append("streetAddress",p.getStreetAddress() )
				.append("state", p.getState())
				.append("city", p.getCity())
				.append("zipcode", p.getZipCode())
				.append("phone", p.getPhone())
				.append("email", p.getEmail());
		if (p.getId() != null)
			builder = builder.append("_id", new ObjectId(p.getId()));
		return builder.get();
	}

	// convert DBObject Object to Person
	// take special note of converting ObjectId to String
	public static Person_login toPerson(DBObject doc) {
		Person_login p = new Person_login();
		p.setName((String) doc.get("firstName"));
		System.out.println("ret not null");	

		p.setLastName((String) doc.get("lastName"));
		p.setPassword((String) doc.get("password"));
		p.setStreetAddress((String) doc.get("streetAddress"));
		p.setState((String) doc.get("state"));
		p.setZipCode((String) doc.get("zipcode"));
		p.setPhone((String) doc.get("phone"));
		p.setEmail((String) doc.get("email"));
		p.setCity((String) doc.get("city"));
		ObjectId id = (ObjectId) doc.get("_id");
		p.setId(id.toString());
		return p;

	}
	
	
	
}
