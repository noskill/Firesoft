<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>Firesoft Cusrom login form</title>
    
    <script src="<c:url value="/resources/js/jquery-1.11.0.min.js" />"></script>
 <script src="<c:url value='/resources/js/jquery.leanModal.min.js' />"></script>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/normalize.css" />" rel="stylesheet">

    <style type="text/css">
    .errorblock {
     color: #ff0000;
     background-color: #ffeeee;
     border: 3px solid #ff0000;
     padding: 8px;
     margin: 16px;
    }
    </style>
</head>

<body onload='document.f.j_username.focus();'>
    <h3>Firesoft Cusrom login form</h3>
    
  <c:if test="${not empty error}">
        <div class="errorblock">
           Your login was unsuccessful. <br />
           Caused: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
        </div>
    </c:if>
    
<div class="container">
	<div id="modal" class="popupContainer">
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
					
		</section>
	</div>
</div>
    
<!-- <form name='f' action='/Firesoftblog/login' method='POST'>
	<table>
	<tr><td>User:</td><td><input type='text' name='username' value=''></td></tr>
	<tr><td>Password:</td><td><input type='password' name='password'/></td></tr>
	<tr><td colspan='2'><input name="submit" type="submit" value="Login"/></td></tr>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</table>
    </form> -->
</body>
</html>