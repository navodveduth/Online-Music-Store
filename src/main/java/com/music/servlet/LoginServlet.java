package com.music.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.music.util.RegularUserDBConnect;
import com.music.util.MusicDBUtil;
import com.music.model.RegularUser;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		String userName = request.getParameter("username");
		String password = request.getParameter("password");

		HttpSession session = request.getSession();
		session.setAttribute("uname", userName);

		boolean isTrue;

		isTrue = MusicDBUtil.validate(userName, password);

		if (isTrue == true) {
			List<RegularUser> userDetails = RegularUserDBConnect.getUserDetails(userName);
			request.setAttribute("userDetails", userDetails);

			RequestDispatcher dis = request.getRequestDispatcher("artist_dashboard.jsp");
			dis.forward(request, response);

		} else {
			out.println("<script type='text/javascript'>");
			out.println("alert('Your username or password is incorrect');");
			out.println("location='login.jsp'");
			out.println("</script>");
		}
	}

}
