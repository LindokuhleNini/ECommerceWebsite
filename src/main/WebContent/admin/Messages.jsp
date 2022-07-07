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
    <link rel="stylesheet" href="../css/products.css">
    <title>All Products</title>
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
        </div>

      <div class="msg-div">
      <div class="flex-box-container3">
       
      <% 
try{
	String msg_id = request.getParameter("msg_id");
   Connection con=ConnectionProvider.getCon();
    Statement st = con.createStatement ();
    ResultSet rs = st.executeQuery("select *from messages");
    while(rs.next())
    {
    %>
      <div class="card border-primary mb-3 w-100" style="height:auto;">
  	<div class="card-body text-left">
    <h5 class="card-title"><%=rs.getString(3) %></h5>
    <h6 class="card-subtitle mb-2 text-muted"><%=rs.getString(2) %></h6>
    <p class="card-text"><%=rs.getString(4) %></p>
     <a href="" class="card-link">Reply <i class="fa fa-reply" aria-hidden="true"></i></a>
    <a href="DeleteMessageAction.jsp?msg_id=<%=rs.getString(1) %>" class="card-link">Delete <i class='fas fa-trash-alt'></i></a>
  </div>
  </div>
  <%
	}
    
    }
  	catch (Exception e) 
  		{
		System.out.println(e);
	}

			%>
 
</div>
    <%@include file="/footer.jsp"%>
   </div>
    
     
</body>
</html>
<%@include file="/activePage.jsp"%>
