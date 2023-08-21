<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.TreeSet"%>
<%@page import="java.util.Iterator"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.BTParameterStrategyMaintenanceDetails"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.example.shopcartapp.Product" %>

<script>
  function getCListt(val) {
    alert(val);
  }
</script>



<script>
  function OpenClose(obj) {
    HeadObj = eval(obj + "_Head");
    BodyObj = eval(obj + "_Body");

    if (BodyObj.style.display=='block') {
      BodyObj.style.display='none';
      SignOffset = HeadObj.innerHTML.indexOf("-");
      HeadObj.innerHTML = "+" + HeadObj.innerHTML.substring(SignOffset+1);
    } else {
      BodyObj.style.display='block';
      SignOffset = HeadObj.innerHTML.indexOf("+");
      HeadObj.innerHTML = "-" + HeadObj.innerHTML.substring(SignOffset+1);
    }
  }
</script>

<script type="text/javascript">
  function GetSelectedTextValue(ddlFruits) {
    var selectedText = ddlFruits.options[ddlFruits.selectedIndex].innerHTML;
    var selectedValue = ddlFruits.value;

    alert("Selected Text: " + selectedText + " Value: " + selectedValue);
  }
</script>




<%
  //HttpSession session = request.getSession();
  List<Product> sampleProductList = (List<Product>) session.getAttribute("productList");
  System.out.println("number of records to be displayed : " + sampleProductList.size());

%>
<form action="/getChanges" >

  <%for(int i=0;i<sampleProductList.size();i++){
    String id = "ClickMe"+i+"_Head";
    String id1 = "ClickMe"+i+"_Body";
    String onClick = "ClickMe"+i ;
  %>

  <div  id="<%= id %>" onClick="OpenClose('<%= onClick %>')" onMouseOver="this.style.cursor='pointer';" style="color: #000099;">
    <button>
      Product Category <%= i %>
    </button>
  </div>


  <%List<Product> ListIterator = (List<Product>) sampleProductList.get(i);
    System.out.println("ListIteartor :: "+ListIterator.size());
    System.out.println("**********");%>
  <div id="<%= id1 %>" style="display:none; margin-left:20px"><table>

    <tr>
      <th>Risk Category</th>
      <th>Channel Description</th>
      <th>Bureau Level Description</th>
      <th>Champion Strategy</th>
      <th>Challenger Strategy</th>
      <th>S2PC</th>
    </tr>
    <%
      for(int j=0;j<ListIterator.size();j++){

        //BTParameterStrategyMaintenanceDetails bean = (BTParameterStrategyMaintenanceDetails)ListIterator.get(j);
        Product bean = (Product) ListIterator.get(j);

        ArrayList updatedList = new ArrayList();%>

    <tr>
      <td align = "left"><%= bean.getPrice() %></td>
      <td align = "left"><%= bean.getQuantity() %></td>
      <td align = "left"><%= bean.getProductName() %></td>
      <td align = "left"><select name="champDesc" id="champDesc" onchange=updatedList.add(bean) >

        <%System.out.println("updated list size :: "+ updatedList.size()); %>

      <%--  <%if (bean.getProductName() != null) {
          for(int s=1;s<10;s++){

            if(bean.getProductId().equals(Integer.toString(s))){

        %>--%>

        <option value="<%=bean.getProductName()%>"  selected="selected" > Champion Strategy <%=bean.getProductId()%> </option>
        <%}else{

        %>
        <option value="<%= bean.getProductName() %>">Product Name <%=s %></option>
        <%}
        }
        }%>



      </select></td>
     /* <td align = "left"><select name="clngrDesc" id="clngrDesc">
        <%if (bean.getChallengerDesc()!= null) {
          for(int s=1;s<10;s++){

            if(bean.getChallengerValue().equals(Integer.toString(s))){%>
        <option value="<%=bean.getChallengerValue() %>" selected="selected"> Challenger Strategy <%=bean.getChallengerValue() %> </option>
        <%}else{

        %>
        <option value="<%= s %>">Challenger Strategy <%=s %></option>
        <%}
        }
        }
        %>
      </select>
      </td>*/
    /*  <td align = "left">
        <select name="s2pc" id="s2pc">
          <%if (bean.getS2pc()!= null) {
            for(int s=0;s<101;s++){

              if(bean.getS2pc().equals(Integer.toString(s))){%>
          <option value="<%=bean.getS2pc() %>" selected="selected"> <%=bean.getS2pc() %> </option>
          <%}else{

          %>
          <option value="<%= s %>"><%=s %></option>
          <%}
          }
          }
          %>
        </select>
      </td>*/

    </tr>


    <%} %>
  </table></div>
  <% }
    session1.setAttribute("checkList",sampleProductList);
    ArrayList checkList = (ArrayList) session.getAttribute("checkList");
    System.out.println("checkList size :: "+checkList.size());
  %>

  <input class="DataEntryButton" name="submit_button" type="submit" value="Submit" />


</form>

