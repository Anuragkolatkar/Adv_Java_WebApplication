<%@page import="java.sql.Connection"%>
<%@page import="com.conn.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to phonebook</title>
<%@include file="allcomponents/allcss.jsp"%>
<style>
 .back-img{
 background:url("img/b1.jpg");
 width:100%; 
 height:78.8vh;
 background-repeat:no-repeat;
 background-size:cover;
 }
</style>
</head>
<body>   
      <%@include file="allcomponents/navbar.jsp" %>    
 
      <div class="container-fluid back-img">
      <h1 class="text-center" style="color:brown;">Welcome To PhoneBook App</h1>       
      
      </div>
      
      <%@include file="allcomponents/footer.jsp" %>
</body>
</html>