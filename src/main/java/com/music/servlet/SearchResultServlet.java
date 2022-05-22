package com.music.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.music.util.MusicDBUtil;
import com.music.model.RegularUser;
import com.music.model.Song;
import com.music.util.RegularUserDBConnect;

@WebServlet("/SearchResultServlet")
public class SearchResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String keyword = request.getParameter("keyword");
		
		HttpSession session = request.getSession();
		session.setAttribute("keyword", keyword);
		String userName = (String) session.getAttribute("uname");

		try {
			List<Song> searchResult = MusicDBUtil.getSearchResult(keyword);
			request.setAttribute("searchResult", searchResult);
			
			List<RegularUser> userDetails = RegularUserDBConnect.getUserDetails(userName);
			request.setAttribute("userDetails", userDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("search-result.jsp");
			dis.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
