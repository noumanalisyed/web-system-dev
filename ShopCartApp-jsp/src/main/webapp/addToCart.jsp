<%--
  Created by IntelliJ IDEA.
  User: Tazmeen
  Date: 7/30/2023
  Time: 5:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.shopcartapp.Product" %>
<%@ page import="com.example.shopcartapp.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.shopcartapp.OrderItem" %>
<html>
<head>
    <title>Processing...</title>
</head>
<body>
<%
        List<Product> productList = (List<Product>) session.getAttribute("productList");

        String productName= request.getParameter("productName");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = 0.0;
        Order order = (Order) session.getAttribute("order");
        if (order == null) {
            order = new Order("User");
        }

        for (Product  product : productList ) {
            if(productName.equals(product.getProductName())) {
                OrderItem orderItem = new OrderItem(quantity,price,product);
                order.addItem(orderItem);
            }
        }
        session.setAttribute("order", order);
        response.sendRedirect("order.jsp");
    %>
</body>
</html>
