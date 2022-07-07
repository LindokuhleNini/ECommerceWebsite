<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="TopNavbar.jsp"%>
<%@include file="activePage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.1/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/products-style.css">
    <link rel="stylesheet" href="./css/main-style.css">
    <title>My Cart</title>
</head>
<body>
      <div class="main-div">
        
      <div class="flex-box-container">
      
      <table class="table">
      
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Product Name</th>
      <th scope="col">Price</th>
      <th scope="col">QTY</th>
      <th scope="col">Total</th>
      <th scope="col">Remove</th>
    </tr>
  </thead>
  
   
  <tbody>
    <%

int total = 0;
int sno = 0;
String email4 = session.getAttribute("email").toString();
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs1 = st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");	
	while(rs1.next()){
		total = rs1.getInt(1);
	}

		ResultSet rs = st.executeQuery("select *from products inner join cart on products.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
		while(rs.next())
		{
		%>
    <tr>
      <th><img class="imgs" src="./images/<%=rs.getString(5) %>" style="width:auto; height:160px; float:center;"/></th>
      <td><p><%=rs.getString(2) %></p></td>
      <td>R<%=rs.getString(4) %></td>
      <td><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1) %>&quantity=inc"><i class='fas fa-plus-circle'></i></a><%=rs.getString(9) %> <a href="incDecQuantityAction.jsp?id=<%=rs.getString(1) %>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
      <td>R<%=rs.getString(11) %></td>
      <td> <a href="removeFromCart.jsp?id=<%= rs.getString(1) %>">Remove <i class='fas fa-trash-alt'></i></a></td>
    </tr>
    
      
        <%
		}
		%>
	<tr>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<th scope="col" style="background-color: #27b403; color:white;">Total: R<i class="fa fa-inr"></i><% out.println(total); %></th> 
	<% if(total>0){ %><th scope="col"><a href="PaymentForOrder.jsp">Proceed to order</a></th><%} %>

	</tr>
<%
}
catch(Exception e)
{
	
}
	%>   
   
  </tbody>
</table>
 
    </div>
    <%@include file="footer.jsp"%>
     </div>

</body>
</html>