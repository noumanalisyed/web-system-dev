package org.example;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.FileNotFoundException;

public class HelloSpringApp {

	public static void main(String[] args) throws FileNotFoundException {
		
		// load the spring configuration file
		
		ClassPathXmlApplicationContext context = 
						new ClassPathXmlApplicationContext("applicationContext.xml");

		if(context != null) {
			// retrieve bean from spring container
			CricketCoach theCricketCoach = (CricketCoach) context.getBean("myCricketCoach", Coach.class);


			// call methods on the bean
			System.out.println(theCricketCoach.getDailyWorkout());
			System.out.println(theCricketCoach.getInformation());
			System.out.println(theCricketCoach.getDailyFortune());
			System.out.println(theCricketCoach.getEmailAddress());
			System.out.println(theCricketCoach.getTeam());

			// retrieve bean from spring container
			/*CricketCoach theCricketCoach = (CricketCoach) context.getBean("myCricketCoach", Coach.class);

			// call methods on the bean
			System.out.println(theCricketCoach.getDailyWorkout());
			System.out.println(theCricketCoach.getInformation());
			System.out.println(theCricketCoach.getDailyFortune());
			// let's call our new method for fortunes
			//System.out.println(theCricketCoach.getDailyFortune());
*/
			// close the context
			context.close();
		}
		else {
			context.close();
			throw new FileNotFoundException("Application Context File not Found !!!");

		}
	}

}
