<%@page import="com.entity.Contact"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.ContactDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Contact</title>
<%@include file="allcomponents/allcss.jsp"%>
<style type="text/css">
.crd:hover{
    background-color:#f7f7f7;
}
</style>

</head>
<body style="background-color:#f7faf8;"> 
 <%@include file="allcomponents/navbar.jsp" %>
 
		 <% if(u==null){
			 session.setAttribute("errMsg", "Login Please..");
			response.sendRedirect("login.jsp"); 
		 }
		 %>
		 <%
		  String succMsg=(String)session.getAttribute("succMsg");
		  if(succMsg!=null){
			  %>
			  <div class="alert alert-success" role="alert"><%=succMsg%></div>
		  <%
		  session.removeAttribute("succMsg");
		  }
		  String failMsg=(String)session.getAttribute("failMsg");
		  if(failMsg!=null){
			  %>
			  <p class="text-danger text-center"><%=failMsg%></p>
		 <%
		 session.removeAttribute("failMsg");
		 }
		 %>
 
 
 <div class="container">
 <div class="row p-4">

		 <%
		 if(u!=null){
			 	 
		  ContactDAO doa = new ContactDAO(DbConnect.getConn());
		          List<Contact> contact =doa.getAllContact(u.getId());
		          for(Contact c:contact){
		        	 %>
		        	  <div class="col-md-3">
		                  <div  class="card crd p-2" >
		                   <div class="card-body" >
		                      <h5>
		                        Name:
		                        <%=c.getName()%></h5>
		                      <p>
		                      ph no:
		                      <%=c.getPhno()%></p>
		                      <p>
		                      Email:
		                      <%=c.getEmail()%></p>
		                      <p>
		                      About:
		                      <%=c.getAbout()%></p>
		                      <div>
		                      <a href="editcontact.jsp?cid=<%=c.getId()%>" class="btn btn-success btn-sm text-white">Edit</a>
		                      <a href="delete?cid=<%=c.getId()%>" class="btn btn-danger btn-sm text-white">Delete</a>
		                      </div>
		                    
		 </div>
		 </div>         	 
		         </div>	 
       <% }
 }     
 %> 
 </div>
 </div>

		<div class="foot" style="padding-top: 4%;">
		<%@include file="allcomponents/footer.jsp" %>
		</div>
</body>
</html>