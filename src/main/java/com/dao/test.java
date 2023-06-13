package com.dao;

import java.util.List;

public class test {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
IGestionPub gestion=new GestionPubImp();
		
	List<publication> list=gestion.getPubParUser(1);
		for(int i=0;i<list.size();i++)
		{
			System.out.println(list.get(i).getTitre());
		}
		
	}

}