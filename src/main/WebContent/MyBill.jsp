<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.1/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/products.css">
    <link rel="stylesheet" href="./css/bill.css">
    
    <title>My Cart</title>
</head>
<body>
    
    <div class="topnav">
        <div class="navbar justify-content-center">
            <ul class="nav justify-content-center">
                <li class="nav-item">
                  <a class="nav-link active" href="Products.jsp">Products</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="Orders.jsp">Contact</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">About Us</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="Logout.jsp">Logout</a>
                </li>
              </ul>
        </div>
       
          <div class="header">
            <h1>
                <span style="color:#27b403">Mi</span>
                <span style="color:#000000">Store</span>
            </h1>
            <div class="secondnav">
                <ul class="nav justify-content-center">
                <li class="nav-item">
                      <a class="nav-link" href="Home.jsp">All Products</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="ClothesProducts.jsp">Clothes</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="ShoeProducts.jsp">Shoes</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="AccessoryProducts.jsp">Accessories</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#">My Cart</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">My Orders</a>
                      </li>
                    
                  </ul>
              </div>
      </div>

      </div>

      <div class="maindiv">
        
      <div class="flex-box-container">
      
      <%
String email = session.getAttribute("email").toString();
int total = 0;
int sno = 0;
try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select sum(total) from cart where email = '"+email+"' and status ='bill'");
	while(rs.next()){
		total =rs.getInt(1);
	}
	ResultSet rs2 = st.executeQuery("select * from users inner join cart where cart.email='"+email+"' and cart.status='bill'");
	while(rs2.next())
	{
%>

<div class="customer-details" style="float:center; width:100%;">
<h3>Online shopping Bill (MiStore)</h3>
<hr>
<div class="left-div">
<p>Name:  <%=rs2.getString(1) %>  <%=rs2.getString(2) %></p><br>
<p>Email:  <%out.println(email); %></p><br>
<p>Mobile Number:  <%=rs2.getString(4) %></p><br>
</div>

<div class="right-div-right">
<p>Payment Method:  <%=rs2.getString(16) %></p><br>
<p>Transaction Id:  <%=rs2.getString(11) %></p><br>
</div>

<div class="right-div">
<p>Address:  <%=rs2.getString(12) %></p><br>
<p>Order Date:  <%=rs2.getString(14) %></p><br>
<p>Expected Delivery:  <%=rs2.getString(15) %></p><br>
</div>
<hr>
</div>

<%break;} %>

<div class="product-details" style="width:100%;">
	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%
  ResultSet rs1 = st.executeQuery("select * from cart inner join products where cart.product_id=products.id and cart.email='"+email+"' and cart.status='bill'");
  while(rs1.next()){
	  sno = sno+1;
  
  %>
  <tr>
    <td><%out.println(sno); %></td>
    <td><%=rs1.getString(15) %></td>
    <td><%=rs1.getString(16) %></td>
    <td><%=rs1.getString(4) %></td>
    <td><%=rs1.getString(3) %></td>
     <td><%=rs1.getString(5) %></td>
  </tr>
  <tr>
<%} %>
</table>
<h3>Total: R<%out.println(total); %></h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
</div>
	

<%
}catch(Exception e){
	System.out.println(e);
}
%>
 
    </div>
     </div>

</body>
</html>