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
    <link rel="stylesheet" href="../css/products-style.css">
</head>

<body>
    
    <div class="topnav">
    <% String email = session.getAttribute("email").toString(); %>
        <div class="navbar">
           
            <ul class="nav justify-content-center">
               <li class="nav-item">
                  <a class="nav-link" href="Products.jsp">Products</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="OrdersRecieved.jsp">Orders</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="Messages.jsp">Messages</a>
                </li>
              </ul>
              <ul class="nav justify-content-right">
              <li class="nav-item">
                  <a id="emailItem" class="nav-link" style="color: #f2f2f2"> <% out.println(email); %> <i class='fas fa-user-alt'></i></a>
                </li>
              <li class="nav-item">
                  <a class="nav-link" href="../Logout.jsp">Logout</a>
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
                      <a class="nav-link" href="Products.jsp">All Products</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="ClothesCategory.jsp">Clothes</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="ShoesCategory.jsp">Shoes</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="AccessoriesCategory.jsp">Accessories</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="NewProduct.jsp">Add New Product</a>
                    </li>
                    
                  </ul>
              </div>

      </div>
      </div>
      

     
</body>
</html>
