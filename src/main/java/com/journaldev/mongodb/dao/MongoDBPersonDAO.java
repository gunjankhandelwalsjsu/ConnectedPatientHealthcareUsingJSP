package com.journaldev.mongodb.dao;

import java.util.ArrayList;
import java.util.List;

import org.bson.types.ObjectId;

import com.journaldev.mongodb.converter.PersonConverter;
import com.journaldev.mongodb.model.Person_login;
import com.mongodb.BasicDBObjectBuilder;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

//DAO class for different MongoDB CRUD operations
//take special note of "id" String to ObjectId conversion and vice versa
//also take note of "_id" key for primary key
public class MongoDBPersonDAO {

	private DBCollection col;

	public MongoDBPersonDAO(MongoClient mongo) {
		this.col = mongo.getDB("journaldev").getCollection("Persons");
	}

	public Person_login createPerson(Person_login p) {
		DBObject doc = PersonConverter.toDBObject(p);
		this.col.insert(doc);
		ObjectId id = (ObjectId) doc.get("_id");
		p.setId(id.toString());
		return p;
	}

	public void updatePerson(Person_login p) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("_id", new ObjectId(p.getId())).get();
		this.col.update(query, PersonConverter.toDBObject(p));
	}

	public List<Person_login> readAllPerson() {
		List<Person_login> data = new ArrayList<Person_login>();
		DBCursor cursor = col.find();
		while (cursor.hasNext()) {
			DBObject doc = cursor.next();
			Person_login p = PersonConverter.toPerson(doc);
			data.add(p);
		}
		return data;
	}

	public void deletePerson(Person_login p) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("_id", new ObjectId(p.getId())).get();
		this.col.remove(query);
	}

	public Person_login readPerson(Person_login p) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("_id", new ObjectId(p.getId())).get();
		DBObject data = this.col.findOne(query);
		return PersonConverter.toPerson(data);
	}
	public Boolean hasPerson(String email) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("email", email).get();
		DBObject data = this.col.findOne(query);
		if(data!=null)
			return false;
		else
			return true;
		
	}
	public Person_login getPerson(String email) {
		
		DBObject query = BasicDBObjectBuilder.start()
				.append("email", email).get();

		DBObject data = this.col.findOne(query);
		if (data==null){
			return null;}
		else{			

		return PersonConverter.toPerson(data);
		}
		
	}

}
