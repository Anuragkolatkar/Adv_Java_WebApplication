<%@page import="java.sql.Connection"%>
<%@page import="com.conn.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Contact</title>
<%@include file="allcomponents/allcss.jsp"%>
</head>
<body style="background-color:#f7faf8;"> 
 <%@include file="allcomponents/navbar.jsp" %>
 
 <% if(u==null){
	 session.setAttribute("errMsg", "Login Please..");
	response.sendRedirect("login.jsp"); 
 }
 %>
 
<div class="container p-2">
<div class="row p-4">
<div class="col-md-4 offset-md-3 ">
<div class="card" style="width:130%">
<div style="background-color: #f2efef" class="card-body">
<h2 class="text-center text-sucess">Add Contact Page</h2>

<%
  String succMsg=(String)session.getAttribute("succMsg"); 
  String failMsg=(String)session.getAttribute("failMsg");
     if(succMsg!=null){
 %>
       <p class="text-success text-center"><%=succMsg%></p>
 <% 
 session.removeAttribute("succMsg");
     }
  if(failMsg!=null){
	  %>
<p class="text-danger text-center"><%=failMsg%></p>
 <%
 session.removeAttribute("failMsg");
 }
 %>
			<form action="addContact" method="post">
			  <%
			   if(u!=null){%>
				   <input type="hidden" name="userId" value="<%=u.getId()%>">
			   <% }
			  %>			 
		     	<div class="mb-3">
			    <label for="exampleInputEmail1" class="form-label">Enter Name</label>
			    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="name">
			    
			    </div>
			
			  <div class="mb-3">
			    <label for="exampleInputEmail1" class="form-label">Email address</label>
			    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
			    
			  </div>
			  <div class="mb-3">
			    <label for="exampleInputEmail1" class="form-label">Phone no</label>
			    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="phno">
			    
			  </div>
			   <div class="mb-2">
			    <textarea  rows="4" cols="51" name="about" class="form-control" placeholder="Enter About"></textarea>    
			  </div>  
			 
			  <button type="submit" class="btn btn-primary">Save Contact</button>
			</form>

</div>
</div>
</div>
</div>
</div>
<div class="foot" style="padding-top: 4%;">
<%@include file="allcomponents/footer.jsp" %>
</div>

</body>
</html>