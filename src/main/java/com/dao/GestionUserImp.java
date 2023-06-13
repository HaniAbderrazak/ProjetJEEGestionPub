package com.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class GestionUserImp implements IGestionUser{ 
	
	
	EntityManagerFactory emf;
	EntityManager em;
	EntityTransaction et;

public GestionUserImp()
{
	emf=Persistence.createEntityManagerFactory("punit1");
	em=emf.createEntityManager();
	et=em.getTransaction();
}


public user verification(String login, String p) {
	Query q=(Query) em.createQuery("select u from user u where username ='"+login+"'and password='"+p+"'");
	return (user) q.getSingleResult();
}
public user getUserById(int id) {
	Query q=(Query) em.createQuery("select u from user u where id ="+id);
	return (user) q.getSingleResult();
}
@Override
public void registration(user u) {
	et.begin();
	em.persist(u);
	et.commit();
	
}
public void modifuser(user u)
{
	em.find(user.class, u.getId());
	et.begin();
	em.merge(u);
	et.commit();
}


@Override
public void supprimeruser(int id) {
	user p=em.find(user.class, id);
	if(p != null)
	{
			et.begin();
			em.remove(p);
			et.commit();
	}
	
}
}