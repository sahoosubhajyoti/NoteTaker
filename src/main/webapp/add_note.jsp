<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add note</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container">
   <%@include file="Navbar.jsp" %>
   <br>
   <h4 style="color:black">
   please fill your form</h4>
   
   <!--form   -->
   
   <form action="SavenoteServlet" method="post">
   <div class="form-group">
    <label for="note" style="color:black">Note title</label>
    <input type="text" class="form-control" id="title" name="title" aria-describedby="emailHelp" placeholder="Enter title" required>
    <small id="emailHelp" class="form-text text-muted">We'll never share your information.</small>
    </div>
    <div class="form-group">
    <label for="exampleInputPassword1" style="color:black">Content</label>
    <textarea class="form-control" id="content"  name="content" placeholder="enter your content" style="height:150px;" required></textarea>
     </div>

  
  <div class="container text-center">
  <button type="submit" class="btn btn-primary">Submit</button>
  </div>
  
</form>
</div>


</body>
</html>