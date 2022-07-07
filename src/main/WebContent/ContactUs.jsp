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
    <link rel="stylesheet" href="./css/main-style.css">
    <title>Contact Us</title>
</head>
<style>
 #emailItem:hover{
	background-color: #333;
    color: #f2f2f2;
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
 
          <div class="header">
          <% 
          int msg_id=1;
try{
	 String sender_email = session.getAttribute("email").toString();
   Connection con=ConnectionProvider.getCon();
    Statement st = con.createStatement ();
    ResultSet rs = st.executeQuery("select *from users where email='"+sender_email+"'");
    while(rs.next())
    {
    %>
          <h3 style="text-align: center; font-size: 20px; font-type:plain">Hi <%=rs.getString(1) %>! Have a query?</h3>
          <%} %>
            <h1>
                <span style="color:#27b403">Contact</span>
                <span style="color:#000000">Us</span>
            </h1>
            <div class="secondnav">
             <ul class="nav justify-content-center">
                <li class="nav-item">
                      <a class="nav-link" href=""></a>
                    </li>
                  </ul>
            </div>
      </div>
      </div>

      <div class="main-div">
        

      <div class="flex-box-container">
      <%
      ResultSet rs2=st.executeQuery("select max(msg_id) from messages");
      while(rs2.next ())
       {
            msg_id=rs2.getInt(1);
            msg_id=msg_id+1;
       }
      %>
      <form action="SendMessageAction.jsp?msg_id=<%=msg_id %>" method="post">
      <div class="form-group">
    <label class="col-form-label">Subject</label>
    <textarea style="width:600px;" class="form-control" id="subject" name="subject" required></textarea>
  </div>
      <div class="form-group">
    <label class="col-form-label">Your Message</label>
    <textarea style="width:600px; height:250px" class="form-control" id="message" name="message" required></textarea>
    <button style="float:left; width: 80px" type="submit" class="btn btn-primary">Send</button>
  </div>
      </form>
      
       </div>
		<%@include file="footer.jsp"%>
      </div>

<%
    
    }
  	catch (Exception e) 
  		{
		System.out.println(e);
	}

			%>
      
</body>
</html>
<%@include file="activePage.jsp"%>
