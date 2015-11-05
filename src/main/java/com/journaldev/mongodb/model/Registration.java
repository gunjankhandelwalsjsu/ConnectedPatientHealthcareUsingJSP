package com.journaldev.mongodb.model;



/**
 * Created by Aishwarya on 10/29/2015.
 */
public class Registration {
	
	String id;
    String username;
    String password;

    
    public Registration() {
		
	}
    

	public Registration(String id, String username, String password) {
		
		this.id = id;
		this.username = username;
		this.password = password;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
