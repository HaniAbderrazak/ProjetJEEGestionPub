package com.dao;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
@Entity
public class user {
	public user(int id, String userName, String email, String password, String imgUser) {
		super();
		this.id = id;
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.imgUser = imgUser;
	}

	public user(String userName, String email, String password, String imgUser) {
		super();
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.imgUser = imgUser;
	}

	public user(String userName, String email, String password, String imgUser, List<publication> publications) {
		super();
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.imgUser = imgUser;
		this.publications = publications;
	}

	public user() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<publication> getPublications() {
		return publications;
	}

	public void setPublications(List<publication> publications) {
		this.publications = publications;
	}

	public user(String userName, String email, String password, List<publication> publications) {
		super();
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.publications = publications;
	}

	public user(String userName, String email, String password) {
		super();
		this.userName = userName;
		this.email = email;
		this.password = password;
	}

	@Id @GeneratedValue(strategy= GenerationType.IDENTITY)
private int id;
private String userName;
private String email;
private String password;
private String imgUser;



public String getImgUser() {
	return imgUser;
}

public void setImgUser(String imgUser) {
	this.imgUser = imgUser;
}

@OneToMany(mappedBy="user")
List<publication> publications ;

}
