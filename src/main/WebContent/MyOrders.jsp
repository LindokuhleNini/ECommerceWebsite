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
      <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">category</th>
            <th scope="col"><i class="fa fa-inr"></i>  Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">Status</th>
    </tr>
  </thead>
  
   
  <tbody>
  <%
int sno = 0;
  String email4 = session.getAttribute("email").toString();
try{
	
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from cart inner join products where cart.product_id=products.id and cart.email='"+email+"' and cart.orderDate is not NULL");
	while(rs.next())
	{
		sno = sno+1;
%>
     <tr>
            <td><%out.println(sno); %></td>
            <td><%=rs.getString(15) %></td>
            <td><%=rs.getString(16) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(4) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"><%=rs.getString(5) %></i> </td>
             <td><%=rs.getString(8) %></td>
              <td><%=rs.getString(9) %></td>
               <td><%=rs.getString(10) %></td>
               <td style="color: #27b403"><%=rs.getString(12) %></td>
            </tr>
    
       <%
	}
} catch(Exception e){
	System.out.println(e);
}
         %>  
   
  </tbody>
</table>
 
    </div>
    	<%@include file="footer.jsp"%>
     </div>

</body>
</html>