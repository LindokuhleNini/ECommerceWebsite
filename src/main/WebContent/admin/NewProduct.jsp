<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="AdminTopNavbar.jsp"%>
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
    <title>Home</title>
</head>
<body>
    <%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Product Added Successfully!</h3>
<% } %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Something went wrong! Try Again</h3>
<% } %>

<%
int id=1;
try
{
    Connection con=ConnectionProvider.getCon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select max(id) from products");
   while(rs.next ())
    {
         id=rs.getInt(1);
         id=id+1;
    }
}
	catch(Exception e)
{}
%>
  
      <div class="main-div">
       <div class="flex-box-container">
		<form action="NewProductAction.jsp" method="post">
  <div class="form-group row">
    <label class="col-sm-3 col-form-label">Product ID</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" name="id" value="<%out.println(id); %>">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputText3" class="col-sm-3 col-form-label">Name</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" id="inputName3" name="name" placeholder="Name">
    </div>
  </div>
  <fieldset class="form-group">
    <div class="row">
      <legend class="col-form-label col-sm-3 pt-0">Category</legend>
      <div class="col-sm-9">
         <select class="input-style form-control" name="category">
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
      <input type="number" class="form-control" id="inputPrice3" name="price" placeholder="Price">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputText3" class="col-sm-3 col-form-label">Image</label>
    <div class="col-sm-9">
      <input type="file" class="form-control-file" id="exampleFormControlFile1" name="image">
    </div>
  </div>
  <fieldset class="form-group">
    <div class="row">
      <legend class="col-form-label col-sm-3 pt-0">Active</legend>
      <div class="col-sm-9">
         <select class="input-style form-control" name="active">
 		<option value="yes">Yes</option>
		<option value="no">No</option>
 		</select>  
      </div>
    </div>
  </fieldset>
  
  <div class="form-group row">
    <div class="col-sm-6">
      <button style="float:right; width: 80px" type="submit" class="btn btn-primary">Save</button>
    </div>
  </div>
</form>
</div>
<%@include file="/footer.jsp"%>
    </div>
     
</body>
</html>
<%@include file="/activePage.jsp"%>