package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entites.note;
import com.helper.factoryProvider;


public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int noteId=Integer.parseInt(request.getParameter("note_id").trim());
			 Session s=factoryProvider.getFactory().openSession();
			 Transaction tx=s.beginTransaction();
			 note note=(note)s.get(note.class, noteId);
			 s.delete(note);
			 tx.commit();
			 s.close();
			 response.sendRedirect("show_all_notes.jsp");
		}
		catch(Exception e) {
			
		}
	}

	
	

}
