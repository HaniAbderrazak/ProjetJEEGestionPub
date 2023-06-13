package com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class GestionPubImp implements IGestionPub{
	EntityManagerFactory emf;
	EntityManager em;
	EntityTransaction et;

public GestionPubImp()
{
	emf=Persistence.createEntityManagerFactory("punit1");
	em=emf.createEntityManager();
	et=em.getTransaction();
}
	@Override
	public void ajoutPub(publication p) {
		et.begin();
		em.persist(p);
		et.commit();
	}

	@Override
	public void supprimerPub(int id) {
		publication p=em.find(publication.class, id);
		if(p != null)
		{
				et.begin();
				em.remove(p);
				et.commit();
		}
		
	}
	public void supprimerPubyuser(int userId) {
		List<publication> lise=getPubParUser(userId);
		for(int i=0;i<lise.size();i++)
		{
			supprimerPub(lise.get(i).getId());
		}
	}

	@Override
	public publication recherecheParId(int id) {
		Query q=(Query) em.createQuery("select p from publication p where id="+id);
		return (publication) q.getSingleResult();
	}

	@Override
	public List<publication> getAllpublication(int start,int end) {
		Query q=(Query) em.createQuery("select p from publication p");
		q.setFirstResult(start);
		q.setMaxResults(end);
		return q.getResultList();
	}

	@Override
	public List<publication> getPubParNom(String nom) {
		Query q=(Query) em.createQuery("select p from publication p where titre like '%"+nom+"%'");
		return q.getResultList();
	}

	@Override
	public void modifPub(publication p) {
		em.find(publication.class, p.getId());
		et.begin();
		em.merge(p);
		et.commit();
		
	}

	@Override
	public List<publication> getPubParCategorie(int id) {
		Query q=(Query) em.createQuery("select p from publication p where categorie_id="+id);
		return q.getResultList();
	}

	@Override
	public List<publication> getPubParUser(int id) {
		
		
		
		Query q=(Query) em.createQuery("select p from publication p where user_id="+id);
		return q.getResultList();
	}

}
