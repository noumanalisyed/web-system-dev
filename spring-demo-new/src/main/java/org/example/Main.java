package org.example;

public class Main {
    Coach coach;  // reference variable created in stack
    public Main(){
        coach = new BaseballCoach(); //object creation of Baseball Coach in heap
        System.out.println("Coach Information "+coach.getInformation());
        System.out.println("Coach Workout "+coach.getDailyWorkout());
        System.out.println("Fortune  "+coach.getDailyFortune());
    }
    public static void main(String[] args) {
        Main m = new Main();
        //System.out.println("Hello world!");
    }
}
