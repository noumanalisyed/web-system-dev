package org.example;

import java.util.Random;

public class RandomFortuneService implements FortuneService{

    String strMessages [] = {
            "A",
            "B",
            "C",
            "D",
            "E",
            "F"
    };

    private int getRandomIndex(){
        return new Random().nextInt(6);
    }
    @Override
    public String getDailyFortune() {
        return "RandomFortuneService -- "+strMessages[getRandomIndex()];
    }
}
