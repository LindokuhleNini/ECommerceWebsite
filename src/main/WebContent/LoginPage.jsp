<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="./css/login.css">
</head>
<body>

 <h1>
   <span style="color:#27b403; font-size: 36px;">Mi</span>
   <span style="color:#000000; font-size: 36px;">Store</span>
 </h1>
<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form action="SignupAction.jsp" method="post">
			<h1>Create Account</h1>
			<input type="text" name="firstName" placeholder="First name" required />
			<input type="text" name="lastName" placeholder="Last name" required />
			<input type="email" name="email" placeholder="Email" required />
			<input type="number" name="phoneNumber" placeholder="Mobile number" required />
			<input type="text" name="address" placeholder="Address" required />
			<input type="password" name="password" placeholder="Password" required />
			<button type="submit">Sign Up</button>
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action="LoginAction.jsp" method="post">
			<h1>Sign in</h1>
			<span>or use your account</span>
			<input type="email" name="email" placeholder="Email" />
			<input type="password" name="password" placeholder="Password" />
			<button type="submit">Sign In</button>
			<%
         	String msg = request.getParameter("msg");
             if("accountNotFound".equals(msg)){
              %>	
              <p class="small-xl pt-3 text-center" style="color:white">*Incorrect email or password</p>
             <% }%>
             
             <%
             if("invalid".equals(msg)){
              %>	
              <p class="small-xl pt-3 text-center" style="color:white">*Something went wrong. Please try again.</p>
             <% }%>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Welcome Back!</h1>
				<p>To keep connected with us please login with your personal info</p>
				<button class="ghost" id="signIn">Sign In</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Hello, Friend!</h1>
				<p>Enter your personal details and start shopping with us</p>
				<button class="ghost" id="signUp">Sign Up</button>
			</div>
		</div>
	</div>
</div>

<footer>
	<p>
		Created with <i class="fa fa-heart"></i> by
		<a target="_blank" href="https://florin-pop.com">Florin Pop</a>
		- Read how I created this and how you can join the challenge
		<a target="_blank" href="https://www.florin-pop.com/blog/2019/03/double-slider-sign-in-up-form/">here</a>.
	</p>
</footer>

<script>
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});
</script>
</body>
</html>