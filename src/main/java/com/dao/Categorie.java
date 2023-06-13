package com.dao;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Categorie {
	public Categorie() {
		super();
	}
	public Categorie(String nom) {
		super();
		this.nom = nom;
	}
	public Categorie(String nom, List<com.dao.publication> publication) {
		super();
		this.nom = nom;
		this.publication = publication;
	}
	@Id@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String nom;
	@OneToMany(mappedBy="categorie")
	List<publication> publication ;
	public Categorie(int id, String nom, List<com.dao.publication> publication) {
		super();
		this.id = id;
		this.nom = nom;
		this.publication = publication;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public List<publication> getPublication() {
		return publication;
	}
	public void setPublication(List<publication> publication) {
		this.publication = publication;
	}
}
