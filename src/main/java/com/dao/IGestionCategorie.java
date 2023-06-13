package com.dao;

import java.util.List;

public interface IGestionCategorie {
	public Categorie RechercheParId(int id);
	public List<Categorie> getAllCategorie();
	public List<Categorie> getCategorieParNom(String nom);
}
