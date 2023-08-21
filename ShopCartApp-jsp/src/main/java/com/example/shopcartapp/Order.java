package com.example.shopcartapp;

import java.util.ArrayList;
import java.util.List;

public class Order {

    private String userName;
    private List<OrderItem> itemList;

    public Order(String userName) {
        this.userName = userName;
        this.itemList = new ArrayList<>();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public List<OrderItem> getItemList() {
        return itemList;
    }

    public void setItemList(List<OrderItem> pItemList) {
        this.itemList = pItemList;
    }

    public void addItem(OrderItem item){
        itemList.add(item);
    }
    public double OrderTotal()
    {
        double total = 0.0;
        for (OrderItem item : itemList) {
            total += item.getSubtotal();
        }
        return total;
    }
}
