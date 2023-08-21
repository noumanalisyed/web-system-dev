package com.example.anotation;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloSpringApp {

	public static void main(String[] args) {
		
		// load the spring configuration file
		
		ClassPathXmlApplicationContext context = 
						new ClassPathXmlApplicationContext("applicationContext.xml");
						
		// retrieve bean from spring container
		FootballCoach theFootballCoach =  context.getBean("footballCoach", FootballCoach.class);

		theFootballCoach.display();
		HockeyCoach theHockeyCoach =  context.getBean("hockeyCoach", HockeyCoach.class);

		theHockeyCoach.display();
		// call methods on the bean
		//System.out.println("First Name = "+theFootballCoach.getFirsName());
				
		// let's call our new method for fortunes
		// close the context
		context.close();
	}

}
