package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Song;
import model.User;
import services.OnlineMusicDAO;

@WebServlet({"/loginUser", "/dashboard", "/registerUser"})
public class OnlineMusicController extends HttpServlet{
	
	OnlineMusicDAO dao = new OnlineMusicDAO();
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException {
		String act=req.getServletPath();  
		
		switch(act) {
		case "/loginUser":
			System.out.println("Login Clicked" +act);
			checkLogin(req,res);
			break;
		case "/dashboard":
			showDashboard(req,res);
			break;
		case "/registerUser":
			registerUser(req,res);
			break;
		}
		
	}	

	private void registerUser(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String name=req.getParameter("uname");
		String adress=req.getParameter("uaddress");
		String email=req.getParameter("uemail");
		String password=req.getParameter("upass");
		
		User us=new User(name,adress,email,password);
		
		dao.registerUser(us);
		
		System.out.println("User Registration Successfull...!");
			res.sendRedirect("dashboard");
	}




	private void showDashboard(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<Song> sList = new ArrayList<>();
		
		sList = dao.getAllSong();
		req.setAttribute("sl",sList);
		RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
		rd.forward(req, res);
		
	}

	private void checkLogin(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String un=req.getParameter("uname");
		String up=req.getParameter("upass");
	
		
	if(dao.userCheck(un,up)) {
		System.out.println("Login success");
		res.sendRedirect("userdashboard.jsp");
	}
	else {
		System.out.println("Wrong Credentials");
		res.sendRedirect("userlogin.jsp");
		}	
	}
}
