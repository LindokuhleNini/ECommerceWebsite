<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Sign Up</title>
  <link rel="stylesheet" href="./css/style.css">

</head>
<body>
<html lang="en">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  </head>

<body>
<div id="form">
  <div class="container">
    <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-md-8 col-md-offset-2">
      <div id="userform">
        <ul class="nav nav-tabs nav-justified" role="tablist">
          <li class="active"><a href="#login"  role="tab" data-toggle="tab">Login</a></li>
          <li><a href="#signup"  role="tab" data-toggle="tab">Sign Up</a></li>
        </ul>
        <div class="tab-content">
        
        <div class="tab-pane fade active in" id="login">
            <h2 class="text-uppercase text-center"> Log in</h2>
            <form id="submitForm" action="LoginAction.jsp" method="post" >
              <div class="form-group">
                <input type="email" class="form-control" id="email" name="email" required placeholder="Your Email" autocomplete="off">
                <p class="help-block text-danger"></p>
              </div>
              <div class="form-group">
                <input type="password" class="form-control" id="password" name="password" required placeholder="Password" autocomplete="off">
                <p class="help-block text-danger"></p>
              </div>
              <div class="mrgn-30-top">
                <button type="submit" class="btn btn-larger btn-block"/>
                Log in
                </button>
              </div>
            </form>
          </div>
          <div class="tab-pane fade in" id="signup">
            <h2 class="text-uppercase text-center"> Create Account</h2>
            <form id="signup" action="SignupAction.jsp" method="post">
              <div class="row">
                <div class="col-xs-12 col-sm-6">
                  <div class="form-group">
                    <input type="text" class="form-control" id="first_name" name="firstName" required placeholder="Your  first name." autocomplete="off">
                    <p class="help-block text-danger"></p>
                  </div>
                </div>
                <div class="col-xs-12 col-sm-6">
                  <div class="form-group">
                    <input type="text" class="form-control" id="last_name" name="lastName" required placeholder="Your last name." autocomplete="off">
                    <p class="help-block text-danger"></p>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <input type="email" class="form-control" id="email" name="email" required placeholder="Your email address." autocomplete="off">
                <p class="help-block text-danger"></p>
              </div>
              <div class="form-group">
                <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" required placeholder="Your phone number." autocomplete="off">
                <p class="help-block text-danger"></p>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" id="address" name="address" required placeholder="Your address." autocomplete="off">
                <p class="help-block text-danger"></p>
              </div>
              <div class="form-group">
                <input type="password" class="form-control" id="password" name="password" required placeholder="Your password" autocomplete="off">
                <p class="help-block text-danger"></p>
              </div>
              <div class="mrgn-30-top">
                <button type="submit" class="btn btn-larger btn-block"/>
                Sign up
                </button>
              </div>
            </form>
          </div>
          
        </div>
      </div>
    </div>
  </div>
  <!-- /.container --> 
</div>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
<!-- partial -->


</body>
</html>
