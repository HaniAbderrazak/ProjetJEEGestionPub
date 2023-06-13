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
import java.util.List;



import com.dao.Categorie;
import com.dao.GestionCategorieImp;
import com.dao.GestionPubImp;
import com.dao.GestionUserImp;
import com.dao.IGestionCategorie;
import com.dao.IGestionPub;
import com.dao.IGestionUser;

import com.dao.publication;
import com.dao.user;

import java.text.SimpleDateFormat;
import java.util.Date;




/**
 * Servlet implementation class PublicationServlet
 */
@WebServlet(urlPatterns= {"/home","","/addPublication","/pubDetails","/ModifierPublication","/SupprimerPublication","/rechercherPublication","/rechercherPubParCategorie","/Profile","/ModifUser","/SupprimerUser"})
@MultipartConfig
public class PublicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	IGestionPub g;
	IGestionCategorie C;
	IGestionUser user;
	int start=1;
	int end=4;
    public PublicationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException {
    	g=new GestionPubImp();
    	C=new GestionCategorieImp();
    	user=new GestionUserImp();
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path=request.getServletPath();
		HttpSession session=request.getSession(true);
		
		if(session.getAttribute("user")!=null)
		{
		if(path.equals("/home") || path.equals(""))
		{
			
			
				 
				int pageid = 1; // default page number
				if(request.getParameter("page") != null) {
				    pageid = Integer.parseInt(request.getParameter("page"));
				}
				int pageSize = 4; // number of items per page
				int start = (pageid - 1) * pageSize; // starting index of items to fetch
				int end = start + pageSize; // ending index of items to fetch
				
					
				List<publication> liste=g.getAllpublication(start,end);
				request.setAttribute("listep", liste);
				//request.setAttribute("cat",C.getAllCategorie());
				request.getRequestDispatcher("Home.jsp").forward(request,response);
				
				
		
		}
		else if(path.equals("/addPublication"))
		{
			request.setAttribute("cat",C.getAllCategorie());
			request.getRequestDispatcher("addPub.jsp").forward(request,response);
		}
		else if(path.equals("/pubDetails"))
		{
			int id =Integer.parseInt(request.getParameter("id"));
			publication p=g.recherecheParId(id);
			user auteur=user.getUserById(p.getUser().getId());
			request.setAttribute("auteur",auteur);
			request.setAttribute("pub",p);
			request.setAttribute("cat",C.getAllCategorie());
			request.getRequestDispatcher("PubDetails.jsp").forward(request,response);
		}
		else if(path.equals("/ModifierPublication"))
				{
					int id =Integer.parseInt(request.getParameter("id"));
					publication p=g.recherecheParId(id);
					request.setAttribute("pub",p);
					request.setAttribute("cat",C.getAllCategorie());
					request.getRequestDispatcher("modifierPublication.jsp").forward(request,response);
				}
		else if(path.equals("/SupprimerPublication"))
		{
			int id =Integer.parseInt(request.getParameter("id"));
			g.supprimerPub(id);
			List<publication> liste=g.getAllpublication(start,end);
			request.setAttribute("listep", liste);
			//request.setAttribute("cat",C.getAllCategorie());
			request.getRequestDispatcher("Home.jsp").forward(request,response);
			
		}
		else if(path.equals("/Profile"))
		{
			user k=(com.dao.user) session.getAttribute("user");
			List<publication> liste=g.getPubParUser(k.getId());
			request.setAttribute("listep", liste);
			request.getRequestDispatcher("Profile.jsp").forward(request,response);
		}
		else if(path.equals("/ModifUser"))
		{
			request.getRequestDispatcher("ModifUser.jsp").forward(request,response);
		}
		else if(path.equals("/SupprimerUser"))
		{
			int id =Integer.parseInt(request.getParameter("id"));
			g.supprimerPubyuser(id);
			user.supprimeruser(id);
			
			session.invalidate();
			response.sendRedirect(request.getContextPath()+"/login");
			
			
		}	}
		else 
			request.getRequestDispatcher("Login.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String path=request.getServletPath();
		 HttpSession session=request.getSession(true);
		if(path.equals("/addPublication"))
		{
			String title=request.getParameter("title");
			String desc=request.getParameter("desc");
			int idC =Integer.parseInt(request.getParameter("idCat"));
			Categorie c=C.RechercheParId(idC);
			
			SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm");
		    Date date = new Date();
		    
		    //upload image
	       Part filePart = request.getPart("photo");
	        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
	        InputStream fileContent = filePart.getInputStream();
		    //copy in file 
	        
	        /*for (Part part : request.getParts()) {
	            part.write("C:\\Users\\DELL\\Desktop\\JEE\\Workspace1\\ChatAppJee\\src\\main\\webapp\\newImg\\" + fileName);
	        }*/
	       
	        user u=(user) session.getAttribute("user");
			g.ajoutPub(new publication(title,desc,s.format(date).toString(),"img/"+fileName,c,u));
			List<publication> liste=g.getAllpublication(start,end);
			request.setAttribute("listep", liste);
			response.sendRedirect(request.getContextPath()+"/home");
		

}
		else if(path.equals("/ModifierPublication"))
		{
			String title=request.getParameter("title");
			String desc=request.getParameter("desc");
			int id =Integer.parseInt(request.getParameter("id"));
			int idC =Integer.parseInt(request.getParameter("idCat"));
			Categorie c=C.RechercheParId(idC);
			
			SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy HH:mm");
		    Date date = new Date();
		    
		    //upload image
	        Part filePart = request.getPart("photo");
	        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
	        InputStream fileContent = filePart.getInputStream();
		    //copy in file 
	        
	        /*for (Part part : request.getParts()) {
	            part.write("C:\\Users\\DELL\\Desktop\\JEE\\Workspace1\\ChatAppJee\\src\\main\\webapp\\newImg\\" + fileName);
	        }*/
	         session=request.getSession(true);
	        user u=(user) session.getAttribute("user");
			g.modifPub(new publication(id,title,desc,s.format(date).toString(),"img/"+fileName,c,u)); 
			List<publication> liste=g.getAllpublication(start,end);
			request.setAttribute("listep", liste);
			response.sendRedirect(request.getContextPath()+"/home");
			
		}
		else if(path.equals("/rechercherPublication"))
		{
			String nom=request.getParameter("NomPublication");
			List<publication> pub=g.getPubParNom(nom);
			request.setAttribute("mot", nom);
			request.setAttribute("listep", pub);
			request.getRequestDispatcher("Home.jsp").forward(request,response);
		}
		else if(path.equals("/ModifUser"))
		{
			String username=request.getParameter("username");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			int id =Integer.parseInt(request.getParameter("id"));
		    //upload image
	        Part filePart = request.getPart("photo");
	        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
	        InputStream fileContent = filePart.getInputStream();
		    //copy in file 
	        
	        /*for (Part part : request.getParts()) {
	            part.write("C:\\Users\\DELL\\Desktop\\JEE\\Workspace1\\ChatAppJee\\src\\main\\webapp\\newImg\\" + fileName);
	        }*/
	       session.invalidate();
	        session=request.getSession(true);
	        session.setAttribute("user",user.getUserById(id));
			user.modifuser(new user(id,username,email,password,"img/"+fileName)); 
			List<publication> liste=g.getAllpublication(start,end);
			request.setAttribute("listep", liste);
			response.sendRedirect(request.getContextPath()+"/home");
			
		}
}
}