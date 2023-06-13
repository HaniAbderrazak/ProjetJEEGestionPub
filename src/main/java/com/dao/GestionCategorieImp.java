package com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class GestionCategorieImp implements IGestionCategorie  {

	EntityManagerFactory emf;
	EntityManager em;
	EntityTransaction et;
	
	public GestionCategorieImp()
	{
		emf=Persistence.createEntityManagerFactory("punit1");
		em=emf.createEntityManager();
		et=em.getTransaction();
	}
	@Override
	public Categorie RechercheParId(int id) {
	
		
		return em.find(Categorie.class, id);
	}

	@Override
	public List<Categorie> getAllCategorie() {
		
		Query q=(Query) em.createQuery("select k from Categorie k");
		return q.getResultList();
	}
	
	@Override
	public List<Categorie> getCategorieParNom(String nom) {
		Query q=(Query) em.createQuery("select k from Categorie k where nom='"+nom+"'");
		return q.getResultList();
	}

}
