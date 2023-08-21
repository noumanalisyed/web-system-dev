package com.example.shopcartapp;

import java.util.Random;

public class Payment {
    public static boolean processPayment(Order order)
    {
        Random random = new Random();
        return random.nextBoolean();
    }
}
