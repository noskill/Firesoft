<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-1.11.3.js"></script>
<script type="text/javascript">
 $(document).ready(
		 function(){
			 $.getJSON('<spring:url value="themes.json"/>', {
				 ajax : 'true'
			 }, function(data){
				 var html = '<option value="">--Please select theme of posts--</option>';
				 var len = data.length;
				 for (var i = 0; i < len; i++) {
					 html += '<option value="'+data[i].desc + '">'
					 +data[i].desc + '</option>';
				 }
				 html +='</option>';
				 $('#themes').html(html);
			 });
		 });
	  
</script>
<style type="text/css">

.error {
color: #ff0000;
}
  
  
.errorblock {
color: #000;
background-color: #ffeeee;
border: 3px solid #ff0000;
padding: 8px;
margin: 16px;

}  
  label { padding: 0; marign: 0; display: block; }
  #themes {width: 30em; height: 2em; margin-bottom: 20px}
  textarea { width:60em; height: 40em; border: 1px solid #333; padding: 4px; }
  #title {width: 60em; border: 1px solid #333; padding: 4px;top-margin:10px}
  html, body {
    background: #eeeeee !important;
    font-family: Helvetica, Arial, Sans !important;
}

body {
    width: 900px;
    padding: 0 30px;
    margin: auto;
}

.blank_row
{
    height: 20px ;
    
}

 </style>
</head>
<body>
<h1>Create Post</h1>

Language: 
   <a href="?language=en">
        English
      </a> |
      <a  href="?language=ru">
        Russian
      </a>
      <br>
      <hr>
<form:form commandName="post">
  <form:errors path="*" cssClass="errorblock" element="div" />
 <table>
     <tr>
     <td ></td>
      <td> 
           
           <form:select id="themes" path="themes"></form:select>
        
        </td>
        
        </tr>
        <tr>
        <td><spring:message code="post.text" /></td>
        <td><form:input path="title"/></td>
        <td><form:errors path="title" cssClass="error"/></td>
       
    </tr>
     <tr class="blank_row">
        <td colspan="3"></td>
     </tr>
     <tr>
        <td><spring:message code="post.cont" /></td>
        <td><form:textarea path="content" />
        <td><form:errors path="content" cssClass="error"/></td>
    </tr>
     <tr>
        <td></td>
        <td style="text-align: center">
        <input type="submit" value="Create" />
        </td>
        <td></td>
    </tr>
    
 </table>
</form:form>


</body>
</html>