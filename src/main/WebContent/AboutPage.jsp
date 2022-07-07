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
    
    <title>Home</title>
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
       
          <div class="header" style="height:200px">
            <h1>
                <span style="color:#27b403">About</span>
                <span style="color:#000000">Us</span>
            </h1>
            <p style="padding:0 250px; text-align:center">Founded in June of 2022 and based in Cape Town, South Africa. MiStore is a trusted online marketplace for people 
            to shop the most trendy outfits and accessories.</p>
            
      </div>

      </div>

      <div class="main-div">
    
      <div class="flex-box-container" style="flex-direction: column; padding:50px 350px; margin-top: 290px;">
     
			<h2 style="text-align:center">Team</h2>
			<div class="column" style="text-align:center;">
    <div class="card" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.4); width:100%;">
      <div class="container">
      <img src="./images/my-picture.jpg" alt="Lindokuhle" style="width:30%;border-radius: 50%;">
        <h2>Lindokuhle Nini</h2>
        <p class="title">CEO & Founder</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>liindokuhlenini@gmail.com</p>
        <p><button class="button">Contact</button></p>
      </div>
  </div>
  </div>

      </div>
		<%@include file="footer.jsp"%>

      </div>
    
     
</body>
</html>
<%@include file="activePage.jsp"%>