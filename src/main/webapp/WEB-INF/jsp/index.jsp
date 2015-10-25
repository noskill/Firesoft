<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"  %>

    


<head>
 <script src="<c:url value='/resources/js/jquery-2.1.4.min.js' />"></script>
 <script src="<c:url value='/resources/js/jquery.leanModal.min.js' />"></script>
 <script src="<c:url value='/resources/js/jquery.form.min.js'  />"></script>
 <script src="<c:url value='/resources/js/jquery.simplemodal.js' />"></script>
 <script src="resources/js/bootstrap.js"></script>
<link type=text/css rel=stylesheet href="//www.gstatic.com/authtoolkit/css/gitkit.css" />

<script type="text/javascript" src="//www.gstatic.com/authtoolkit/js/gitkit.js"></script>
	<script type=text/javascript>
	  window.google.identitytoolkit.signInButton(
	    '#navbarff', // accepts any CSS selector
	    {
	      widgetUrl: "http://localhost:8080/Firesoftblog/oauth2callback",
	      signOutUrl: "http://localhost:8080/Firesoftblog/oauth2logout",
	      popupMode: true
	    }
	  );
	</script>
     
 <style>
 #logoutBut {
           text-decoration: none;
           color: #9d9d9d; 
 }
 #logoutBut:hover{color: #ffe}
</style>         
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/normalize.css" />" rel="stylesheet">
<!-- Bootstrap core CSS -->
    <link href="resources/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/css/custom.css" rel="stylesheet">
    
 

</head>
<body>
  <!--   <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Firesoft.io</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="index.jsp">Home</a></li>
            <li><a href='<spring:url value="/users.html" />'>Users</a></li>
            <sec:authorize access="! isAuthenticated()">
            <li><a id="modal_trigger" href="#modal">Login or register</a></li>
            </sec:authorize>
             <sec:authorize access="! isAuthenticated()">
            <li><a id="modal_trigger" href="#modal">register</a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
            <li>
                <c:url var="logoutUrl" value="logout"/>
                      <form style="margin-top: 15px" action="${logoutUrl}" method="post">
                           <a id="logoutBut" class="navbar-inverse nav a navbar-nav"  href="<spring:url value="/logout" />">Logout</a>
                           <sec:csrfInput/>
                     </form> 
            </li>
            </sec:authorize>
           
          </ul>
        </div>
      </div>
    </nav> --> 
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

					<a href="#"  id="navbarff" class="social_box google">
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
			
			  <c:if test="${not empty error}">
        <div class="errorblock">
           Your login was unsuccessful. <br />
           Caused: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
        </div>
    </c:if>
		
 
				<form name='f' action='/Firesoftblog/login' method='POST' id="ff">
				
				<div id="login_response"><!-- spanner --></div> 
				
<p style="color:red">				
		       <% if(request.getParameter("error") != null){
out.println("ERROR LOGIN");
}
%>
</p>


				<div class="error" id="error_login"></div>
				
					<label>Username</label>
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
						<a class="btn btn_red" id="submit" href="javascript: submitForm();">Login</a></div>
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
				<form:form>
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
				</form:form>
			</div>
		</section>
	</div>

	
	
	<p style="color:red">				
		       <% if(request.getParameter("error") != null){
out.println("ERROR LOGIN");
}
%>
</p>

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
$("body").bind("ajaxSend", function(elm, xhr, s){
    if (s.type == "POST") {
        xhr.setRequestHeader('X-CSRF-Token', csrf_token);
    }
});


$('#ff').ajaxForm({
    success: function(response, statusText, xhr, $form)  {
        console.log(response);
        if(response == null) {
            alert("authentication failure");
        } else {
        	document.open();
        	document.write(response);
        	document.close();
        }
    },
    error: function(response, statusText, error, $form)  { 
        if(response != null && response.status == 401) {
            document.getElementById("error_login").textContent = "wrong credentials";
        }
    }
});

// attach handler to form's submit event
$('#ff').submit(function() {
    // submit the form
    $(this).ajaxSubmit();
    // return false to prevent normal browser submit and page navigation
    return false;
});


function submitForm(){
	$('#ff').submit();
}
</script>
 <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="main-col">
                    <div class="block">   
                         <div class="hero-unit">
                                 <div>
                                      <h1> Welcome to Firesoft.io <sec:authentication property="name"/> ! </h1>
                                 </div>
                                 <sec:authorize access="isAuthenticated()">
                                 <a class="btn btn-primary" href="addPost.html">Add new post »</a>
                                 </sec:authorize>
                                     <sec:authorize access="hasRole('ROLE_ADMIN')">
                                           <a class="btn btn-primary" href="EditPost.html">Edit new post Â»</a>
                                     </sec:authorize>
                                       
                         </div>
       
                                     
      <!--    <a class="btn" href="<spring:url value="/logout" />">
         Logout ${pageContext.request.remoteUser}
         </a>
         <sec:csrfInput/>-->
                                     <c:url var="logoutUrl" value="logout"/>
                                           <form action="${logoutUrl}" method="post">
                                           <input class="btn btn-warning" type="submit" value="logout" />
                                               <sec:csrfInput/>
                                           </form> 
                        <div class="clearfix"></div>
                        <hr>
                        <ul id="topics">
                        </ul>
                        <h3>Statistics</h3>
                            <ul>
                                <li>Total Number of Users: <strong>100</strong></li>
                                <li>Total Number of Posts: <strong>100</strong></li>
                                <li>Total Number of Categories: <strong>100</strong></li>
                            </ul>
                        
                    </div>
                </div>
            </div>
            <div class="col-md-4">
               <div id="sidebar">
                  <div class="block">
                      <h3>Login Form</h3>
                      <form role="form">
                          <div class="form-group">
                              <label>Username</label>
                              <input name="username" type="text" class="form-control" placeholder="Enter Username">
                          </div>
                          <div class="form-group">
                              <label>Password</label>
                              <input name="password" type="password" class="form-control" placeholder="Enter Password">
                         </div>
                         <div class="checkbox">
                           <label> <input type="checkbox"> Check me out</label>
                        </div>
                        <button name="submit" type="submit" class="btn btn-primary">Login</button>
                        <a class="btn btn-default" href="register.html">Create account</a>
                    </form>
                  </div>
                   <div class="block">
                      <h3>Categories</h3> 
                          <a href="#" class="list-group-item active">All Topics<span class="badge pull-right">14</span></a>                      
                   </div>
               </div> 
            </div>
        </div>
    </div><!-- /.container -->
</body>
</html>

