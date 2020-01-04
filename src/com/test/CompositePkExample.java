package com.test;

import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

public class CompositePkExample {
public static void main(String[] args) {
	
	Configuration configuration = new Configuration();
	configuration = configuration.configure("hibernate.cfg.xml");
	 Session session = configuration.buildSessionFactory().openSession();
	
	// session.save(arg0)
}
}
