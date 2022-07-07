<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
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
    <link rel="stylesheet" href="./css/cart-style.css">
    <title>Accessories</title>
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
                        <a class="nav-link" href="#">My Cart</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link active" href="#">My Orders</a>
                      </li>
                    
                  </ul>
              </div>
      </div>

      </div>

      <div class="maindiv">
        

      <div class="flex-box-container">
      
   <div class="table">
   
      
      <div class="layout-inline row th">
        <div class="col col-pro">Product</div>
        <div class="col col-price align-center "> 
          Price
        </div>
        <div class="col col-qty align-center">QTY</div>
        <div class="col">Total</div>
        <div class="col">REMOVE</div>
      </div>
      
      <%

int total = 0;
int sno = 0;
String email = session.getAttribute("email").toString();
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
      
      <div class="layout-inline row">
        
        <div class="col col-pro" style="white-space:nowrap; word-wrap: break-word">
          <img class="imgs" src="./images/<%=rs.getString(5) %>" style="width:100px; height:130px; float:left;"/>
          <p id="p-name" style="overflow-wrap: break-word; width=10px;"><%=rs.getString(2) %></p>
        </div>
        
        <div class="col col-price col-numeric align-center ">
          <p><%=rs.getString(4) %></p>
        </div>

        <div class="col col-qty layout-inline">
          <a href="#" class="qty qty-minus">-</a>
            <input type="numeric" value="3" />
          <a href="#" class="qty qty-plus">+</a>
        </div>
        
        <div class="col col-total col-numeric">               
        <p> <%=rs.getString(10) %></p>
        </div>
        
        <div class="col col-pro layout-inline  remove">               
        <p>Remove <i class='fas fa-trash-alt'></i></th>
        </div>
      </div>
  
       <div class="tf"> 
          <div class="row layout-inline">
           <div class="col">
             <p></i><% out.println(total); %></p>
           </div>
           <div class="col"></div>
         </div>
       </div>         
  </div>

  <% if(total>0){ %><a href="addressPaymentForOrder.jsp" class="btn btn-update">Proceed to order</a><%} %>
			
 <%
		}

}
catch(Exception e)
{
	
}
	%>
      </div>

      </div>
    
     
</body>
</html>