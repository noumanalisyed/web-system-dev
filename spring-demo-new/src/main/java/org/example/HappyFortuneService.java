package org.example;

public class HappyFortuneService implements FortuneService{
    @Override
    public String getDailyFortune() {
        return "HappyFortuneService -- Today is your lucky day !!!";
    }
}
