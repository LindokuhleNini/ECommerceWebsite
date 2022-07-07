<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="TopNavbar.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.1/css/all.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200&family=Roboto:wght@100;300;400;500;700;900&family=Sen:wght@400;700;800&display=swap" rel="stylesheet">
     <link rel="stylesheet" href="./css/main-style.css">
    <link rel="stylesheet" href="./css/products-style.css">
   
    <title>Products</title>
</head>
<body>

      <div class="main-div">

      <div class="flex-box-container">
      
      <% 
try{
   Connection con=ConnectionProvider.getCon();
    Statement st = con.createStatement ();
    ResultSet rs = st.executeQuery("select *from products where active='Yes'");
    while(rs.next())
    {
    %>
        <div id="card" class="card" style="width: 12rem;">
            <img src="./images/<%=rs.getString(5) %>" class="card-img-top" alt="...">
            <div id="cardBody" class="card-body d-flex flex-column">
              <h5 id="book-title" class="card-title"><%=rs.getString(2) %></h5>
              <p class="card-text">R<%=rs.getString(4) %></p>
              <a href="AddToCartAction.jsp?id=<%=rs.getString(1) %>" id="test" class="btn btn-primary shop-item-button mt-auto">Add to Cart</a>
            </div>
          </div>

			<%
			}
			} catch (Exception e) {
			System.out.println(e);
			}
			%>

			

      </div>
		<%@include file="footer.jsp"%>
      </div>
    
 
</body>
</html>
<%@include file="activePage.jsp"%>
