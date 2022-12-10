<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<%@include file="allcomponents/allcss.jsp"%>
	<style>
	.fooot{
	  padding-top: 10%;
	 }
	</style>
</head>
<body style="background-color:#f7faf8;"> 
	 <%@include file="allcomponents/navbar.jsp" %>
<div class="container p-2">
<div class="row p-4">
<div class="col-md-4 offset-md-3 ">
<div class="card" style="width:130%">
<div style="background-color: #f2efef" class="card-body">
<h1 class="text-center text-sucess">Register Page</h1>
			
			<form action="register" method="post">			
			  <%
			  String sucMsg=(String)session.getAttribute("sucMsg"); 
			  String errMsg=(String)session.getAttribute("errMsg");
			     if(sucMsg!=null){
			 %>
			       <p class="text-success text-center"><%=sucMsg%></p>
			 <% 
			 session.removeAttribute("sucMsg");
			     }
			  if(errMsg!=null){
				  %>
				  <p class="text-danger text-center"><%=errMsg%></p>
			 <%
			 session.removeAttribute("errMsg");
			 }
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
			    <label for="exampleInputPassword1" class="form-label">Password</label>
			    <input type="password" class="form-control" id="exampleInputPassword1" name="password">
			  </div>
			 
			  <button type="submit" class="btn btn-primary">Register</button>
			</form>

</div>
</div>
</div>
</div>
</div>
	<div class="foot" style="padding-top: 8.5%;">
	<%@include file="allcomponents/footer.jsp" %>
	</div>
</body>
</html>