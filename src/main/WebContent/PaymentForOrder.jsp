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
    
    <title>Order Payment</title>
    <script type="text/javascript">
if (window.history.forward(1) != null)
	window.history.forward(1);
</script>
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
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs2 = st.executeQuery("select * from users where email = '"+email+"'");
	while(rs2.next()){
		
     %>
    		<form action="PaymentForOrderAction.jsp" method="post">
  <div class="form-group row">
    <label class="col-sm-3 col-form-label">Address</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" name="address" value="<%=rs2.getString(5)%>">
    </div>
  </div>
  <fieldset class="form-group">
    <div class="row">
      <legend class="col-form-label col-sm-3 pt-0">Payment Method</legend>
      <div class="col-sm-9">
         <select class="input-style form-control" name="paymentMethod">
 		<option value="Cash On Delivery(COD)">Cash On Delivery(COD)</option>
		<option value="Online Payment">Online Payment</option>
 		</select>  
      </div>
    </div>
  </fieldset>
  <div class="form-group row">
    <label for="inputText3" class="col-sm-3 col-form-label">Transaction ID</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" id="transactionId" name="transactionId">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputText3" class="col-sm-3 col-form-label">Mobile Number</label>
    <div class="col-sm-9">
      <input type="number" class="form-control" id="phoneNumber" name="phoneNumber" value="<%=rs2.getString(4)%>">
    </div>
  </div>
  <div class="form-group row">
    <div class="col">
      <button style="float:right;" type="submit" class="btn btn-primary">Proceed to Generate Bill & Save</button>
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
     </div>

</body>
</html>