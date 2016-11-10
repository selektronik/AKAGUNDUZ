package com.akagunduz.model;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "Users")
public class User {
	
	private String id;
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	private String name;
	private String surname;
	private String phone_number;
	
	public User(){
		
	}
	public User(String name,String surname,String phone_number){
		
		this.name=name;
		this.surname=surname;
		this.phone_number=phone_number;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	
	
}
