<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    
 <!DOCTYPE html>
<html lang="en">
<head>
<title>Popup Login and Register</title>
 <script src="<c:url value="/resources/js/jquery-1.11.0.min.js" />"></script>
 <script src="<c:url value='/resources/js/jquery.leanModal.min.js' />"></script>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/normalize.css" />" rel="stylesheet">
</head>
<body>

   <c:if test="${not empty error}">
        <div class="errorblock">
           Your login was unsuccessful. <br />
           Caused: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
        </div>
    </c:if>
    
<div class="container">

	
    
	<a id="modal_trigger" href="#modal" class="btn">Click here to Login or register</a>

	<div id="modal" class="popupContainer" style="display:none;">
		<header class="popupHeader">
			<span class="header_title">Login</span>
			<span class="modal_close"><i class="fa fa-times"></i></span>
		</header>
		
		<section class="popupBody">
			<!-- Social Login -->
			<div class="social_login">
				<div class="">
					<a href="#" class="social_box fb">
						<span class="icon"><i class="fa fa-facebook"></i></span>
						<span class="icon_title">Connect with Facebook</span>
						
					</a>

					<a href="#" class="social_box google">
						<span class="icon"><i class="fa fa-google-plus"></i></span>
						<span class="icon_title">Connect with Google</span>
					</a>
				</div>

				<div class="centeredText">
					<span>Or use your Email address</span>
				</div>

				<div class="action_btns">
					<div class="one_half"><a href="#" id="login_form" class="btn">Login</a></div>
					<div class="one_half last"><a href="#" id="register_form" class="btn">Sign up</a></div>
				</div>
			</div>
			
			

			<!-- Username & Password Login form -->
			<div class="user_login">
				<form name='f' action='/Firesoftblog/login' method='POST' id="ff">
				
			       
				
					<label>Email / Username</label>
					<input type="text" name='username' value=''/>
					<br />

					<label>Password</label>
					<input type="password" name='password' />
					<br />

					<div class="checkbox">
						<input id="remember" type="checkbox" />
						<label for="remember">Remember me on this computer</label>
					</div>

					<div class="action_btns">
						<div class="one_half"><a href="#" class="btn back_btn"><i class="fa fa-angle-double-left"></i> Back</a></div>
						<div class="one_half last">
						<a class="btn btn_red" href="javascript: submitForm();">Login</a></div>
					</div>
					<sec:csrfInput/>
				</form>
				
				<script>
function submitForm(){
	
    $('#ff').submit();
}
</script>
				

				<a href="#" class="forgot_password">Forgot password?</a>
			</div>

			<!-- Register Form -->
			<div class="user_register">
				<form>
					<label>Full Name</label>
					<input type="text" />
					<br />

					<label>Email Address</label>
					<input type="email" />
					<br />

					<label>Password</label>
					<input type="password" />
					<br />

					<div class="checkbox">
						<input id="send_updates" type="checkbox" />
						<label for="send_updates">Send me occasional email updates</label>
					</div>

					<div class="action_btns">
						<div class="one_half"><a href="#" class="btn back_btn"><i class="fa fa-angle-double-left"></i> Back</a></div>
						<div class="one_half last"><a href="#" class="btn btn_red">Register</a></div>
					</div>
				</form>
			</div>
		</section>
	</div>
</div>

<script type="text/javascript">
	$("#modal_trigger").leanModal({top : 200, overlay : 0.6, closeButton: ".modal_close" });

	$(function(){
		// Calling Login Form
		$("#login_form").click(function(){
			$(".social_login").hide();
			$(".user_login").show();
			return false;
		});

		// Calling Register Form
		$("#register_form").click(function(){
			$(".social_login").hide();
			$(".user_register").show();
			$(".header_title").text('Register');
			return false;
		});

		// Going back to Social Forms
		$(".back_btn").click(function(){
			$(".user_login").hide();
			$(".user_register").hide();
			$(".social_login").show();
			$(".header_title").text('Login');
			return false;
		});

	})
</script>


 <div class="container">
      <div class="hero-unit">
        <div>
          <h1>
            Welcome to Firesoft.io <sec:authentication property="name"/> !
          </h1>
                  </div>
        <a class="btn btn-primary" href="addPost.html">
          Add new post »
        </a>
        
        
        
        <sec:authorize access="hasRole('ROLE_ADMIN')">
        
         <a class="btn btn-primary" href="EditPost.html">
          Edit new post »
        </a>
        
        </sec:authorize>
        
      <!--    <a class="btn" href="<spring:url value="/logout" />">
         Logout ${pageContext.request.remoteUser}
         </a>
         <sec:csrfInput/>-->
         
       
   <c:url var="logoutUrl" value="logout"/>
<form action="${logoutUrl}" method="post">
  <input class="btn btn-warning" type="submit" value="logout" />
  <sec:csrfInput/>
</form> 

      </div>
      <div>
      </div>
    </div>
    
    <script src="jquery-1.8.3.js">
    </script>
    
    <script src="assets/js/bootstrap.js">
    </script>
    


</body>
</html>