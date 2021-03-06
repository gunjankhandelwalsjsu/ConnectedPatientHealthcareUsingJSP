package com.journaldev.mongodb.model;

import java.util.List;

/**
 * Created by Aishwarya on 10/29/2015.
 */
public class Doctor {

	private String id;
    String firstName;
	String lastName;
    String password;
    String streetAddress;
    String city;
    String state;
    String zipcode;
    String phone;
	List<String> specialization;
    String email;
    public List<String> getSpecialization() {
		return specialization;
	}

	public void setSpecialization(List<String> specialization) {
		this.specialization = specialization;
	}


   
	List<String> patientEmail;
	
	 public List<String> getPatientEmail() {
			return patientEmail;
		}

		public void setPatientEmail(List<String> patientEmail) {
			this.patientEmail = patientEmail;
		}

	
  

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

    public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipCode) {
		this.zipcode = zipCode;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	

   
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

  
   

    public String getName() {
        return firstName;
    }

    public void setName(String name) {
        this.firstName = name;
    }
}
