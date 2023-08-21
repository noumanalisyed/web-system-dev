package com.example.anotation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.SQLOutput;

@Component
public class CricketCoach implements Coach {

    @Autowired
    private FortuneService fortuneService;
    @Override
    public String getDailyWorkout() {
        return "CricketCoach -- Do Bowling practise for 1 hour daily.";
    }

    public void display(){
        System.out.println(getDailyWorkout()+"\n\n"+fortuneService.getDailyFortune());
    }
}
