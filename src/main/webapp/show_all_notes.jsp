<%@page import="org.hibernate.query.*"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="com.entites.note" %>
<%@ page import="java.util.*" %>
<%@ page import="com.helper.factoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ShowNotes</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container">
   <%@include file="Navbar.jsp" %>
   <br>
   <h4>
   ALL Notes</h4>
   
   <div class="row">
   <div class="col-12">
      <%
Session s = factoryProvider.getFactory().openSession();
try {
    Query q = s.createQuery("from note");
    List<note> list = q.list();
    for (note note : list) {
        //out.println(note.getId() + "<br>" + note.getTitle() + "<br>" + note.getContent()+"<br>");
    %>
    <div class="card mt-3">
  <img class="card-im m-4 mx-auto" src="image/notes.png" style="max-width:100px;" Card image cap">
  <div class="card-body px-4">
    <h5 class="card-title"><%out.println(note.getTitle());%></h5>
    <p class="card-text"><%out.println(note.getContent()); %></p>
    <div class="container text-center">
    <a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-primary">Delete</a>
    <a href="update_Note.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Edit</a>  
    </div>  
    </div>
</div>
    
    
    
    <% 
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    s.close();
}
%>
   </div>
   </div>

   
   </div>

</body>
</html>