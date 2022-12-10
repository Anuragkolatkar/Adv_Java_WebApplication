<%@page import="com.entity.Contact"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.ContactDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
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
<h2 class="text-center text-sucess">Edit Contact Page</h2>

			<%  
			  String failMsg=(String)session.getAttribute("failMsg");
			   
			  if(failMsg!=null){
				  %>
				  <p class="text-danger text-center"><%=failMsg%></p>
			 <%
			 session.removeAttribute("failMsg");
			 }
			   	 %>
			<form action="editContact" method="post">
			  <%
			  int cid = Integer.parseInt(request.getParameter("cid"));
			  ContactDAO dao = new ContactDAO(DbConnect.getConn());
			 Contact c= dao.getContactByID(cid);
			  %>
			 <input type="hidden" value=<%=cid%> name="cid">
			<div class="mb-3">
			    <label for="exampleInputEmail1" class="form-label">Enter Name</label>
			    <input value="<%=c.getName()%>" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="name">
			    
			  </div>
			
			  <div class="mb-3">
			    <label for="exampleInputEmail1" class="form-label">Email address</label>
			    <input value="<%=c.getEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
			    
			  </div>
			  <div class="mb-3">
			    <label for="exampleInputEmail1" class="form-label">Phone no</label>
			    <input value="<%=c.getPhno()%>" type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="phno">
			    
			  </div>
			   <div class="mb-2">
			    <textarea rows="4" cols="51" name="about" class="form-control" placeholder="Enter About"><%=c.getAbout()%></textarea>    
			  </div>  
			 
			  <button type="submit" class="btn btn-primary">Update Contact</button>
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