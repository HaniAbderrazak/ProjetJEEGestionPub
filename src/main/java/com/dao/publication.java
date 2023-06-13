package com.dao;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class publication {
	public publication(String titre, String description, String date, String image, Categorie categorie,
			com.dao.user user) {
		super();
		this.titre = titre;
		this.description = description;
		this.date = date;
		this.image = image;
		this.categorie = categorie;
		this.user = user;
	}
	public publication() {
		super();
	}
	@Id @GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
	private String titre;
	private String description;
	private String date;
	private String image;
	@ManyToOne
	Categorie categorie;
	public user getUser() {
		return user;
	}
	public publication(int id, String titre, String description, String date, String image, Categorie categorie,
			com.dao.user user) {
		super();
		this.id = id;
		this.titre = titre;
		this.description = description;
		this.date = date;
		this.image = image;
		this.categorie = categorie;
		this.user = user;
	}
	public void setUser(user user) {
		this.user = user;
	}
	@ManyToOne
	user user;
	 public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getDescription() {
		return description;
	}
	public Categorie getCategorie() {
		return categorie;
	}
	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public publication(String titre, String description, String date, String image) {
		super();
		this.titre = titre;
		this.description = description;
		this.date = date;
		this.image = image;
	}
	
	public publication(String titre, String description, String date, String image, Categorie categorie) {
		super();
		this.titre = titre;
		this.description = description;
		this.date = date;
		this.image = image;
		this.categorie = categorie;
		
	}
}
