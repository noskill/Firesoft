<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/prettify/r298/prettify.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
    
 <script src="<c:url value="/resources/js/jquery-2.1.4.min.js" />"></script>
<script src="resources/js/jquery.hotkeys.js"></script>
<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prettify/r298/prettify.js"></script>
<link type=text/css rel=stylesheet href="resources/css/index.css" />
<script src="resources/js/bootstrap-wysiwyg.js"></script>
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
 
 

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
			 
			 $('#editor').wysiwyg();
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

 #editor {overflow:scroll; max-height:300px}

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
    text-align: center;
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
      <br />

 
<form:form commandName="post">
  <form:errors path="*" cssClass="errorblock" element="div" />
           <form:select id="themes" path="themes"></form:select>
           <br />
           <br />
           
            <spring:message code="post.text" />
            <br />
            <form:input path="title"/>
            <form:errors path="title" cssClass="error" element="div"/>
       
    
 <br /> <br />
 
        <spring:message code="post.cont" />
        <br />
         <form:textarea  path="content"/> 
        <form:errors path="content" cssClass="error" element="div"/>
       
        <br />

       <center> <input type="submit" value="Create" /> </center>
       <div>
          
       </div>
</form:form>

    <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
      <div class="btn-group">
        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="icon-font"></i><b class="caret"></b></a>
          <ul class="dropdown-menu">
          </ul>
        </div>
      <div class="btn-group">
        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="icon-text-height"></i>&nbsp;<b class="caret"></b></a>
          <ul class="dropdown-menu">
          <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
          <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
          <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
          </ul>
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
        <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
        <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="icon-strikethrough"></i></a>
        <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="icon-list-ul"></i></a>
        <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="icon-list-ol"></i></a>
        <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a>
        <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="icon-indent-right"></i></a>
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
        <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
        <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
        <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
      </div>
      <div class="btn-group">
                  <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="icon-link"></i></a>
                    <div class="dropdown-menu input-append">
                            <input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
                            <button class="btn" type="button">Add</button>
        </div>
        <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="icon-cut"></i></a>

      </div>

      <div class="btn-group">
        <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="icon-picture"></i></a>
        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
        <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
      </div>
      <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
    </div>

    <div id="editor">
      Go ahead&hellip;
    </div>

<script>
  $(function(){
    function initToolbarBootstrapBindings() {
      var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
            'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
            'Times New Roman', 'Verdana'],
            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
      $.each(fonts, function (idx, fontName) {
          fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
      });
      $('a[title]').tooltip({container:'body'});
        $('.dropdown-menu input').click(function() {return false;})
                    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
        .keydown('esc', function () {this.value='';$(this).change();});

      $('[data-role=magic-overlay]').each(function () { 
        var overlay = $(this), target = $(overlay.data('target')); 
        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
      });
      if ("onwebkitspeechchange"  in document.createElement("input")) {
        var editorOffset = $('#editor').offset();
        $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
      } else {
        $('#voiceBtn').hide();
      }
        };
        function showErrorAlert (reason, detail) {
                var msg='';
                if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
                else {
                        console.log("error uploading file", reason, detail);
                }
                $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
                 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
        };
    initToolbarBootstrapBindings();  
        $('#editor').wysiwyg({ fileUploadError: showErrorAlert} );
    window.prettyPrint && prettyPrint();
  });
</script>

<script>
"use strict";

function toUriEncoded(params){
	var query = "";
	for (var key in params) {
	    query += encodeURIComponent(key)+"="+encodeURIComponent(params[key])+"&";
	}
	return query;
}
</script>

<script>
"use strict";
function sendFormData() {
	let formData = {"themes":  document.getElementById("themes").value,
			        "title": document.getElementById("title").value,
	                "_csrf": document.getElementsByName('_csrf')[0].value,
	                "content": document.getElementById("editor").innerHTML}



	var request = new XMLHttpRequest();
	request.open("POST", "http://localhost:8080/Firesoftblog/addPost.html");
	request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	request.send(toUriEncoded(formData));
}
</script>

<button type="button" onclick="sendFormData()">Click Me!</button>

 
  




</body>
</html>
