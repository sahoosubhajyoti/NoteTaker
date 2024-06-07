package com.servlet;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entites.note;
import com.helper.factoryProvider;



public class SavenoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SavenoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//title fetch
			String title =request.getParameter("title");
			String content=request.getParameter("content");
			
			note note1=new note(title, content, new Date());
	
			System.out.println(note1.getId()+":"+":"+note1.getTitle()+"::"+note1.getContent());
			//hibernate save:
			Session s=factoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			s.save(note1);
			tx.commit();
			s.close();
			response.setContentType("text/html");
			PrintWriter pw=response.getWriter();
			pw.println("<h1 style='text-align:center'>content succesfully added</h1>");
			pw.println("<a href='show_all_notes.jsp' style='text-align:center'>click here to shoe all notes</a>");		
		}
		
		
	     
		catch(Exception e){
			
		}

}
	
	
}
