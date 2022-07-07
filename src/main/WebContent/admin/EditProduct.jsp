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
    <link rel="stylesheet" href="../css/main-style.css">
    <title>Edit Product</title>
</head>
<style>
.navbar a:is(:link, :active, :visited).active{
    color: rgb(187, 184, 184);
    
}
</style>
<body>

 <div class="topnav">
    <% String email3 = session.getAttribute("email").toString(); %>
        <div class="navbar">
           
            <ul class="nav justify-content-center">
               <li class="nav-item">
                  <a class="nav-link active" href="Products.jsp">Products</a>
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
                  <a id="emailItem" class="nav-link" style="color: #f2f2f2"> <% out.println(email3); %> <i class='fas fa-user-alt'></i></a>
                </li>
              <li class="nav-item">
                  <a class="nav-link" href="../Logout.jsp">Logout</a>
                </li>
              </ul>
		</div>
        </div>
        
      <div class="maindiv">
       <div class="flex-box-container" style="margin-top:50px">
       <%
String id = request.getParameter("id");
try{
    Connection con = ConnectionProvider.getCon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from products where id ='"+id+"'");
    while(rs.next())
    {

%>

		<h3 style="padding-bottom:20px"><i class="bi bi-arrow-left-circle-fill"></i> Edit Product</h3>
		<form class="form2" action="editProductAction.jsp" method="post">
		<img src="../images/<%=rs.getString(5) %>" class="float-left" alt="..." style="width:40%; height:auto; padding-right:40px;">
  <div class="form-content" style="width:60%; float:right;">
  <div class="form-group row">
    <label class="col-sm-3 col-form-label">Product ID</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" name="id" value="<%out.println(id); %>">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputText3" class="col-sm-3 col-form-label">Name</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" id="inputName3" name="name" value="<%=rs.getString(2) %>">
    </div>
  </div>
  <fieldset class="form-group">
    <div class="row">
      <legend class="col-form-label col-sm-3 pt-0">Category</legend>
      <div class="col-sm-9">
         <select class="input-style form-control" name="category">
 		<option value="<%=rs.getString(3) %>" selected></option>
 		<option value="clothes">Clothes</option>
		<option value="shoes">Shoes</option>
		<option value="accessories">Accessories</option>
 		</select>  
      </div>
    </div>
  </fieldset>
  <div class="form-group row">
    <label for="inputText3" class="col-sm-3 col-form-label">Price</label>
    <div class="col-sm-9">
      <input type="number" class="form-control" id="inputPrice3" name="price" value="<%=rs.getString(4) %>">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputText3" class="col-sm-3 col-form-label">Image</label>
    <div class="col-sm-9">
      <input type="file" class="form-control-file" id="exampleFormControlFile1" name="image" value="<%=rs.getString(5) %>">
    </div>
  </div>
  <fieldset class="form-group">
    <div class="row">
      <legend class="col-form-label col-sm-3 pt-0">Active</legend>
      <div class="col-sm-9">
         <select class="input-style form-control" name="active" value="<%=rs.getString(6) %>">
 		<option value="yes">Yes</option>
		<option value="no">No</option>
 		</select>  
      </div>
    </div>
  </fieldset>
  
  <div class="form-group row">
   <label for="inputText3" class="col-sm-3 col-form-label"></label>
    <div class="col-sm-6">
    <div class="buttons">
      <button style="float:left; width: 80px" type="submit" class="btn btn-primary">Save</button>
      <a href="DeleteProductAction.jsp?id=<%=rs.getString(1) %>" style="float:right; width: 100px; background-color:red;" type="button" class="btn btn-primary">Delete <i class='fas fa-trash-alt'></i></a>
    </div>
    </div>
  </div>
  </div>
</form>
<%
}
}
catch(Exception e)
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