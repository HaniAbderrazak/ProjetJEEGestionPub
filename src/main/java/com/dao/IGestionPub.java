package com.dao;

import java.util.List;

public interface IGestionPub {

	public void ajoutPub(publication p);
	public void supprimerPub(int id);
	public publication recherecheParId(int id);
	public List<publication> getAllpublication(int start,int end);
	public List<publication> getPubParNom(String nom);
	public void modifPub(publication p);
	List<publication> getPubParCategorie(int id);
	List<publication> getPubParUser(int id);
	void supprimerPubyuser(int x);
}
