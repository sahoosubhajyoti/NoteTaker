<%@page import="com.entites.note"%>
<%@page import="com.helper.factoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container ">
   <%@include file="Navbar.jsp" %>
   <h4>edit It</h4>
   <%
   int note_id=Integer.parseInt(request.getParameter("note_id").trim());
   Session s=factoryProvider.getFactory().openSession();
   note note=(note)s.get(note.class, note_id);
   
   
   s.close();
   %>
    <form action="UpdateServlet" method="post">
   <div class="form-group">
   <input  value="<%=note.getId() %>"name=noteId type="hidden">
    <label for="note" style="color:black">Note title</label>
    <input type="text" class="form-control" id="title" name="title" aria-describedby="emailHelp" placeholder="Enter title" required 
    value="<%=note.getTitle() %>"/>
    <small id="emailHelp" class="form-text text-muted">We'll never share your information.</small>
    </div>
    <div class="form-group">
    <label for="exampleInputPassword1" style="color:black">Content</label>
    <textarea class="form-control" id="content"  name="content" placeholder="enter your content" style="height:150px;" required 
    ><%=note.getContent() %></textarea>
     </div>
     <div class="container text-center">
     <button type="submit" class="btn btn-success">save</button>
     </div>
     </form>
   </div>
   

</body>
</html>