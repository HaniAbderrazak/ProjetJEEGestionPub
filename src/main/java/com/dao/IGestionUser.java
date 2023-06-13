package com.dao;

public interface IGestionUser {
	user verification(String login,String p);
	void registration(user u);
	void modifuser(user u);
	user getUserById(int id);
	void supprimeruser(int id);
}
