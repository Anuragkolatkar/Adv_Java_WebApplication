<%@page import="com.entity.User"%>
<nav class="navbar navbar-expand-lg navbar-dark p-3" style="background-color:#133355">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><img src="img/dic.png" alt="Girl" width="44%" height="68px"><span style="font-size: 26px;color: yellow">PhoneBook</span></i></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp"><i class="fa-solid fa-house-user"> Home</i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="addContact.jsp"><i class="fa-solid fa-square-plus"> Add Phone No</i></a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link active" href="viewContact.jsp"><i class="fa fa-eye"> View Contact</i></a>
        </li>
      </ul>
      <% User u=(User)session.getAttribute("user"); 
        if(u==null){%>
         <form class="form-inline my-2 my-lg-0" >
         <a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-user-plus"></i> Login</a>
      <a href="register.jsp" class="btn btn-danger ml-2"><i class="fa-solid fa-arrow-right-to-bracket"></i> Register</a>
      </form>
       
       <% 	
        }else{%>
              <form class="form-inline my-2 my-lg-0" >
         <button class="btn btn-success"><i class="fa-sharp fa-solid fa-user-plus"> <%=u.getName()%></i></button>
         <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-danger ml-2 text-white"><i class="fa fa-arrow-right-from-bracket"> Logout</i></a>
      </form>	
       <% 
       }
      %>
      <!-- Logout Modal -->
      
      <!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
      <h6>You Want Logout..</h6>
         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="logout" class="btn btn-primary">Logout</a>
      </div>
      <div class="modal-footer">
       
      </div>
    </div>
  </div>
</div>      
     
    </div>
  </div>
</nav>