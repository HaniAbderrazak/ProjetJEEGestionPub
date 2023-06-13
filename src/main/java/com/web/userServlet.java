package com.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

import com.dao.GestionUserImp;
import com.dao.IGestionUser;
import com.dao.user;

/**
 * Servlet implementation class userServlet
 */
@WebServlet(urlPatterns= {"/login","/logout","/register"})
@MultipartConfig
public class userServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IGestionUser GU;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userServlet() {
        super();
        GU=new GestionUserImp();
      
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 HttpSession session= request.getSession(true);
		String path=request.getServletPath();
		if(path.equals("/login"))
		{
			
			request.getRequestDispatcher("Login.jsp").forward(request,response);
		}
		else if(path.equals("/logout"))
		{
			session.removeAttribute("user");
			session.invalidate();
			
			
			response.sendRedirect(request.getContextPath()+"/login");
		}
		else if(path.equals("/register"))
		{
			request.getRequestDispatcher("Register.jsp").forward(request,response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path=request.getServletPath();
		user u=null;
		HttpSession session= request.getSession(true);
		if(path.equals("/login"))
		{
			String nom=request.getParameter("username");
			String password=request.getParameter("password");
			try {
			u=GU.verification(nom,password);
			
			}
			catch(Exception e) {
				request.setAttribute("error", "erreur de login ! ");
				request.getRequestDispatcher("Login.jsp").forward(request,response);
			}
			if(u!=null)
			{
				user us=GU.getUserById(u.getId());
				session.setAttribute("user",us );
				response.sendRedirect(request.getContextPath()+"/home");
			}
			else {
				request.setAttribute("error", "erreur de login ! ");
				response.sendRedirect(request.getContextPath()+"/login");
			}
		}
		else if(path.equals("/register"))
		{
			String userName=request.getParameter("username");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			   Part filePart = request.getPart("photo");
		        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		        InputStream fileContent = filePart.getInputStream();
		        GU.registration(new user(userName,email,password,"img/"+fileName));
		      
				session.setAttribute("user",u );
				response.sendRedirect(request.getContextPath()+"/login");
		}
	
		
		
	}
}
