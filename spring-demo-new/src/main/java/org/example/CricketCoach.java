package org.example;

public class CricketCoach implements Coach{

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
}
