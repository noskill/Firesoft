<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>




<head>
 
 <script src="<c:url value="/resources/js/jquery-2.1.4.min.js" />"></script>
 <script src="<c:url value='/resources/js/jquery.leanModal.min.js' />"></script>
 <script src="<c:url value='/resources/js/jquery.form.min.js'  />"></script>
 <script src="<c:url value='/resources/js/jquery.simplemodal.js' />"></script>
 <script src="resources/js/bootstrap.js"></script>
 
 <script src="https://apis.google.com/js/platform.js" async defer></script>
 <meta name="google-signin-client_id" content="46727822461-4ljlensngrf1r741kn9jvlaenrdkf8jk.apps.googleusercontent.com">
 
 <style>
 
#logoutBut {
	text-decoration: none;
	color: #9d9d9d;
}

#logoutBut:hover {
	color: #ffe
}

.popupContainer{
   top: 50px
}
</style>

<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/normalize.css" />"
	rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/custom.css" rel="stylesheet">



</head>
<body>


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



function onSignIn(googleUser) {
	  if (!need_to_login()){
		  return false;
	  }
      var id_token = googleUser.getAuthResponse().id_token;
      var profile = googleUser.getBasicProfile();
      console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
      console.log('Name: ' + profile.getName());
      console.log('Image URL: ' + profile.getImageUrl());
      console.log('Email: ' + profile.getEmail());
      var xhr = new XMLHttpRequest();
      //todo: remove hardcode
      xhr.open('POST', '/Firesoftblog/login');
      xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
      xhr.onload = function() {
        console.log(this.response);
        if (this.response == null || this.status == 403) {
            alert("authentication failure");
        } else {
            console.log('Signed in as: ' + xhr.responseText);
            document.open();
            document.write(this.response);
            document.close();
        }
        
      };
      var v = document.getElementsByClassName("social_login")
      xhr.setRequestHeader('X-CSRF-Token', v[0].children._csrf.value);
      var data = 'password=' + id_token;
      data += '&username=' + profile.getEmail();
      xhr.send(data);
}


function signOut() {
  var auth2 = gapi.auth2.getAuthInstance();
  auth2.signOut().then(function () {
    console.log('User signed out.');
  });
}


</script>


<sec:authorize access="not isAuthenticated()">
  <script>
  function need_to_login(){
	    return true;
  }
  </script>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
  <script>
  function need_to_login(){
	    return false;
  }
  </script>
