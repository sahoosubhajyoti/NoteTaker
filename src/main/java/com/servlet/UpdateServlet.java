package com.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entites.note;
import com.helper.factoryProvider;

/**
 * Servlet implementation class UpdateServlet
 */
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			int note_id=Integer.parseInt(request.getParameter("noteId").trim());
			
			//note note=s.get(note.class,note_id);
			
			Session s= factoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			note note=s.get(note.class,note_id);
			
			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());
			
			
			tx.commit();
			s.close();
			
			response.sendRedirect("show_all_notes.jsp");
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
