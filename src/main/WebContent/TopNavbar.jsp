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
    <link rel="stylesheet" href="./css/products-style.css">
</head>

<style>
.secondnav a{
      color: #333;
      padding-bottom: 10;
  }
  
  .secondnav a:is(:link, :active, :visited).active{
    color: #27b403;
}

  .navbar a:is(:link, :active, :visited).active{
    color: rgb(187, 184, 184);
    
}

#emailItem:hover{
	background-color: #333;
    color: #f2f2f2;
}

  .secondnav a:hover {
   color: #27b403;
  }
  
    .navbar a.active {
    color: #f4f4f4;
  }
  
  .cart-basket{
  width: 20px;
  height: 20px;
  top: -6px;
  right: -5px;
   border-radius: 50%;
   color: white;
  }
  
  

</style>

<body>
    
    <div class="topnav">
    <% String email = session.getAttribute("email").toString(); %>
        <div class="navbar">
           
            <ul class="nav justify-content-center">
                <li class="nav-item">
                  <a class="nav-link" href="Home.jsp">Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="ContactUs.jsp">Contact</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="AboutPage.jsp">About Us</a>
                </li>
              </ul>
              <ul class="nav justify-content-right">
              <li class="nav-item">
                  <a id="emailItem" class="nav-link" style="color: #f2f2f2"> <% out.println(email); %> <i class='fas fa-user-alt'></i></a>
                </li>
              <li class="nav-item">
                  <a class="nav-link" href="Logout.jsp">Logout</a>
                </li>
              </ul>
		</div>
       
          <div class="header" id="header">
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
                   <%
int count = 0;
try{
	
	Connection conn = ConnectionProvider.getCon();
	Statement stmnt = conn.createStatement();
	ResultSet rs2 = stmnt.executeQuery("select * from cart where email='"+email+"' and orderDate is NULL");
	while(rs2.next())
	{
		count = count+1;
	}
%>
                        <a class="nav-link d-inline-flex" href="MyCart.jsp">My Cart 
                        <span style="background-color: #27b403;" class="cart-basket d-flex align-items-center justify-content-center">
           				 <%out.println(count); %>
          				</span></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="MyOrders.jsp">My Orders</a>
                      </li>
                  </ul>
                          				       <%
} catch(Exception e){
	System.out.println(e);
}
         %>  
              </div>
      </div>

      </div>
      

     
</body>
</html>