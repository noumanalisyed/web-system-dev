<%--
  Created by IntelliJ IDEA.
  User: Tazmeen
  Date: 7/30/2023
  Time: 4:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.shopcartapp.Product" %>
<%@ page import="com.example.shopcartapp.Order" %>
<html>
<head>
    <title>Payment</title>
</head>
<body>
    <%
        Order order = (Order) session.getAttribute("order");
        if (order == null || order.getProductsOrdered().isEmpty())
        {
    %>
    <h2>There are no items in your cart. Please select your products.</h2>
    <%
        }
        else{
            double orderTotal = order.OrderTotal();
            boolean billProcess = false;
            if (request.getMethod().equals("POST"))
            {
                double payAmount = 0.0;
                boolean isValidAmount = true;
                String paymentAmountString = request.getParameter("paymentAmount");
                if (paymentAmountString != null && !paymentAmountString.isEmpty()) {
                    try {
                        payAmount = Double.parseDouble(paymentAmountString);
                        isValidAmount = true;
                    }
                    catch (NumberFormatException e) {
                        isValidAmount = false;
                    }
                }
                else {
                    isValidAmount = false;
                }

                if (isValidAmount) {
                    if (payAmount >= orderTotal)
                    {
                        boolean paymentStatus = Payments.processPayment(order);
                        if (paymentStatus)
                        {
                            // Payment successful, print receipt
                            billProcess = true;

    %>
            <h1>Payment Successful!</h1>
            <h2>Order Briefs</h2>
            <p>User: <%= order.getUserName() %></p>
            <p>Total: $<%= orderTotal %></p>
            <p>Payment Amount: $<%= payAmount %></p>
    <%
                        double overdue = payAmount - orderTotal;
                            if (overdue > 0)
                            {
    %>

    <p>Change: Rs.<%= overdue %></p>
    <%
                            }
    %>
    <p>Products:</p>
    <ul>
        <%
                        String name = null;
                            for (Product productOrdered : order.getProductsOrdered())
                            {
                                name = productOrdered.getProductName();
        %>
        <li><%=name %>: <%= productOrdered.getQuantity()%></li>
        <%
                            }
        %>
    </ul>
    <%
                        session.removeAttribute("order"); // Clear the cart after successful payment
                    }
                        else {
    %>

    <h2>Payment Failed!</h2>
    <%
                        }
                    }
                        else {
    %>
    <h2>Insufficient Payment Amount!</h2>
    <%
                            }
                }
                    else {
    %>
    <h2>Please Enter a Valid Payment Amount</h2>
    <%
                    }
            }
        // paymentnot been processed
        if (!billProcess) {
    %>
    <h1>Total Amount: $<%= orderTotal %></h1>
    <h1>Enter Payment Amount:</h1>
    <form action="Payments.jsp" method="post">
        <input type="number" name="payAmount" step="0.01" required>
        <input type="submit" value="PayAmount">
    </form>
    <%
            }
        }
    %>
</body>
</html>
