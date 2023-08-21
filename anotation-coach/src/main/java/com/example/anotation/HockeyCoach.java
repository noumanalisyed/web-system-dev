package com.example.anotation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class HockeyCoach implements Coach {

    @Autowired
    private FortuneService fortuneService;
    @Override
    public String getDailyWorkout() {
        return "HockeyCoach -- Do Running practise for 1 hour daily.";
    }

    public void display(){
        System.out.println(getDailyWorkout()+"\n\n"+fortuneService.getDailyFortune());
    }
}
