<%--
  Created by IntelliJ IDEA.
  User: Tazmeen
  Date: 7/30/2023
  Time: 4:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.shopcartapp.Product" %>
<%@ page import="com.example.shopcartapp.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.shopcartapp.OrderItem" %>
<html>
<head>
    <title>Place Order</title>
</head>
<body>
    <h1>Select the Products</h1>
    <form action="order.jsp" method="post">
        <%!
            List<OrderItem> orderItems = null;
            List<Product> productList = null;
        %>
        <%
            orderItems =(List<OrderItem>)
                    request.getAttribute("orderItemList");
            productList = (List<Product>)
                request.getAttribute("productList");
        %>
      <table>
        <tr>
            <td><label for="product">Products : </label></td>
            <td><select name="productName" id="product">

            <c:forEach var ="product" items="${productList}" >
            <option>${product.productName} -- ${product.price}</option>

            </c:forEach>
        </select></td>
        </tr>
        <tr>
            <td><label for="quantity">Quantity of Selected Product : </label></td>
            <td><input type="number" name="quantity" id="quantity" min="1" value="1"></td>
        </tr>
        <tr>
            <td><input type="submit" value="Add to Cart"></td>
            <td><input type="reset" value="cancel"></td>
        </tr>
      </table>
    </form>
<br>
<a href="index.jsp">Back to Home Page</a>
<a href="showCart.jsp">Show Cart</a>


    <%
        String productName = request.getParameter("productName");
        String strQuantity = request.getParameter("quantity");
        int quantity = Integer.parseInt(strQuantity);
        System.out.println("Quantity "+quantity);
        Product product = null;

        for (Product p: productList) {
            if (productName.equals(p.getProductName())){
                product = p;
                orderItems.add(new OrderItem(quantity,quantity*p.getPrice(),product));
            }
        }
       // request.setAttribute("list",list);
    %>

    <table border="1" width="90%">
        <tr><th>Id</th><th>Name</th><th>Price</th><th>Stock Quantity </th>
            <th>Ordered Quantity</th><th>Sub Total</th><th>Edit</th><th>Delete</th></tr>
        <%
            for (OrderItem item: orderItems) {
            //<c:forEach items="${orderItemList}" var="item">
            %><tr><td><%=item.getProduct().getProductId()%></td>
                  <td><%=item.getProduct().getProductName()%></td>
                  <td><%=item.getProduct().getPrice()%></td>
                  <td><%=item.getProduct().getQuantity()%></td>
                  <td><%=item.getQuantity()%></td>
                  <td><%=item.getSubtotal()%></td>
                <td><a href="editform.jsp?id=<%item.getItemId();%>">Edit</a></td>
                <td><a href="deleteuser.jsp?id=<%item.getItemId();%>">Delete</a></td>
              </tr>
        <% }%>
        <%--</c:forEach>--%>

    </table>
    <br/><a href="adduserform.jsp">Add New User</a>

</body>
</html>
