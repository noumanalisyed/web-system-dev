package com.example.anotation;

import org.springframework.stereotype.Component;

@Component
public class SadFortuneService implements FortuneService {
    @Override
    public String getDailyFortune() {
        return "SadFortuneService -- Today is your Un-Lucky day !!!";
    }
}
