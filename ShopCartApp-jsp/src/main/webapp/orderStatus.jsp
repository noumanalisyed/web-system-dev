<%--
  Created by IntelliJ IDEA.
  User: Tazmeen
  Date: 7/30/2023
  Time: 4:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.shopcartapp.Product" %>
<%@ page import="com.example.shopcartapp.Order" %>
<html>
<head>
    <title>Check Order Status</title>
</head>
<body>
    <h1>Your Order Status</h1>
    <%
        Order order = (Order) session.getAttribute("order");
        if (order == null || order.getProductsOrdered().isEmpty()) {
            out.println("There are no items in your cart.");
        }
        else {
    %>
    <p>User: <%= order.getUserName() %></p>
    <p>Total: $<%= order.OrderTotal() %></p>
    <p>Products:</p>
    <ul>
        <%
            String name = null;
            int quantity = 0;
            for (Product productOrdered : order.getProductsOrdered()) {
                name = productOrdered.getProductName();
                quantity = productOrdered.getQuantity();
        %>
        <li><li><%=name%>: <%=quantity%></li>
        <% } %>
    </ul>
    <% } %>

    <a href="index.jsp">Back to Home Page</a>
    <a href="Payments.jsp">Proceed to Payment</a>
</body>
</html>
