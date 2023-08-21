<%@ page import="java.util.List" %>
<%@ page import="com.example.shopcartapp.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.shopcartapp.OrderItem" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Shopping Cart</title>
</head>
<body>
<h1>Welcome to Shopping Cart</h1>
<ul>
    <%!
        Product products[] ={new Product(100,"Coke",500,80)
                ,new Product(101,"Pepsi",600,80)
                ,new Product(102,"Nestle Milkpak",100,230)
                ,new Product(103,"Dawn Bread",50,220)};
        List<Product> productList = new ArrayList<Product>();
        List<OrderItem> orderItems = new ArrayList<OrderItem>();
        public void loadProducts(){
            for (Product p: products) {
                System.out.println(p);
                productList.add(p);
            }
        }

    %>
    <%
        loadProducts();
        request.setAttribute("productList",productList);
        request.setAttribute("orderItemList",orderItems);
    %>
    <li><a href="order.jsp">Order Product</a></li>
    <li><a href="showCart.jsp">Show Cart</a></li>
    <li><a href="Payments.jsp">Do Payments</a></li>
    <li><a href="orderStatus.jsp">Order Status</a></li>
    <li><a href="order_item.jsp">Order Item</a></li>
</ul>
</body>
</html>
