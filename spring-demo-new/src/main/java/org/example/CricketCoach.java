package org.example;

import java.io.IOException;

public class CricketCoach implements Coach{

    private String emailAddress;
    private String team;

    private FortuneService fortuneService;
    public CricketCoach() {
    }

    // constructor injection
    public CricketCoach(FortuneService fortuneService) {
        this.fortuneService = fortuneService;
    }

    @Override
    public String getDailyWorkout(){
        return "Do 1 hour Bowling practise";
    }
    @Override
    public String getDailyFortune(){
        return fortuneService.getDailyFortune();
    }
    @Override
    public String getInformation(){
        return "Cricket -- very popular sports in ASIA, ENGLAND and Australia";
    }

    public void setFortuneService(FortuneService fortuneService) {
        this.fortuneService = fortuneService;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getTeam() {
        return team;
    }

    public void setTeam(String team) {
        this.team = team;
    }

    public void doMyStartupSteps(){
        System.out.println("doMyStartupSteps -- function called ");
    }
    public void doMyDestroySteps(){
            System.out.println("doMyDestroySteps -- function called ");
    }
}
