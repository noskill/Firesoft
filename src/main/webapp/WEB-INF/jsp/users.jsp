<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
  <link href="resources/css/bootstrap.css" rel="stylesheet">
  <div>
<table class="table table-bordered table-hover table-striped" style="margin-top:45px">
	<thead>
		<tr>
			<th>user name</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${users}" var="user">
			<tr>
				<td>
				    <a href="<spring:url value="/users/${user.id}.html" />">
					${user.fullName}
					</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table> 
</div>