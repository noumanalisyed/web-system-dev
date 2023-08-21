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
<%@ page import="com.example.shopcartapp.OrderItem" %>
<html>
<head>
    <title>Your Cart</title>
</head>
<body>
    <h1>---Your Cart---</h1>
    <%
        Order order = (Order) session.getAttribute("order");
        if (order == null || order.getItemList().isEmpty()) {
    %>
    <p1>There are no items in your cart. Please select your products.</p1>

    <%
    } else {
    %>
    <ul>
        <%
            String name = null;
            int quantity = 0;
            for (OrderItem productOrdered : order.getItemList()) {
                name = productOrdered.getProduct().getProductName();
                quantity = productOrdered.getQuantity();
        %>
        <br>
        <li><%=name%>: <%=quantity%> (Price: $<%=productOrdered.getPrice()%>)</li>
        <%
            }
        %>
    </ul>

    <p>Total: $<%= order.OrderTotal() %></p>
    <%
        }
    %>
    <p><a href="order.jsp">Go Back to Order</a></p>
    <br>
    <a href="index.jsp">Back to Home Page</a>
    <br>
    <a href="Payments.jsp">Proceed to Payment</a>

</body>
</html>