</sec:authorize>


	<div id="modal" class="popupContainer" style="display:none;">
		<header class="popupHeader">
			<span class="header_title">Login</span> <span class="modal_close"><i
				class="fa fa-times"></i></span>
		</header>

		<section class="popupBody">
			<!-- Social Login -->
			<div class="social_login">
				<div class="">
					<a href="#" class="social_box fb">
						<span class="icon"><i class="fa fa-facebook"></i></span>
						<span class="icon_title">Login with Facebook</span>
						
					</a>

					<a href="#" class="social_box google">
					    <div class="g-signin2" data-onsuccess="onSignIn"></div>
						<span class="icon"><i class="fa fa-google-plus"></i></span>
						<span class="icon_title">Login with Google</span>
					</a>
				</div>

				<div class="centeredText">
					<span>Or use your Email address</span>
				</div>

				<div class="action_btns">
					<div class="one_half">
						<a href="#" id="login_form" class="btn">Login</a>
					</div>
					<div class="one_half last">
						<a href="#" id="register_form" class="btn">Sign up</a>
					</div>
				</div>
				<sec:csrfInput/>
			</div>



			<!-- Username & Password Login form -->

			<div class="user_login">

				<c:if test="${not empty error}">
					<div class="errorblock">
						Your login was unsuccessful. <br /> Caused:
						${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
					</div>
				</c:if>


				<form name='f' action='/Firesoftblog/login' method='POST' id="ff">

					<div id="login_response">
						<!-- spanner -->
					</div>

					<p style="color: red">
						<%
							if (request.getParameter("error") != null) {
								out.println("ERROR LOGIN");
							}
						%>
					</p>


					<div class="error" id="error_login"></div>

					<label>Username</label> <input type="text" name='username' value='' />
					<br /> <label>Password</label> <input type="password"
						name='password' /> <br />

					<div class="checkbox">
						<input id="remember" type="checkbox" /> <label for="remember">Remember
							me on this computer</label>
					</div>

					<div class="action_btns">
						<div class="one_half">
							<a href="#" class="btn back_btn"><i
								class="fa fa-angle-double-left"></i> Back</a>
						</div>
						<div class="one_half last">
							<a class="btn btn_red" id="submit"
								href="javascript: submitForm();">Login</a>
						</div>
					</div>
					<sec:csrfInput />
				</form>



				<script>
					function submitForm() {

						$('#ff').submit();
					}
				</script>



				<a href="#" class="forgot_password">Forgot password?</a>



			</div>

			<!-- Register Form -->
		
				<form:form  modelAttribute="user" method="POST" cssClass="user_register">
					<label>Full Name</label>
					<input name="fullName"  type="text" />
					<br />
					
					<label>User Name</label>
					<input name="username"  type="text" />
					<br />

					<label>Email Address</label>
					<input name="email" type="email" />
					<br />

					<label>Password</label>
					<input name="password" type="password" />
					<br />				

					<div class="action_btns">
						<div class="one_half">
							<a href="#" class="btn back_btn"><i
								class="fa fa-angle-double-left"></i> Back</a>
						</div>
						<div class="one_half last">
							<input  type="submit" class="btn btn_red" style="width: 120px" value="Register">
							
						</div>
					</div>
				</form:form>
			
		</section>
	</div>
	<p style="color: red">
		<%
			if (request.getParameter("error") != null) {
				out.println("ERROR LOGIN");
			}
		%>
	</p>

	<script type="text/javascript">
		$("#modal_trigger").leanModal({
			top : 50,
			overlay : 0.6,
			closeButton : ".modal_close"
		});
		$(function() {
			// Calling Login Form
			$("#login_form").click(function() {
				$(".social_login").hide();
				$(".user_login").show();
				return false;
			});
			// Calling Register Form
			$("#register_form").click(function() {
				$(".social_login").hide();
				$(".user_register").show();
				$(".header_title").text('Register');
				return false;
			});
			// Going back to Social Forms
			$(".back_btn").click(function() {
				$(".user_login").hide();
				$(".user_register").hide();
				$(".social_login").show();
				$(".header_title").text('Login');
				return false;
			});
		})
		$("body").bind("ajaxSend", function(elm, xhr, s) {
			if (s.type == "POST") {
				xhr.setRequestHeader('X-CSRF-Token', csrf_token);
			}
		});

		$('#ff')
				.ajaxForm(
						{
							success : function(response, statusText, xhr, $form) {
								console.log(response);
								if (response == null) {
									alert("authentication failure");
								} else {
									document.open();
									document.write(response);
									document.close();
								}
							},
							error : function(response, statusText, error, $form) {
								if (response != null && response.status == 401) {
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

		function submitForm() {
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
							  <sec:authorize access="isAuthenticated()">
								<h4>
									Welcome to Firesoft.io
									<sec:authentication property="name" />
									!
								</h4>
								</sec:authorize>
							</div>
							<sec:authorize access="isAuthenticated()">
								<a class="btn btn-primary" href="addPost.html">Add new post
									»</a>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<a class="btn btn-primary" href="EditPost.html">Edit new
									post»</a>
							</sec:authorize>

						</div>



						<!--    <a class="btn" href="<spring:url value="/logout" />">
         Logout ${pageContext.request.remoteUser}
         </a>
         <sec:csrfInput/>-->
                       <sec:authorize access="isAuthenticated()">
						<c:url var="logoutUrl" value="logout" />
						<form action="${logoutUrl}" method="post" onSubmit="JavaScript:signOut()" >
							<input class="btn btn-warning" type="submit" value="logout" />
							<sec:csrfInput />
						</form>
					<!--
						<div class="clearfix"></div>
						<hr>
						<ul id="topics">
						</ul>
						<h3>Statistics</h3>
						  <ul>
							<li>Total Number of Users: <strong>100</strong></li>
							<li>Total Number of Posts: <strong>100</strong></li>
							<li>Total Number of Categories: <strong>100</strong></li>
						</ul> -->
	</sec:authorize>
					</div>
				</div>
			</div>

			<sec:authorize access="! isAuthenticated()">
				<div class="col-md-4">
					<div id="sidebar">
						<div class="block">
							<h3>Login Form</h3>
							<form role="form">
								<div class="form-group">
									<label>Username</label> <input name="username" type="text"
										class="form-control" placeholder="Enter Username">
								</div>
								<div class="form-group">
									<label>Password</label> <input name="password" type="password"
										class="form-control" placeholder="Enter Password">
								</div>
								<div class="checkbox">
									<label> <input type="checkbox"> Check me out
									</label>
								</div>
								<button name="submit" type="submit" class="btn btn-primary">Login</button>
								<a class="btn btn-default" href="register.html">Create
									account</a>
							</form>
						</div>
						<div class="block">
							<h3>Categories</h3>
							<a href="#" class="list-group-item active">All Topics<span
								class="badge pull-right">14</span></a>
						</div>
					</div>
				</div>
			</sec:authorize>
		</div>
	</div>
	<!-- /.container -->

	<c:forEach items="${posts}" var="post">
		<table>
			<tr>
				<td>Title</td>
				<td>${post.title}</td>

			</tr>

			<tr>
				<td>---------------------</td>
				<td>----------------------</td>
			</tr>
			<tr>
				<td>Content</td>
				<td>${post.content}</td>
			</tr>

		</table>

	</c:forEach>
</body>
</html>

