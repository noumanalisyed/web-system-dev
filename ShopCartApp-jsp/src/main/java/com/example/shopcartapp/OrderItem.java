package com.example.shopcartapp;

public class OrderItem {
    private int itemId;
    private int quantity;
    private double subtotal;
    private double price;
    private Product product;

    public OrderItem() {
    }

    public OrderItem(int itemId, int quantity, double subtotal, double price, Product product) {
        this.itemId = itemId;
        this.quantity = quantity;
        this.subtotal = subtotal;
        this.price = price;
        this.product = product;
    }

    public OrderItem(int quantity, double subtotal, double price, Product product) {
        this.quantity = quantity;
        this.subtotal = subtotal;
        this.price = price;
        this.product = product;
    }

    public OrderItem(int quantity, double price, Product product) {
        this.quantity = quantity;
        this.subtotal = quantity * price;
        this.price = price;
        this.product = product;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "itemId=" + itemId +
                ", quantity=" + quantity +
                ", subtotal=" + subtotal +
                ", price=" + price +
                ", product=" + product +
                '}';
    }
}
