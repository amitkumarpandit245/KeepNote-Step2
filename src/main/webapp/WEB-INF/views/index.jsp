<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Keep-Board</title>
</head>


	<!-- Create a form which will have text boxes for Note title, content and status along with a Add 
		 button. Handle errors like empty fields -->

	<!-- display all existing notes in a tabular structure with Title,Content,Status, Created Date and Action -->
<body>
	<h2>Note Information</h2>
	
	<form action='add' method="post">
	  
	 
	  Title:<br>
	  <input type="text" name="noteTitle"><br>
	  Content:<br>
	  <input type="textarea" name="noteContent"><br>
	  Status:<br>
	  <select  name= "noteStatus">
		  <option value="active">Active</option>
		  <option value="inactive">Inactive</option>
	  </select>
	  <br>
	  <br>
	  <input type="submit" value="Submit">
	  
	</form> 
	<br>
	<!-- display all existing notes in a tabular structure with Id, Title,Content,Status, Created Date and Action -->
	<c:if test="${not empty errorMessage}">
	   <p style="color:red">Error</p>: ${errorMessage}
	</c:if>
	<h2>Saved Notes</h2>
	<table border="2">
	
	<tr>
		<td>Title</td>
		<td>Content</td>
		<td>Status</td>
		<td>Created at</td>
		<td>Delete Row</td>
		<td>Update Row</td>
	</tr>
	<c:forEach items="${noteList}" var="note">
		
		<tr>
		<td>${note.noteTitle}</td>
		
		<td>${note.noteContent}</td>
		
		<td>${note.noteStatus}</td>
		
		<td>${note.createdAt}</td>
		
		<td>
		<form action="delete" method="post">
			<input type="hidden" id="noteId" name="noteId" value="${note.noteId}"/>
			<button type="submit">Delete</button>
		</form>
		</td>
		
		<td>
		<form action="updateNote" method="post">
			<input type="hidden" id="noteId" name="noteId" value="${note.noteId}"/>
			<button type="submit">Update</button>
		</form>
		</td>
		</tr>
		</c:forEach>	
	</table>
	
</body>
</body>

</html>